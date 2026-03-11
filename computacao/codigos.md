<script>
  document.querySelectorAll('pre').forEach(function(pre) {
    var btn = document.createElement('button');
    btn.className = 'copy-btn';
    btn.textContent = 'copiar';
    pre.appendChild(btn);
    btn.addEventListener('click', function() {
      var code = pre.querySelector('code');
      navigator.clipboard.writeText(code ? code.textContent : pre.textContent);
      btn.textContent = 'copiado!';
      setTimeout(function() { btn.textContent = 'copiar'; }, 2000);
    });
  });
</script>