
/*
 Konkuk University
 SOS iDesign

Name: Gwang il Lee <<------ Write your full name here!
 ID: Gwang il <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);
// here you add your code with all shapes and colors. 

background(480,460,414);
strokeWeight(9);
point(215,538);

strokeWeight(5);
noFill();
rectMode(CORNERS);
rect(362,291,161,149);
fill(0,0,0);
strokeWeight(7);
line(11,0,345,338);

strokeWeight(5);
line(4,0,155,500);

strokeWeight(5);
line(0,90,346,92);

strokeWeight(4);
line(0,233,289,237);

strokeWeight(3);
line(22,420,315,414);

strokeWeight(5);
line(318,0,598,429);

strokeWeight(5);
line(372,0,436,104);

strokeWeight(5);
line(414,0,418,4);

strokeWeight(5);
line(494,440,561,437);

strokeWeight(5);
line(495,454,564,450);

noStroke ();
fill(600,480,0);
triangle (335,88,186,260,395,323);


fill(mouseX,mouseY,164);
ellipse(351,348,224,224);

fill(mouseX*2,mouseY,8);
strokeWeight(5);
stroke(0,0,0);
quad(450,411,531,408,535,479,453,485);

noStroke();
fill(254,200,282);
ellipse(66,230,152,152);

fill(556,528,400);
stroke(0,0,0);
strokeWeight(3); 
bezier (0,85,-50,2,172,-50,177,85);





}
