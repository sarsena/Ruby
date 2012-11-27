//JS for Raphael graph
$(function(){
// Creates canvas 320 × 200 at 10, 50
    var paper = Raphael(10, 50, 320, 300);

    // Creates circle at x = 50, y = 40, with radius 10
    var circle = paper.circle(105,105, 100);
    // Sets the fill attribute of the circle to red (#f00) and stroke to white
    circle.attr({
        fill: "#F8F01A",
        stroke: "#000"
    });
    var leftEye = paper.circle(70, 80, 15);
    leftEye.attr({
        fill : "#000"
    });
    var rightEye = paper.circle(140, 80, 15);
    rightEye.attr({
        fill:"#000"
    });
    //First (x,y) = starting point; 
    //Second(x,y) = where the curve starts; 
    //Third(x,y) = where the curve actually ends up
    //Last(x,y) = End point;
    var smile = paper.path("M50,140 C70,170 140,170 160,140");

    //Creates Paper that is 700 x 300 at 250,50
    var barPaper = Raphael(250, 50, 700, 300);

    barPaper.barchart(0, 0, 620, 260, [76, 70, 67, 71, 69], {});
});
