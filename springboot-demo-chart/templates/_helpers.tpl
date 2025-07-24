{{- define "springboot-demo.name" -}}
springboot-demo
{{- end -}}

{{- define "springboot-demo.fullname" -}}
{{ .Release.Name }}-{{ include "springboot-demo.name" . }}
{{- end -}}

{{- define "springboot-demo.labels" -}}
app.kubernetes.io/name: {{ include "springboot-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service | default "Helm" }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "springboot-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "springboot-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "springboot-demo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "springboot-demo.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/* --- (선택) tests 등에서 오래된 이름을 쓴다면 alias 유지 --- */}}
{{- define "springboot-demo-chart.fullname" -}}
{{ include "springboot-demo.fullname" . }}
{{- end -}}

{{- define "springboot-demo-chart.labels" -}}
{{ include "springboot-demo.labels" . }}
{{- end -}}