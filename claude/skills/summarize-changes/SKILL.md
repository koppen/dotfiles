---
name: "summarize-changes"
description: "Generates a human readable changelog based on closed pull requests in a GitHub project."
---

# Summarize changes

## Workflow

1. Ask for a GitHub repository.
2. Ask for a timeframe, for example a month or a week, or a milestone.
3. Ask for the language to use.
4. Look at the pull requests merged in the selected timeframe and use them to generate a human readable changelog in the chosen language.
5. After the summary of changes add an overview of the projects upgrade level.

## How to generate a summary

Write as succintly and non-technical as possible; the target audience is non-technical stakeholders.

Group the pull requests by the nature of their changes. All version bumps should just go into their own category and be listed with the name of the upgrade. Security patches should be grouped on their own.

For general changes, group the change under the kind of change; is this a new feature, a a usability improvement, a bugfix, a performance optimization, documentation?

Each change gets its own bullet point under the group header.

A change is only a performance optimization if it is explicitly mentioned in the pull request.

For security patches, include the CVE in the description, perhaps even with a link to it.

For version updates, just list all the libraries in one long list in a single bullet instead of a bullet for each library, sorted alphabetically. Dig into each pull request to find the name of the library if necessary.

Ecosystem upgrades, like Ruby and Node etc, gets their own bullet with the final version listed.

Don't mention things not included.

## How to generate the project upgrade level overview

Look at the libraries currently used by the project. Count the number of them. Then figure out how many of those are not the latest version. Only count direct dependencies.

Use this information to provide a highlevel assessment of the project's upgrade level for each library ecosystem.

## Example

> Hermed et kort overblik over, hvad vi har fået kigget på i løbet af november 2024:
>
> Brugervenlighed
>
> * "Klubben" hedder nu "Medlemskab" i navigationen som default.
>
> * Alle bannere, der reklamerer for klubben, er blevet opdateret, så de fokuserer på at være medlem af Børn i byen og ikke af "Klubben".
>
> * Grafikken på app-annonce-banneret er ændret til en ny, der ikke referer "Klubben".
>>
> SEO
>
> * Alle forekomster af et arrangement bruger nu den samme canonical URL. Det skulle gerne minimere antallet af URLer i Google og øge sandsynligheden for at Google viser noget relevant.
>
> Fejlrettelser
>
> * Faktabokse viser nu igen deres titler.
>
> * I forbindelse med ændringer i velkomst e-mailen havde der sneget sig nogle HTML tags ind. Da vores mails udelukkende sendes i text-format, vil HTML tags vises som rå tags, så dem har vi fjernet igen.
>
> Opdateringer
>
> * Følgende bagvedliggende software biblioteker er blevet opdateret til nyere versioner: @babel/eslint-parser, acts_as_list, cross-spawn, paper_trail, rubocop, rubocop-rails, rubocop-rspec, selenium-webdriver, view_component.
>
> Opgraderingsstatus
>
> * Ruby: Vi har i alt 191 afhængigheder. Heraf trænger 42 til opgradering, dvs 22%.
> * JavaScript: Vi har i alt 120 afhængigheder. Heraf trænger 30 til opgradering, dvs 25%.
