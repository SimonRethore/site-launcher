<template>
  <router-view/>
</template>

<style lang="scss">
body{
  margin: 0;
}

@font-face {
  font-family: "LuckiestGuy";
  src: url("@/assets/fonts/LuckiestGuy-Regular.ttf") format("truetype");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "Rubik";
  src: url("assets/fonts/Rubik-Bold.ttf") format("truetype");
  font-weight: bold;
  font-style: normal;
}

@font-face {
  font-family: "Icomoon";
  src: url("assets/fonts/Icomoon.ttf") format("truetype");
  font-weight: normal;
  font-style: normal;
}

[class^="icon-"],
[class*=" icon-"] {
  /* use !important to prevent issues with browser extensions that change fonts */
  font-family: "Icomoon" !important;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;

  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.icon-prod:before {
  content: "\e900";
}
.icon-dev:before {
  content: "\e901";
}
.icon-preprod:before {
  content: "\e902";
}
</style>
