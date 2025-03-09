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

## Bingo CSS

Some recommended styling to make the Bingo table look right.

````
.rp-bingo table {
    text-align: center;
    width: 100%;
}

.rp-bingo td {
    border: 1px solid;
    width: 20%;
}

.rp-bingo-card td {
    width: 20%;
}

/* This should highlight any cells that are linked, have the strinke or delete tags, and the FREE SPACE so they stand out as complete. */

.rp-bingo td:has(a), .rp-bingo td:has(strike), .rp-bingo td:has(del), .rp-bingo tr:nth-of-type(3) td:nth-of-type(3) {
    background-color: red; /* Change this to whatever color you want to highlight completed cells. */
}

.rp-bingo-card {
    text-align: center;
    width: 100%;
    border: 1px solid;
}
````

# Configuration

After installation, check the prompts.yml config files and update **rp_prompts** to suit your theme.

# License

Same as [AresMUSH](https://aresmush.com/license).
