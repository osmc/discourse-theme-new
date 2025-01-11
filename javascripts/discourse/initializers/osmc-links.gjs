import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "osmc-header-icon-links",
  initialize() {
    withPluginApi("0.8.41", (api) => {
      try {
        let osmcLinks = [];

        osmcLinks.push({ href: "https://osmc.tv/", className: "header-link", label: "Home" });
        osmcLinks.push({ href: "https://osmc.tv/about", className: "header-link", label: "About" });
        osmcLinks.push({ href: "https://osmc.tv/blog", className: "header-link", label: "Blog" });
        osmcLinks.push({ href: "https://osmc.tv/download", className: "header-link", label: "Download" });
        osmcLinks.push({ label: "Support", sublinks: [{ href: "https://discourse.osmc.tv", className: "header-sublink", label: "Community" },{ href: "https://osmc.tv/wiki", className: "header-sublink", label: "Wiki" },{ href: "https://osmc.tv/contact", className: "header-sublink", label: "Contact" }]});
        osmcLinks.push({ label: "Contribute", sublinks: [{ href: "https://github.com/osmc/osmc", className: "header-sublink", label: "GitHub" },{ href: "https://osmc.tv/wiki/development/reporting-bugs", className: "header-sublink", label: "Report Bugs" }]});
        osmcLinks.push({ href: "https://osmc.tv/store", className: "header-link", label: "Shop" });
        osmcLinks.push({ href: "https://osmc.tv/vero", className: "header-link big pink", label: "Vero V" });
        osmcLinks.push({ href: "https://my.osmc.tv/login/?redirect_to=https://my.osmc.tv/my-account/", className: "header-link big blue", label: "My Account" });
        
        let headerIcons = [];
        let sublinks = [];

        osmcLinks.forEach((link) => {
            if(link.sublinks){
                link.sublinks.forEach((sublink) => {
                    const sublinkTemplate = 
                    <template>
                        <a
                            class={{sublink.className}}
                            href={{sublink.href}}
                        >
                            {{sublink.label}}
                        </a>
                    </template>;
                    sublinks.push(sublinkTemplate);
                });
                const linkTemplate = 
                    <template>
                        <div class="header-link with-child">
                            {{link.label}}
                            <div
                                class="header-links-wrapper"
                            >
                                {{#each sublinks as |sublink|}}{{sublink}}{{/each}}
                            </div>
                        </div>
                    </template>;
                headerIcons.push(linkTemplate);
				sublinks = [];
            } else {
                const linkTemplate = 
                <template>
                    <a
                        class={{link.className}}
                        href={{link.href}}
                    >
                        {{link.label}}
                    </a>
                </template>;
                headerIcons.push(linkTemplate);
            }
        });
        api.headerIcons.add("osmc", <template><div class="header-links-wrapper clearfix">{{#each headerIcons as |icon|}}{{icon}}{{/each}}</div></template>, { before: "search" });
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