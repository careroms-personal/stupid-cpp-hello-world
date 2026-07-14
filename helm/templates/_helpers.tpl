{{- define "clock-trigger.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "clock-trigger.fullname" -}}
{{- if .Release.Name | eq .Chart.Name -}}
{{- .Chart.Name -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "clock-trigger.labels" -}}
app.kubernetes.io/name: {{ include "clock-trigger.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "clock-trigger.selectorLabels" -}}
app.kubernetes.io/name: {{ include "clock-trigger.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
