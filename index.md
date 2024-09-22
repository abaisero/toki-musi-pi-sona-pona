---
layout: page
title: toki & musi pi (sona & pona)
---

## {% sitelen o luka e lipu & ni %}

{% for fable in site.fables -%}
- <a href="{{ fable.url | relative_url }}">{% sitelen variable: fable.sitelen -%}</a>
{% endfor %}

## {% sitelen sona pi (lipu & ni) %}

{% sitelenblock %}
toki.
mi kama sona e toki & pona.
toki & musi pi (sona & pona) li pona tawa mi.
{mi sitelen e toki musi}, la mi kama sona.
pona & a!
{% endsitelenblock %}
