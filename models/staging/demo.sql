{% for i in range(10) %}

    select {{ i }} as runmber
    {% if not loop.last %}
        union all
    {% endif %}

{% endfor %}
