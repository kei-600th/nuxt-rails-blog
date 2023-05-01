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
        <v-card-title>
          <v-text-field
            v-model="selectedArticleTitle"
          ></v-text-field>
        </v-card-title>
        <v-card-text>
          <v-textarea
            v-model="selectedArticleContent"
          ></v-textarea>
        </v-card-text>
        <v-card-actions>
          <v-btn variant="outlined">
            更新
          </v-btn>
          <v-btn variant="outlined">
            破棄
          </v-btn>
        </v-card-actions>
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