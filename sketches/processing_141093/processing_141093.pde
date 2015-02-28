
/*
Konkuk University
SOS iDesign

Name: kim ye ean <<------ Write your full name here!
ID: Your ID ye ean<<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB, 600);
background(545.2, 531.1, 408.9);
 // put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);
// here you add your code with all shapes and colors.

//line
stroke(0, 0, 0);
strokeWeight(3);
line(200, 3, 407, 380);
line(136, 259, 334, 256);
strokeWeight(1);
line(210, 432, 365, 428);
strokeWeight(1);
line(135, 128, 9, 324);
line(8, 348, 147, 136);
line(144, 132, 7, 338);
strokeWeight(11);
line(191, 5, 293, 506);
noStroke();
fill(481.1, 589.85, 472.35);
triangle(500, 9, 499, 4, 466, 132);
stroke(0, 0, 0);
strokeWeight(3);
line(7, 47, 6, 429);
line(438, 2, 455, 36);
strokeWeight(5);
line(481, 2, 487, 20);

stroke(600, 0, 0);
strokeWeight(6);
line(374, 4, 598, 513);
noStroke();
fill(mouseX+30, 439.45, 0);
triangle(404, 125, 320, 281, 441, 334);
fill(mouseX+30, mouseY+30, 305.5, 359.55);
ellipse(419, 372, 149, 149);

//rect
stroke(600, 0, 0);
strokeWeight(4);
fill(68,515,52);
rectMode(CENTER);
rect(507, 460, 49, 72);
stroke(0, 0, 0);
strokeWeight(5);
line(543, 450, 516, 449);
line(547, 462, 521, 462);
strokeWeight(7);
line(10, 115, 408, 124);

//bezier
noFill();
stroke(600, 0, 600);
strokeWeight(2);
bezier(72, 443, 89, 295, 209, 325, 201, 454);
bezier(7, 315, 48, 182, 165, 237, 135, 347);
stroke(0, 0, 0);
bezier(142, 114, 143, 3, 264, 3, 273, 118);
stroke(345, 0, 0);
strokeWeight(7);
bezier(15, 114, 16, 0, 139, 0, 140, 110);

//quad
fill(308.8,152.75,500.95);
stroke(0, 0, 0);
strokeWeight(5);
quad(0, 120, 8, 131, 127, 4, 105, 4);
noStroke();
fill(0, 507.6, 599.25);
quad(236, 4, 258, 31, 268, 9, 261, 3);

//ellipse
noStroke();
fill(0,305.5,359.55);
ellipse(242, 258, 84, 128);
stroke(0, 0, 0);
strokeWeight(5);

//point
point(190, 326);

//


}
