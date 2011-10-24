sendMessage = ->
  if document.getElementById("new_message")
    message_form = document.getElementById("new_message")
    message_button = document.getElementById("phrase")
    loading = document.getElementById("loading")
    message_form.onsubmit = ->
      loading.style.display = "inline-block"
      message_form.onsubmit = ->
        message_button.setAttribute("disabled","disabled")
      
window.onload = ->
  sendMessage()
