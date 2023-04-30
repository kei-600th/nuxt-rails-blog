<template>
  <div>
    <AddArticle @submit="addArticle" />
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
    },
  };

</script>

<style>
</style>
