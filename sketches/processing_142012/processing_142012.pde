
/*
Konkuk University
SOS iDesign

Name: kim ye ean
ID: ye ean

*/

PImage img;

void setup(){
size (600, 600);
// noLoop();
smooth();
img = loadImage ("G.png"); // put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);
image (img, 0, 0);
// here you add your code with all shapes and colors.

noFill();

fill(255,180,220);
ellipse(162,156,63,121);
ellipse(431,154,63,121);
fill(255,100,150);
ellipse(162,156,35,63);
ellipse(431,154,35,63);
fill(255,180,220);
rectMode (CORNERS);
rect(97,153,491,459);

fill(255,100,150);
ellipse(286,323,121,82);
fill(255,100,100);
ellipse(411,323,63,38);
ellipse(170,328,63,38);
fill(200,50,100);
ellipse(262,323,25,25);
ellipse(318,323,25,25);

float mx1 = constrain (mouseX,155,206);
float mx2 = constrain (mouseX,375,431);
float my = constrain (mouseY,252,297);

fill(0,0,0);
ellipse(mx1,my,31,31);
ellipse(mx2,my,31,31);

if (mousePressed) {
  
  fill(random(255),random(255),random(255));
ellipse(411,323,63,38);
ellipse(170,328,63,38);
}

}
