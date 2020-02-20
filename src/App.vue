<template>
  <div id="app">
    <CodeHeader></CodeHeader>
    <CodeInput v-on:addCode="addCode"></CodeInput>
    <CodeList v-bind:propsdata="codeList" v-on:removeCode="removeCode"></CodeList>
    <CodeFooter></CodeFooter>
  </div>
</template>

<script>
  import CodeHeader from "./components/CodeHeader";
  import CodeInput from "./components/CodeInput";
  import CodeList from "./components/CodeList";
  import CodeFooter from "./components/CodeFooter";
  import axios from "axios";

  export default {
    data() {
      return {
        codeList: []
      }
    },
    methods: {
      refreshCodeList() {
        axios
          .get('http://api.remembercode.com/codes')
          .then(response => {
            this.codeList = response.data;
          })
          .catch(err => console.log(err));
      },
      addCode(code) {
        axios
          .post("http://api.remembercode.com/codes", code)
          // eslint-disable-next-line no-unused-vars
          .then(response => {
            this.refreshCodeList();
          })
          .catch(err => console.log(err));
      },
      removeCode(codeID) {
        axios
          .delete("http://api.remembercode.com/codes/" + codeID)
          // eslint-disable-next-line no-unused-vars
          .then(response => {
            this.refreshCodeList();
          })
          .catch(err => console.log(err));
      }
    },
    created() {
      this.refreshCodeList();
    },
    components: {
      'CodeHeader': CodeHeader,
      'CodeInput': CodeInput,
      'CodeList': CodeList,
      'CodeFooter': CodeFooter,
    }
  }
</script>

<style>
  body {
    text-align: center;
    background-color: #323640;
  }
  input {
    border-style: groove;
    width: 200px;
  }
  button {
    border-style: groove;
  }
  .shadow {
    box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.03)
  }
</style>