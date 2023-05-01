<template>
  <v-card>
    <v-card-title>
      Article List
      <v-spacer></v-spacer>
      <v-text-field v-model="search" label="Search" single-line hide-details></v-text-field>
    </v-card-title>
    <v-data-table :headers="headers" :items="articles" :search="search">
        <template v-slot:[`item.title`]="{ item }">
          <div @click="showArticle(item)">{{ item.record.title }}</div>
        </template>
    </v-data-table>

    <v-dialog v-model="showModal">
      <v-card>
        <v-card-title>{{ selectedArticleTitle }}</v-card-title>
        <v-card-text>{{ selectedArticleContent }}</v-card-text>
      </v-card>
    </v-dialog>

  </v-card>
</template>

<script>
export default {
  props: ["articles"],
  data() {
    return {
      search: "",
      showModal: false,
      selectedArticleTitle: null,
      selectedArticleContent: null,
      headers: [
        {
          text: "タイトル",
          align: "left",
          sortable: false,
          value: "title"
        },
      ]
    };
  },
  methods: {
    showArticle(article) {
      this.selectedArticleTitle = article.record.title;
      this.selectedArticleContent = article.record.content;
      this.showModal = true;
    },
  }
};
</script>

<style>
</style>
