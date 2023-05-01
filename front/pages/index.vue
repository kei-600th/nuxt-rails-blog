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
    },
  };

</script>

<style>
</style>
