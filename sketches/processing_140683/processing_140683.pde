
/*
 Konkuk University
 SOS iDesign

Name: Min Kyung Kim
 ID: sjmj323 
*/

PImage img;

void setup(){
size (600, 600);
background(247,222,172);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420065 Min Kyung Kim.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);

stroke(0);
strokeWeight(4);
point(413,296);
line(413,296,403,600);
line(497,295,489,596);
line(579,296,576,597);
line(269,419,600,420);
line(259,505,600,509);
line(258,597,600,597);
line(212,101,0,242);

stroke(0);
fill(0);
quad(212,101,128,157,182,245,262,188);
quad(198,275,235,331,312,278,279,224);
quad(379,27,408,77,456,48,426,1);

stroke(0);
noFill();
bezier(469,1,493,19,530,16,549,1);

fill(600);
rect(412,422,84,84);
fill(600,148,14);
quad(495,420,495,510,576,509,574,423);
fill(600);
quad(495,510,490,597,576,599,576,510);
fill(mouseX,mouseY,100,100);
quad(495,510,409,507,405,597,490,599);
fill(597,316,145);
quad(-1,379,118,600,93,600,-1,439);

noStroke();
fill(600);
quad(-1,180,182,60,178,117,0,235);

strokeWeight(2);
stroke(0);
fill(597,316,145);
quad(-1,120,212,0,268,0,0,180);
fill(600);
quad(101,0,-1,57,-1,120,212,0);
fill(600);
quad(98,0,37,37,-1,0,98,0);
fill(395,381,368);
quad(34,37,-1,57,-1,0,34,37);

strokeWeight(14);
line(469,177,-1,534);

fill(mouseX,mouseY,100,100);
strokeWeight(4);
stroke(600,148,14);
ellipse(264,101,155,145);

noStroke();
fill(mouseX,mouseY,100,100);
bezier(-1,426,75,477,75,542,-1,600);




}

