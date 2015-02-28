
/*
//GSwP 3.12 Set Stroke Weight

size(600, 600);
ellipse(width/4, height/4, width/3, height/3);
strokeWeight(40);
ellipse(width*3/4, height/4, width/3, height/3);
*/

/*
//GSwP 3.13 Set Stroke Attributes

size(480, 120);
smooth();
strokeWeight(12);
strokeJoin(ROUND); //Round stroke corners
rect(40, 25, 70, 70);
strokeJoin(BEVEL); //Bevel stroke corners
rect(140, 25, 70, 70);
strokeCap(SQUARE); //Square line endings
line(270, 25, 340, 95);
strokeCap(ROUND); //Round line endings
line(350, 25, 420, 95);
*/

/*
//GSwP 3.14 Paint with Grays

size(600, 600);
smooth();
background(0); //Black
fill(204); //Light gray
ellipse(132, 82, 200, 200);
fill(102); //Dark gray
ellipse(268, 118, 200, 200);
*/

/*
// GSwP 3.15 Control Fill and Stroke

size(600, 600);
noStroke();
fill(128);
ellipse(234, 143, 39, 39);
stroke(0);
noFill();
ellipse(143, 345, 432, 432);
*/

/*
// GSwP 3.16 Draw with Color

size(480, 120);
noStroke();
smooth();
background(0, 26, 100);
fill(255, 0, 0);
ellipse(132, 82, 200, 200);
fill(0, 255, 0);
ellipse(228, -16, 200, 200);
fill(0, 0, 255);
ellipse(268, 118, 200, 200);
*/

//GSwP 3.17 Set Transparency

size(480, 120);
noStroke();
smooth();
background(203, 226, 225);
fill(255, 0, 160);
ellipse(132, 82, 200, 200);
fill(0, 255, 0, 160);
ellipse(228, -16, 200, 200);
fill(0, 0, 255, 160);
ellipse(268, 118, 200, 200);
