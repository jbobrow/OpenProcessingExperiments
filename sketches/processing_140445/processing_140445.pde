
/*
 Konkuk University
 SOS iDesign

Name: Kim Hyun Gi
 ID: hyungi216

*/


PImage img;

void setup(){
background(246,235,182);
size(600,600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420074 Kim Hyun Gi.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);




noStroke();
fill(mouseY,138,224,180);
ellipse(275,299,252,252);

stroke(0);
strokeWeight(5);
fill(mouseX,475,183,183);
rect(377,366,91,88);


strokeWeight(5);
line(592,472,297,-1);
line(363,24,345,0);
line(259,6,0,2);
line(54,470,-1,278);
line(428,418,509,414);

fill(558,468,215);
noStroke();
quad(320,264,86,190,254,11,320,264);

stroke(0);
strokeWeight(2);
line(504,399,437,400);

strokeWeight(8);
line(263,287,1,0);

strokeWeight(1);
point(592,472);
line(205,168,-1,167);
line(229,373,-1,369);

fill(mouseY,270,106,352);
bezier(-1,98,45,131,48,206,0,235);

noStroke();
noFill();
bezier(-1,98,45,131,48,206,0,235);

}
