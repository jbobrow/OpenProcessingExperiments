
/*
Konkuk University
SOS iDesign
 
Name: An yohan <<------ Write your full name here!
ID: opr0107 <<--------- Write your ID here!
 
*/
 
PImage img;
 
void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB, 600);
//img = loadImage ("1234.jpg"); // put the image in the same folder as the processing file
}
 
void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
// here you add your code with all shapes and colors.
background(545,531,409);
 
strokeWeight(5);
line(260,0,600,520);

strokeWeight(3);
fill (477,235,77.5);
triangle (310,0,407,155,329,0);
triangle (345,0,390,70,368,0);
triangle (408,0,440,50,421,0);


noStroke();
fill(mouseX,275,183);
ellipse(323,382,170,170);
fill(287,223,301);
ellipse(83,266,100,100);
fill(mouseY,371,73);
triangle(321,150,197,282,334,329);

stroke(0);
strokeWeight(3);
line(36,440,297,432);

strokeWeight(6);
line(0,35,324,360);
strokeWeight(3);
line(0,275,276,275);
line(0,0,160,508);
line(0,145,321,150);

fill(500,0,0);
rectMode(CORNERS);
rect(420,430,500,495);
strokeWeight(5);
line(464,469,519,464);
line(464,457,519,453);

noStroke();
fill(489,371,73);
quad(60,0,110,60,139,40,86,0);
stroke(0);
strokeWeight(3);
noFill();
bezier(0,60,40,14,169,96,128,146);
bezier(0,380,16,374,48,430,37,448);
 
 
}

