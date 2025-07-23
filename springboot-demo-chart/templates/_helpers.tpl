{{/*
Common labels
*/}}
{{- define "springboot-demo-chart.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "springboot-demo-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service account name
*/}}
{{- define "springboot-demo-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "springboot-demo-chart.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end }}

{{/*
Full name
*/}}
{{- define "springboot-demo-chart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}