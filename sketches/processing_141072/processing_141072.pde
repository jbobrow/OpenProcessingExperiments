
/*
Konkuk University
SOS iDesign

Name: kim chea yeon <<------ Write your full name here!
ID: cheayeon <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB, 600);
//img = loadImage ("epdlqlem.jpg"); // put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
// here you add your code with all shapes and colors. 
background(545.2,531.1,408.9);

strokeWeight(5);
line(259,0,598,518);
line(310,0,407,155);
line(347,0,389,65);
line(409,0,438,47);
line(0,35,324,360);
line(1,2,156,510);
line(0,144,320,147);
strokeWeight(3);
line(0,275,276,275);
line(36,440,297,432);
line(464,457,519,453);
strokeWeight(5);
line(464,469,519,464);

noStroke();
fill(68,515,52);
ellipse(333,378,202,202);
fill(mouseX,152.75,500.95);
ellipse(85,271,116,116);
fill(599.25,535.8,0);
triangle(321,147,183,295,368,346);
fill(600,0,0);
rectMode(CORNERS);
rect(422,431,495,493);
fill(599.25,535.8,0);
quad(57,0,106,59,125,38,88,0);
stroke(0);
strokeWeight(3);
noFill();
bezier(0,60,34,14,163,96,129,142);
bezier(0,390,12,371,44,453,28,457);


}
