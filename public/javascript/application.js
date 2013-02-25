$(document).ready(function(){
  $('#home-form').submit(function(e) {
    e.preventDefault();
    $.ajax({
      type: this.method,
      url:  this.action,
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data, status, xhr) {
        if (data.user === null)
          {
            $('.list-of-urls').append("<div class='url-list'><li><span class='element'>Url:</span><a href=/urls/" + data.url.url.short + ">" + data.url.url.short + "</a></li><li><span class=element>Click Count:</span>" + data.url.url.click_count + "</li></div>")
          }
        else
          {
           $('.list-of-urls').append("<div class='url-list'><li><span class='element'>Url:</span><a href=/urls/" + data.url.url.short + ">" + data.url.url.short + "</a></li><li><span class=element>Click Count:</span>" + data.url.url.click_count + "</li><li><span class='element'>User:</span> <a href=/users/" + data.user.user.id + ">" + data.user.user.first_name + data.user.user.last_name + "</a></li></div>")
          }
        $('#home-form input#long').val('')  
      }
    })
  });
});


   // <li><span class='element'>Url:</span> <a href="/urls/<%= url.short %>"><%= url.short %></a></li>
   //    <li><span class='element'>Click Count:</span> <%= url.click_count %></li>
         
       // <% end %>


   
