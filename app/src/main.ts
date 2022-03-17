import { createApp } from "vue";
import VueKeycloakJs from "@dsb-norge/vue-keycloak-js";
import App from "./App.vue";
import { KeycloakInstance } from "keycloak-js";
import { VueKeycloakInstance } from "@dsb-norge/vue-keycloak-js/dist/types";

createApp(App)
  .use(VueKeycloakJs, {
    init: {
      // onLoad = "check-sso" | "login-required"
      // Use 'login-required' to always require authentication
      // If using 'login-required', there is no need for the router guards in router.js
      onLoad: "check-sso",
      // silentCheckSsoRedirectUri:
      //   window.location.origin + "/silent-check-sso.html",
    },
    config: {
      url: "http://localhost:8080",
      clientId: "vue-client",
      realm: "Creoox SSO Demo",
      // url: process.env.VUE_APP_KEYCLOAK_ADDRESS,
      // clientId: process.env.VUE_APP_KEYCLOAK_CLIENT_ID,
      // realm: process.env.VUE_APP_KEYCLOAK_REALM,
    },
    onReady(keycloak: KeycloakInstance) {
      console.log("Keycloak ready", keycloak);
    },
  })
  .mount("#app");

declare module "@vue/runtime-core" {
  interface ComponentCustomProperties {
    $keycloak: VueKeycloakInstance;
  }
}
