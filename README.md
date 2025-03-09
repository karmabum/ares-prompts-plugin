# Ares BINGO / Prompts Plugin
Generates RP prompts and BINGO cards.

# Credits
KarmaBum @ AresCentral

# Overview
This plugin has two functions: It outputs a short list of random RP prompts and uses the same list to create a roleplay BINGO card.

Using the `prompts [#]` command, players can see a list of random RP prompts, up to [#] (default is 5).  Using the `bingo` command, they can create a copy-paste friendly BINGO sheet.

This plugin is designed to work with the webportal.  You will need to update your custom-routes.js to activate the bingo and prompts pages.

## 

# Installation

In the game, run: `plugin/install https://github.com/karmabum/ares-prompts-plugin`

## Updating Custom Files

If you don't have any edits to your custom-routes.js already, you can replace it with the custom_files/custom-routes.js.  Otherwise, you need to add:

````
router.route('prompts');
router.route('bingo');
````

## Adding Menu Items to the Webportal

Add the updated routes to your menu using:

```
    - title: 'Random Scene Prompts'
      route: prompts
    - title: 'RP Bingo Card'
      route: bingo
```

You can then navigate to "yourgame.com/prompts" and "yourgame.com/bingo" to view those pages.

## Adding and Awarding Achievements

This doesn't automatically award achievements.  There are two general achievements configured - one for getting a BINGO and one for getting a blackout.  You can add whatever other ones you want using the same format.  You can award them using the existing achievement command:

`achievement/add <list of names>=<achievement_name>` - e.g., `achievement/add Bill Sue=bingo`

# Configuration

After installation, check the prompts.yml config files and update **rp_prompts** to suit your theme.

# License

Same as [AresMUSH](https://aresmush.com/license).
