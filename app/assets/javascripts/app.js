$( document ).ready(function() {
    console.log( "loaded bro!" );
    var venueID = $('#venue').text();
    // Get the context of the canvas
    ctx = $("#myChart").get(0).getContext("2d");
    // Get the first returned node in the jQuery collection
    // Visitor Data from the DOM
    var jsonData = $.parseJSON($('#visitor-data').text());


    // Data for the chart
    data = {
      labels: [],
      datasets: [
        {
            label: "My dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: []
        }
      ]
    };
    addDataToChart(jsonData);
    createChartWithData();
});

function addDataToChart(jsonData){
  for(i=0; i < jsonData.length; i++){
    data["labels"].push(jsonData[i]["js_time"]);
  }
  for(x=0; x < jsonData.length; x++){
    data["datasets"][0]["data"].push(jsonData[x]["current_visitors"]);
  }
}

function createChartWithData(){
  // Line Chart instantiated with data and options
  var myLineChart = new Chart(ctx).Line(data, {
    bezierCurve: false
  });
}
