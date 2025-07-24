{{- define "springboot-demo.name" -}}
springboot-demo
{{- end }}

{{- define "springboot-demo.fullname" -}}
{{ .Release.Name }}-{{ include "springboot-demo.name" . }}
{{- end }}

{{/* alias: tests에서 사용하는 springboot-demo-chart.fullname */}}
{{- define "springboot-demo-chart.fullname" -}}
  {{ include "springboot-demo.fullname" . }}
{{- end }}

{{- define "springboot-demo.labels" -}}
app.kubernetes.io/name: {{ include "springboot-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* alias: tests에서 사용하는 springboot-demo-chart.labels */}}
{{- define "springboot-demo-chart.labels" -}}
  {{ include "springboot-demo.labels" . | indent 2 }}
{{- end }}

{{- define "springboot-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "springboot-demo.name" . }}
{{- end }}