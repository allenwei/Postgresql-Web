$(document).ready(function(){
  $("#table_list .list-group-item").click(function(){
      $("#main_content").show();
      $("#table_list .list-group-item.active").removeClass("active");
      $(this).addClass("active");
      var tab = $("#main_content a[href=#schema]");
      var url = tab.data("url");
      $.get(url, {"table_name": activeTableName()}, function(result){      
        $("#schema").html(result);
        tab.tab('show');
      });
  });
  
  $("#main_content a[href=#data]").click(function() {
      var tab = $("#main_content a[href=#data]");
      var url = tab.data("url");
      $.get(url, {"table_name": activeTableName()}, function(result){      
        $("#data").html(result);
        tab.tab('show');
      });
  });
  
  
  function setupDataPagination() {
    $("#data").delegate(".pagination li", "click", function(){
      var url = $(this).find("a").data("url");
      $.get(url, {"table_name": activeTableName()}, function(result){      
        $("#data").html(result);
      });
    });
  };
  
  function setupEditor() {
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/clouds");
    editor.getSession().setMode("ace/mode/sql");
    
    $("#btn_execute").click(function(){
      var url = $(this).data("url");
      var sql = editor.getValue();
      $.post(url, {"query": sql}, function(result){
        $("#query_result").html(result);
        $("#editor_error_msg").html("");
      })
      .fail( function(xhr, textStatus, errorThrown) {
        $("#editor_error_msg").html("<div class='alert alert-danger'>" + xhr.responseText + "</div>");
      });
    });
  };

    
 
  
  function activeTableName() {
    return $("#table_list .list-group-item.active").data("table-name");
  };
  
  setupDataPagination();
  setupEditor();

  
});