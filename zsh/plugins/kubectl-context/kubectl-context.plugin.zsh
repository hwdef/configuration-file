# Check if kubectl is installed
if ! command -v kubectl >/dev/null 2>&1; then
  return
fi

KUBE_CONTEXT_PROMPT_PREFIX=" 🌊%{$fg[blue]%}"
KUBE_CONTEXT_PROMPT_SUFFIX="%{$reset_color%}"

# Get kubectl context and format it for the prompt
kube_context_prompt_info() {
  local KUBE_CONTEXT
  KUBE_CONTEXT=$(kubectl config current-context 2>/dev/null)
  if [ -n "$KUBE_CONTEXT" ]; then
    echo -n "${KUBE_CONTEXT_PROMPT_PREFIX}${KUBE_CONTEXT}${KUBE_CONTEXT_PROMPT_SUFFIX}"
  fi
} 