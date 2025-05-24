{% macro find_datatypes(model) %}
    {% set cols=adapter.get_columns_in_relation(model) %}
    {%- for col in cols %}
      - name: {{ col.name | lower }}
        data_type: {{ col.dtype | lower }}
    {%- endfor %}
{% endmacro %}