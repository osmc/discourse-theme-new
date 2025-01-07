import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "osmc-header-icon-links",
  initialize() {
    withPluginApi("0.8.41", (api) => {
      try {
        let osmcLinks = [];

        osmcLinks.push({ href: "https://osmc.tv/", className: "header-link", label: "Home" });
        osmcLinks.push({ href: "https://osmc.tv/blog", className: "header-link", label: "Blog" });
        osmcLinks.push({ href: "https://osmc.tv/about", className: "header-link", label: "About" });
        osmcLinks.push({ href: "https://osmc.tv/download", className: "header-link", label: "Download" });
        osmcLinks.push({ href: "https://osmc.tv/wiki", className: "header-link", label: "Wiki" });
        osmcLinks.push({ href: "https://osmc.tv/contact", className: "header-link", label: "Contact" });
        osmcLinks.push({ href: "https://github.com/osmc/osmc", className: "header-link", label: "GitHub" });
        osmcLinks.push({ href: "https://osmc.tv/wiki/development/reporting-bugs", className: "header-link", label: "Report Bugs" });
        osmcLinks.push({ href: "https://osmc.tv/store", className: "header-link", label: "Shop" });
        osmcLinks.push({ href: "https://osmc.tv/vero", className: "header-link big pink", label: "Vero 4K +" });
        osmcLinks.push({ href: "https://my.osmc.tv/login/?redirect_to=https://my.osmc.tv/my-account/", className: "header-link big blue", label: "My Account" });

        osmcLinks.forEach((link) => {
            const linkTemplate = 
            <template>
                <a
                    class={{link.className}}
                    href={{link.href}}
                >
                    {{link.label}}
                </a>
            </template>;
            api.headerIcons.add("osmc", linkTemplate, { before: "search" });
        });
      } catch (error) {
        // eslint-disable-next-line no-console
        console.error(
          error,
          "There's an issue in the header icon links component. Check if your settings are entered correctly"
        );
      }
    });
  },
};