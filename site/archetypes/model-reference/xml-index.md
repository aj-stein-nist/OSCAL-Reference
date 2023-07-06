---
title: "OSCAL {{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Index"
heading: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Index"
weight: 70
generateanchors: false
sidenav:
  title: XML Index
toc:
  enabled: true
  headingselectors: "h1.toc1"
{{ if eq (getenv "HUGO_REF_LATEST") "true" }}
aliases:
  - /models/latest/{{ getenv "HUGO_MODEL_ID" }}/xml-index/
{{ end }}
---

The following is an index of each XML element and attribute used in the [XML format](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/xml/schema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_schema.xsd) for this [model](https://pages.nist.gov/OSCAL/concepts/layer/{{ getenv "HUGO_LAYER_ID" }}/{{ getenv "HUGO_MODEL_ID" }}/). Each entry in the index lists all uses of the given element or attribute in the format, which is linked to the corresponding entry in the [XML Format Reference](../xml-reference/). Each entry also lists the formal name for the given element or attribute which is linked to the corresponding XML type in the [XML Format Metaschema Reference](../xml-definitions/).

{{< rawhtml >}}
{{ os.ReadFile (printf "%s/%s" (getenv "HUGO_MODEL_DATA_DIR") "xml-index.html") }}
{{< /rawhtml >}}