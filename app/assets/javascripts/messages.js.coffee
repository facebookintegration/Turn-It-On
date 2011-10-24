sendMessage = ->
  if document.getElementById("new_message")
    message_form = document.getElementById("new_message")
    loading = document.getElementById("loading")
    message_form.onsubmit = ->
      loading.style.display = "inline-block";
      message_form.onsubmit = ->
        message_form.removeAttribute("data-remote")
        false
      
window.onload = ->
  sendMessage()
