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
        fill: "#000"
    });
    var rightEye = paper.circle(140, 80, 15);
    rightEye.attr({
        fill: "#000"
    });
    //First (x,y) = starting point; 
    //Second(x,y) = where the curve starts; 
    //Third(x,y) = where the curve actually ends up
    //Last(x,y) = End point;
    var i = 0;
    var smile = paper.path("M50,140 C70,170 140,170 160,140");
 	var barPaper = Raphael(250, 20, 700, 500);
    var array = [[55, 20, 13, 32, 5, 1, 2, 10], [10, 2, 10, 5, 32, 13, 20, 70]];
    var label = function(){
    	i++;
    	console.log(i);
    	if (i%2 == 0){
    		this.flag = barPaper.label(this.bar.x , 360, this.bar.value || "0").insertBefore(this);
    	}
    	else
    	{
    		this.flag = barPaper.label(this.bar.x , this.bar.y - 20, this.bar.value || "0").insertBefore(this);
    	}
    	//console.log([this.bar.x , this.bar.y , this.bar.value]);

    }
    //Creates Paper that is 700 x 300 at 250,50
    var test = barPaper.barchart(0, 100, 620, 260, array, {
    	stacked: true, 
    	type: "soft", 
    	colors:["#00CE0D", "#C10A0A"]
	}).each(label);
    //barPaper.popup(this.bar.x, this.bar.y, this.bar.value || "0").insertBefore(this);
});
