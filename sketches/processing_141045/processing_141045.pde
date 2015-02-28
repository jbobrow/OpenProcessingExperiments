
/*
Konkuk University
SOS iDesign
Name: Kim young ji
ID: KIMYoungJi
*/

PImage img;

void setup(){
size (600, 600);
background(248,236,184);
// noLoop();
smooth();
colorMode (RGB, 600);
img = loadImage ("Untitled-1.jpg");
}

void draw(){
println(mouseX + " : " + mouseY);

strokeWeight(5);
stroke(600, 0, 0);
noFill();
bezier(-2, 159, 10, 150, 85, 185, 72, 233);
stroke(255, 0, 0);
line(206, 0, 185, 23);
point(385, 228);
point(400, 228);

noStroke();
triangle(94, 15, 110, 64, 131,  64);

noStroke();
fill(18, 148, 171);
quad(79, 0, 152, 65, 210, 65, 167, 0);

fill(255, 148, 54);
noStroke();
triangle(94, 15, 110, 64, 131,  64);
quad(0, 0, 0, 66, 106, 66, 92, 13);

fill(600, 600, 600);
stroke(0, 0, 600);
bezier(6, 0, 4, 26, 86, 26, 88, 0);

stroke(0);
line(110, 39, 121, 32);
line(117, 48, 127, 40);
line(125, 54, 133, 47);

fill(255, 148, 54);
triangle(94, 15, 110, 64, 131,  64);

fill(600, 500, 0);
noStroke();
fill(mouseX,600,303,323);

quad(126, 55, 218, 166, 232, 149, 135, 47); 

stroke(0);
fill(600, 0, 0);
quad(69, 118, 78, 123, 235, 5, 226, 0);

strokeWeight(3);
noFill();
bezier(0, 459, 37, 380, 170, 425, 148, 508);
bezier(0, 325, 5, 310, 88, 350, 72, 418);

strokeWeight(4);
fill(600, 400,0);
triangle(312, -5, 476, 246, 329, -5);

strokeWeight(4);
triangle(346, -5, 461, 168, 362, -5); 

strokeWeight(4);
triangle( 406, -5, 502, 153, 418, -5);

noFill();
bezier(77, 236, 77, 131, 240, 131, 239, 236);

fill(255, 255, 126);
quad(0,165, 0, 178, 26, 158, 22, 149);

fill(0, 0, 0);
quad(22, 149, 27, 159, 77, 123, 70, 116);

line(0, 185, 18, 164);
strokeWeight(3);
line(0, 199, 51, 140);

fill(600, 500, 0);
noStroke();
triangle(403, 236, 283, 367, 443, 411);

fill(18, 148, 171);
noStroke();
ellipse(412, 437, 176, 176);

noStroke();
fill(mouseX+30, mouseY+30, 35);
ellipse(199, 350, 110, 110);

stroke(0, 0, 0);
strokeWeight(8);
line(70, 83, 406, 423);

strokeWeight(7);
line(94, 17, 261, 551);

strokeWeight(4);
line(0, 235, 402, 239);

strokeWeight(3);
line(364, 349, 67, 348);

fill(mouseX, 30, mouseY, 350);
strokeWeight(5);
rectMode (CORNERS);
rect (488, 482, 556, 540);

strokeWeight(3);
line(69, 240, 0, 310);
line(75, 245, 0, 320);
line(80, 248, 0, 329);

strokeWeight(5);
line(524, 507, 574, 506);

strokeWeight(7);
line(524, 516, 574, 513);

strokeWeight(4);
line(274, 0, 599, 493);

strokeWeight(10);
line(586, 110, 232, 0);

strokeWeight(6);
line(538, 28, 538, 0);

strokeWeight(6);
line(583, 0, 583, 26);
line(382, 486, 156, 489);
}

