<template>
    <div class="footer-box">
        <p>포트폴리오 설명 : 기억하고 싶은 코드를 저장하는 웹서비스 입니다.</p>
        <p>* 백엔드 : Go + Nginx + MongoDB
            <br>
            * 백엔드 배포환경: AWS EC2 centOS 머신 1대에 도커스웜으로 배포
            <br>
            <br>
            * 프론트엔드 : Vuejs
            <br>
            * 프론트엔드 배포환경 : AWS S3 버킷 정적호스팅 서비스로 배포
            </p>
        <p>Go프로젝트 git (<a href="https://github.com/joylucky428/remember_code">https://github.com/joylucky428/remember_code</a>)
            <br>
            vue프로젝트 git (<a href="https://github.com/joylucky428/remember_code_vue">https://github.com/joylucky428/remember_code_vue</a>)
            <br>
            Docker hub (<a href="https://hub.docker.com/u/joylucky">https://hub.docker.com/u/joylucky</a>)
        </p>
        <p>구름 인프라엔지니어 신입 지원
            <br>
            김유리 (joylucky@protonmail.com / 010-2973-9992)
            <br>감사합니다!</p>
    </div>
</template>

<script>
    export default {
        name: "CodeFooter"
    }
</script>

<style scoped>
    .footer-box {
        text-align: left;
        padding: 20px;
        margin: 10px;
        background: #1c1e23;
        border-radius: 5px;
    }
    p {
        color: azure;
    }
    a {
        color: aquamarine;
    }
</style>