---
layout: page
title: toki musi pi sona pona
---

toki.
mi kama sona e toki pona.
toki musi li pona tawa mi.
mi sitelen e toki musi pi sona pona, la mi kama sona.
pona a!

## toki musi li lon

{% for fable in site.fables -%}
- <a href="{{ fable.url | relative_url }}">{{ fable.title }}</a>
{% endfor %}
