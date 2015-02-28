
/*
Konkuk University
SOS iDesign
Name: KwangHyeon Kim
ID: kxien014

*/

PImage img;

void setup(){
size (600, 600);
background(255,255,255);
// noLoop();
smooth();
colorMode (RGB, 600);
// put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);
// here you add your code with all shapes and colors. 

//head
strokeWeight(5);
fill(#6EC8F7);
ellipse(295,281,542,542);

if(mousePressed){
  fill(mouseX,mouseY,0);
  ellipse(295,281,542,542);
}

//mouth
fill(#FFFFFF);
ellipse(256,375,95,95);
ellipse(354,375,95,95);

//nose
fill(0,0,0);
ellipse(303,323,68,68);

//eyes
fill(0,0,0);
ellipse(85,249,20,20);
ellipse(502,249,20,20);

//mustache
line(372,365,458,358);
line(239,365,164,358);
line(377,379,452,393);
line(236,379,165,393);
line(378,393,444,414);
line(233,393,167,414);

}
