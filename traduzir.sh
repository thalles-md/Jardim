#!/bin/bash

# 1. Criar estrutura de pastas na raiz
mkdir -p layouts/_default layouts/taxonomy layouts/about layouts/page

# 2. Copiar os arquivos originais do tema para a raiz (Overrides)
cp themes/void/layouts/_default/list.html layouts/_default/
cp themes/void/layouts/taxonomy/category.terms.html layouts/taxonomy/
cp themes/void/layouts/taxonomy/tag.html layouts/taxonomy/
cp themes/void/layouts/taxonomy/tag.terms.html layouts/taxonomy/ 2>/dev/null || true
cp themes/void/layouts/about/single.html layouts/about/ 2>/dev/null || true
cp themes/void/layouts/page/about.html layouts/page/ 2>/dev/null || true

# 3. Marretar as traduções usando sed (substitui a lógica Hugo pelo texto puro)
# Traduz o "Ler mais"
sed -i 's/{{ i18n "list_read_more" | default "阅读全文" }}/Ler mais/g' layouts/_default/list.html
sed -i 's/{{ i18n "list_read_more" | default "阅读全文" }}/Ler mais/g' layouts/taxonomy/tag.html

# Traduz as Categorias
sed -i 's/{{ i18n "categories_help_text" | default "Click any category to expand or collapse articles" }}/Clique em uma categoria para ver os artigos/g' layouts/taxonomy/category.terms.html

# Traduz as Tags (ajustando a lógica de aspas comum nesse tema)
sed -i 's/{{ i18n "tags_help_text" | default "Click on any tag to view related articles" }}/Clique em uma tag para ver artigos relacionados/g' layouts/taxonomy/tag.terms.html

# Traduz o "Back to Home" em todos os arquivos copiados
find layouts/ -type f -exec sed -i 's/{{ i18n "back_to_home" | default "Back to Home" }}/Voltar ao Início/g' {} +

echo "Tradução concluída! Reinicie o hugo server."
