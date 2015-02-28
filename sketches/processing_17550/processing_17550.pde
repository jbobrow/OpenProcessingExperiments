
size(250, 250);
background(#0D57BC); 

//background donuts

smooth();
strokeWeight(20);
noFill();
stroke(200, 50);
ellipse(125, 125, 200, 200);
ellipse(125, 125, 120, 120);
ellipse(125, 125, 40, 40);

//covering right circles blue
fill(#0D57BC); 
noStroke();
triangle(0, 0, 250, 250, 250, 0);

//right side circles
smooth();
strokeWeight(20);
noFill();
stroke(200, 50);
ellipse(125, 125, 160, 160);
ellipse(125, 125, 80, 80);

//LINES 

smooth();
strokeWeight(1);
stroke(255);

//LINES

//octagon outline
//counter clockwise from top center
line(125, 31.25, 62.5, 62.5);
line(62.5, 62.5, 31.25, 125);
line(31.25, 125, 62.5, 187.5);
line(62.5, 187.5, 125, 218.75);
line(125, 218.75, 187.5, 187.5);
line(187.5, 187.5, 218.75, 125);
line(218.75, 125, 187.6, 62.5);
line(187.5, 62.5, 125, 31.25);

//diamond outline
//counter clockwise from top center
line(125, 31.25, 31.25, 125);
line(31.25, 125, 125, 218.75);
line(125, 218.75, 218.75, 125);
line(218.75, 125, 125, 31.25);

//cross
line(125, 31.25, 125, 218.75);
line(31.25, 125, 218.75, 125);
//diagonal cross
line(0, 0, 250, 250);
line(187.5, 62.5, 62.5, 187.5);

//diagonal star filler lines
//point 1
line(62.5, 62.5, 218.75, 125);
line(218.75, 125, 62.5, 187.5);
//point 6
line(62.5, 187.5, 125, 31.25);
line(125, 31.25, 187.5, 187.5);
//point 3
line(187.5, 187.5, 31.25, 125);
line(31.25, 125, 187.5, 62.5);
//point 5
line(125, 218.75, 62.5, 62.5);
line(125, 218.75, 187.5, 62.5);

//asymmetrical lines
line(125, 125, 31.25, 15.625);
line(125, 125, 62.5, 0);
//line(125, 125, 93.75, 0);
line(125, 125, 125, 0);
line(125, 125, 156.25, 15.625);
//line(125, 125, 187.5, 0);
//line(125, 125, 218.75, 0);
line(125, 125, 250, 0);
line(125, 125, 218.75, 31.25);
line(125, 125, 203.125, 62.5);
line(125, 125, 234.375, 93.75);
line(125, 125, 250, 125);
line(125, 125, 250, 156.25);
line(125, 125, 203.125, 187.5);
//line(125, 125, 250, 218.75);


//DOTS
//outer octagon
smooth();
noStroke();
fill(255, 120);

ellipse(125, 31.25, 10, 10);
ellipse(62.5, 62.5, 10, 10);
ellipse(31.25, 125, 10, 10);
ellipse(62.5, 187.5, 10, 10);
ellipse(125, 218.75, 10, 10);
ellipse(187.5, 187.5, 10, 10);
ellipse(218.75, 125, 10, 10);
ellipse(187.5, 62.5, 10, 10);

//inner dots

//square
ellipse(98, 98, 10, 10);
ellipse(98, 152, 10, 10); 
ellipse(152, 98, 10, 10);
ellipse(152, 152, 10, 10);

ellipse(125, 87, 10, 10);
ellipse(125, 163, 10, 10);

ellipse(87, 125, 10, 10);
ellipse(163, 125, 10, 10);
//center
ellipse(125, 125, 10, 10);

//asymmetrical end dots
ellipse(156.25, 15.625, 10, 10);
ellipse(31.25, 15.625, 10, 10);
ellipse(203.125, 62.5, 10, 10);
ellipse(234.375, 93.75, 10, 10);
ellipse(203.125, 187.5, 10, 10);

