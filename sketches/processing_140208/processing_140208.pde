
PImage img;

void setup(){
background(242,243,182);
size(600,600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420090 Oh you ri.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);

point(341,291);
stroke(0);
strokeWeight(5);
line(341,291,341,600);
line(455,295,455,600);
line(571,285,571,600);
line(133,473,600,480);
line(122,595,600,595);
fill(600);
rect(341,473,114,127);
fill(mouseY,600,108,60);
rect(455,473,114,127);

stroke(0);
fill(0);
quad(0,231,132,133,63,0,-1,38);
quad(44,266,89,349,200,274,153,182);
quad(402,102,431,139,-1,494,-1,444);

stroke(423,76,76);
fill(mouseX,420,360,360);
ellipse(126,7,210,210);


noStroke();
noFill();
bezier(0,0,0,0,0,0,0,0);





}
