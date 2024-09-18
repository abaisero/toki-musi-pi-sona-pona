---
layout: page
title: lipu nanpa wan
---

{% sitelenblock %}
toki.
mi kama sona e toki & pona.
toki musi pi (sona & pona) li pona tawa mi.
{mi sitelen e toki musi}, la mi kama sona.
pona a!
{% endsitelenblock %}

## toki musi li lon. o luka e ona!

{% for fable in site.fables -%}
- <a href="{{ fable.url | relative_url }}">{% sitelenblock %}{{ fable.title }}{% endsitelenblock %}</a>
{% endfor %}
