
{{- define "name" }}
{{- printf "%s" .Values.default.name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "ns" }}
{{- .Release.Namespace -}}
{{- end }}

{{- define "version" }}
{{- printf "%s" .Values.default.version | trunc 63 | trimSuffix "-" -}}
{{- end }}