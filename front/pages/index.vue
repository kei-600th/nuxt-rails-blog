<template>
  <div>
    <AddArticle @submit="addArticle"/>
    <ArticleList :articles="articles" @upd="updArticle" @dlt="dltArticle" />
  </div>
</template>

<script>
  import AddArticle from "@/components/AddArticle";
  import ArticleList from "@/components/ArticleList";
  import axios from "@/plugins/axios";  

  export default {
    components: {
      AddArticle,
      ArticleList,
    },
    data() {
      return {
        articles: [],
      };
    },
    methods: {
      async addArticle(title) {
        await axios.post("/v1/articles", { title }); 
        await this.getArticle(); 
      },
      async getArticle() {
        await axios.get("/v1/articles")
        .then((res) => {
          const articlesData = res.data;
          this.articles = articlesData.map((data) => {
            return {
              record: data
            }
          });
        }); 
      },
      async updArticle(array) {
        await axios.patch(`/v1/articles/${array.id}`, { id: array.id, title:array.title, content:array.content} ); 
        await this.getArticle(); 
      },
      async dltArticle(id) {
        await axios.delete(`/v1/articles/${id}`, { id} ); 
        await this.getArticle(); 
      },
    },
    mounted() {
      this.getArticle();
    },
  };

</script>

<style>
</style>
