
size(378, 270);
background(0);
smooth();
strokeWeight(8);
stroke(255, 255, 255, 170);

//Vertikal
line(54, 0, 54, 280); 
line(108, 0, 108, 270);
line(162, 0, 162, 270);
line(216, 0, 216, 270);
line(270, 0, 270, 270);
line(324, 0, 324, 270);
//Horizontal
line(0, 54, 378, 54);
line(0, 108, 378, 108);
line(0, 162, 378, 162);
line(0, 216, 378, 216);

//Points
stroke(255, 255, 255);

int rad = 54;
println(rad);

ellipse(54, rad, 5, 5);
ellipse(108, rad, 5, 5);
ellipse(162, rad, 5, 5);
ellipse(216, rad, 5, 5);
ellipse(270, rad, 5, 5);
ellipse(324, rad, 5, 5);


rad = rad * 2;
println(rad);

ellipse(54, rad, 5, 5);
ellipse(108, rad, 5, 5);
ellipse(162, rad, 5, 5);
ellipse(216, rad, 5, 5);
ellipse(270, rad, 5, 5);
ellipse(324, rad, 5, 5);

rad = rad / 2;
rad = rad * 3;
println(rad);

ellipse(54, rad, 5, 5);
ellipse(108, rad, 5, 5);
ellipse(162, rad, 5, 5);
ellipse(216, rad, 5, 5);
ellipse(270, rad, 5, 5);
ellipse(324, rad, 5, 5);

rad = rad / 3;
rad = rad * 4;
println(rad);

ellipse(54, rad, 5, 5);
ellipse(108, rad, 5, 5);
ellipse(162, rad, 5, 5);
ellipse(216, rad, 5, 5);
ellipse(270, rad, 5, 5);
ellipse(324, rad, 5, 5);
