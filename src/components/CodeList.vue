<template>
    <section>
        <br>
        <br>
        <div class="itembox">
            <div class="item shadow" v-for="(code, index) in propsdata" :key="(code, index)">
                <div>
                    <h1>[{{code.CodeType}}] {{code.Title}}</h1>
                </div>
                <div>
                    <small>{{code.Description}}</small>
                </div>
                <div>
                    <code>{{code.CodeString}}</code>
                </div>
                <span class="removeBtn" type="button" v-on:click="removeCode(code, index)">
                    <i class="fa fa-trash-o">remove</i>
                </span>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: "CodeList",
        props: ['propsdata'],
        methods: {
            // eslint-disable-next-line no-unused-vars
            removeCode(code, index) {
                this.$emit("removeCode", code.ID);

            }
        }
    }
</script>

<style scoped>
    section {
        text-align: center;
    }
    .itembox {
        padding-left: 0px;
        margin-top: 0;
        /*width: 800px;*/
        text-align: left;
    }
    .item {
        min-height: 80px;
        /*width: 300px;*/
        margin: 0.5rem;
        padding: 0.9rem;
        background: #1c1e23;
        border-radius: 5px;
    }
    .removeBtn {
        float: right;
        margin-left: auto;
        color: #de4343;
    }
    h1 {
        color: #96a9e6;
        margin: 0;
    }
    small {
        color: #96a9e6;
    }
    code {
        color: white;
    }
</style>