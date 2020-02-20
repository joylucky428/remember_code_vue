#!/usr/bin/env bash

# s3
BUCKET='s3://remembercode.com'
# s3 temporary backup
BACKUP_DIR='./.s3-bucket-backup/'$(date '+%Y%m%d%H%M%S')

function exit_if_fail() {
	if [ $? -ne 0 ]; then
		echo Error: $1
		exit 1
	fi
}

function warning_if_fail() {
	if [ $? -ne 0 ]; then
		echo Warning: $1
	fi
}

function check_command() {
	command -v $1
	exit_if_fail "$1 is not installed."
}


function npm_build() {
  npm run build
	exit_if_fail "npm build fail."
}


function backup_s3() {
	mkdir $BACKUP_DIR
	aws s3 cp $BUCKET $BACKUP_DIR --recursive

	exit_if_fail "Can't not backup s3."
}

function rollback_s3() {
	aws s3 rm $BUCKET --recursive
	warning_if_fail "Can't not remove old files. (rollback)"

	aws s3 cp $BACKUP_DIR $BUCKET --recursive
	exit_if_fail "Can't not rollack!! Backup directory: $BACKUP_DIR"
}

function rollback_if_fail() {
	if [ $? -ne 0 ]; then
		echo Rollback $BUCKET...
		rollback_s3
		echo Error: s3 upload failed. $BUCKET rollbacked.
		exit 1
	fi
}

function upload_s3_dist() {
	aws s3 rm $BUCKET --recursive
	warning_if_fail "Can't not remove old *.js."

	aws s3 cp ./dist ${BUCKET} --recursive --grant read=uri=http://acs.amazonaws.com/groups/global/AllUsers
	rollback_if_fail
}

echo NPM build...
npm_build
echo build : success.

echo Backup from $BUCKET to $BACKUP_DIR...
backup_s3
echo Backup : success.

echo Upload to s3...
upload_s3_dist
echo Upload : success.

echo
echo Deploy complete!