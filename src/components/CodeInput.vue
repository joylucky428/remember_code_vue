<template>
    <div class="inputBox shadow">
        <div>
            <input type="text" v-model="newCodeType" placeholder="Code Type" value="Go">
        </div>
        <div>
            <input type="text" v-model="newCodeTitle" placeholder="Title" value="헬로월드 출력">
        </div>
        <div>
            <input type="text" v-model="newCodeDescription" placeholder="Description" value="콘솔에 메시지를 출력합니다.">
        </div>

        <div>
            <textarea v-model="newCodeString" placeholder='Your code!' value='fmt.Println("Hello, World!"'></textarea>
        </div>
        <div>
            <span class="addContainer" v-on:click="addCode">
                <i class="addBtn fa fa-plus"> ADD</i>
            </span>
        </div>

        <modal v-if="showModal" @close="showModal = false">
            <h3 slot="header">경고</h3>
            <span slot="footer" @click="showModal = false">코드 정보를 모두 입력하세요.
        <i class="closeModalBtn fas fa-times" aria-hidden="true"></i>
      </span>
        </modal>

    </div>


</template>

<script>
    import Modal from './common/Modal.vue'

    export default {
        name: "CodeInput",
        data() {
            return {
                newCodeTitle: '',
                newCodeDescription: '',
                newCodeType: '',
                newCodeString: '',
                showModal: false,
            }
        },
        components: {
            modal: Modal
        },
        methods: {
            addCode() {
                console.log(this.newCodeTitle);

                if (this.newCodeTitle === '' ||
                    this.newCodeDescription === '' ||
                    this.newCodeType === '' ||
                    this.newCodeString === '')
                {
                    this.showModal = !this.showModal;
                }
                else {
                    this.$emit("addCode", {
                        title: this.newCodeTitle,
                        description: this.newCodeDescription,
                        codetype: this.newCodeType,
                        codestring: this.newCodeString
                    });

                    this.clearInput();
                }

            },
            clearInput() {
                this.newCodeTitle = '';
                this.newCodeDescription = '';
                this.newCodeType = '';
                this.newCodeString = '';
            }
        }
    }
</script>

<style scoped>
    input:focus {
        outline: none;
    }
    .inputBox {
        line-height: 45px;
        border-radius: 5px;

    }
    .inputBox div input {
        border-style: none;
        font-size: 0.9rem;
        border-radius: 3px;
        width: 300px;
        height: 25px;
        background: #8d8d8e;
        color: white;
        padding: 5px;
    }
    .inputBox ::placeholder {
        color: #d7d7d7;
    }
    .inputBox div textarea {
        margin-top: 10px;
        border-style: none;
        font-size: 0.9rem;
        border-radius: 3px;
        width: 300px;
        height: 100px;
        background: #8d8d8e;
        color: white;
        padding: 5px;
    }
    .addContainer {
        background: linear-gradient(to right, #53cf75, #2cbdb4);
        display: inline-block;
        width: 200px;
        border-radius: 5px;
    }
    .addBtn {
        color: white;
        vertical-align: middle;
        horiz-align: center;
    }
</style>