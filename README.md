# newcrimeserver


The interesting D3:
  <script>
    var margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;
    var parseDate = d3.time.format("%Y-%m-%d").parse;
        bisectDate = d3.bisector(function(d) { return d.date; }).left;
    var x = d3.time.scale()
        .range([0, width]);
    var y = d3.scale.linear()
        .range([height, 0]);
    var y1 = d3.scale.linear()
        .range([height, 0]);
    var xAxis = d3.svg.axis()
        .scale(x)
        .ticks(15)
        .orient("bottom");
    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");
    var yAxisRight = d3.svg.axis()
        .scale(y1)
        .orient("right");
    var area = d3.svg.area()
        .x(function(d) { return x(d.date); })
        .y0(height)
        .y1(function(d) { return y(d.crimes); });
    var svg = d3.select("body").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    var valueline = d3.svg.line()
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d.crimes); });
    var valueline2 = d3.svg.line()
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y1(d.temperature); });
    var focus = svg.append("g")
        .style("display", "none");

    d3.json('/crimes.json', function (data) {
      data.forEach(function(d) {
        d.date = parseDate(d.crimedate);
        d.crimes = +d.crimes;
        d.temperature = +d.temperature;
      });
    data.sort(function(a, b){  return d3.ascending(a.date, b.date);  });
    x.domain(d3.extent(data, function(d) { return d.date; }));
    y.domain([0, d3.max(data, function(d) { return d.crimes; })]);
    y1.domain([0, d3.max(data, function(d) { return d.temperature; })]);
    svg.append("path")
      .datum(data)
      .attr("class", "area")
      .attr("d", area);
    svg.append("path")
        .attr("class", "valueline")
        .attr("d", valueline(data));
    svg.append("path")
        .attr("class", "valueline2")
        .attr("d", valueline2(data));
    svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);
    svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
      .style("fill", "red")
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Crimes")
      .style("fill", "red")
      .style("font-size", "1.5em");
    svg.append("g")
          .attr("class", "y axis")
          .attr("id", "RAxis")
          .attr("transform", "translate(" + width + " ,0)")
          .style("fill", "green")
          .call(yAxisRight)
        .append("text")
          .attr("transform", "rotate(-90)")
          .attr("y", -16)
          .attr("dy", ".71em")
          .style("text-anchor", "end")
          .text("Temperature")
          .style("fill", "green")
          .style("font-size", "1.5em");
      focus.append("circle")
          .attr("class", "y")
          .style("fill", "#00007A")
          .style("stroke", "#00007A")
          .attr("r", 4);
      focus.append("text")
          .attr("x", 9)
          .attr("dy", ".35em");
      svg.append("rect")
          .attr("width", width)
          .attr("height", height)
          .style("fill", "none")
          .style("pointer-events", "all")
          .on("mouseover", function() { focus.style("display", null); })
          .on("mouseout", function() { focus.style("display", "none"); })
          .on("mousemove", mousemove);
      function mousemove() {
          var x0 = x.invert(d3.mouse(this)[0]),
              i = bisectDate(data, x0, 1),
              d0 = data[i - 1],
              d1 = data[i],
              d = x0 - d0.date > d1.date - x0 ? d1 : d0;
          focus.select("circle.y")
              .attr("transform",
                    "translate(" + x(d.date) + "," +
                                   y(d.crimes) + ")");
          focus.select("text").text(d.date.toString().slice(0,15) + "  Crimes: " + d.crimes + "   Temp: " + d.temperature)
              .attr("transform",
                "translate(" + x(d.date) + "," +
                               y(d.crimes) + ")")
              .style("stroke", "#00007A")
              .style("font-size", "1.5em");
      }
    });
  </script>