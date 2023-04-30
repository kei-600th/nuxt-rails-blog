<template>
  <div>
    <AddArticle @submit="addArticle" @get="getArticle" />
    <ArticleList :articles="articles" />
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
        this.articles.push({
          title
        });
      },
      async getArticle() {
        await axios.get("/v1/articles")
        .then((res) => {
          this.articles.push({
            title: res.data
          });
        }); 
      },
    },
  };

</script>

<style>
</style>
