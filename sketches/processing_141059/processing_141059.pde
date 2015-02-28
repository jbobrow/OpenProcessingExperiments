
/*
Konkuk University
SOS iDesign

Name: Eunjin park <<------ Write your full name here!
ID: Eunjin PARK <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
background(248,236,184);
// noLoop();
smooth();
colorMode (RGB, 600);
img = loadImage ("Untitled-1.jpg"); // put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 



strokeWeight(6);
noFill();
stroke(300, 0, 0);
bezier(-50,202,-50,100,88,100,85,202);


stroke(0,0,0);

strokeWeight(2);
stroke(102,37,0);
bezier(90,202,85,105,234,105,234,205);

stroke(0,0,0);
strokeWeight(2);
bezier(-20,290,-20,225,14,225,16,290);

strokeWeight(2);
stroke(102,37,0);
bezier(-50,388,-50,260,84,260,84,386);

strokeWeight(4);
stroke(229,216,92);
bezier(9,472,9,360,152,360,152,477);

stroke(0,0,0);

strokeWeight(2);
fill(300,200,0);
quad(-1,-1,-1,35,118,35,106,-0.5);

strokeWeight(2);
fill(71,102,0);
quad(108,-0.5,119,35,209,35,190,-0.5);

noStroke();
fill(600,550,0);
quad(114,-0.5,215,137,228,116,124,-0.5);

stroke(0,0,0);
strokeWeight(3);
line(119,9,128,2);
line(125,17,134,8);
line(132,26,140,16);
line(113,-0.5,138,36);
line(127,-0.5,150,27);

strokeWeight(3);
fill(450,0,0);
quad(85,81,90,90,203,-1,186,-1);

fill(71,102,0);
quad(35,121,38,130,88,90,85,81);

fill(159,201,60);
quad(-1,150,-1,164,38,130,35,121);



strokeWeight(2);
line(-0.5,176,25,143);
line(-0.5,190,60,116);

noStroke();
fill(159,201,60);
ellipse(394,405,166,166);

noStroke();
fill(255,217,250);
ellipse(198,320,96,96);

stroke(0,0,0);

strokeWeight(4);
line(2,204,381,208);
line(108,0,255,523);
line(163,460,365,457);
line(287,1,599,530);

strokeWeight(2);
line(1,300,82,210);
line(2,312,87,214);
line(1,321,95,217);

noStroke();
fill(600,500,0);
fill(mouseX,600,303,323);
triangle(383,207,278,338,420,382);

stroke(0,0,0);
strokeWeight(2);
line(79,317,346,317);

strokeWeight(7);
line(83,50,387,395);

stroke(0, 0, 0);
strokeWeight(5);
fill(255,0,0);
strokeWeight(4);
rectMode(CORNERS);
rect(462,453,521,511);
strokeWeight(4);
line(494,477,539,473);

strokeWeight(5);
line(494,485,540,483);

strokeWeight(2);
fill(600,250,0);
triangle(448,213,331,-0.5,319,-0.5);
triangle(437,139,365,-0.5,350,-0.5);
triangle(472,123,415,-0.5,404,-0.5);

strokeWeight(10);
line(309,0,549,77);

point(504,240);

}
