<h1>CookBook</h1>
<p>Bem-vindo ao maior livro de receitas online</p>

<% @recipes.each do |r| %>
  <h1><%= r.title %>></h1>
  <ul>
    <li><% r.title %></li>
    <li><% r.recipe_type %></li>
    <li><% r.cuisine %></li>
    <li><% r.cook_time %> minutos</li>
  </ul>
<% end %>
