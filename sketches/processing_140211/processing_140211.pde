
PImage img;

void setup(){
  background(246,238,184);
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420068 KIMSungUk.jpg");
 }

void draw(){
println(mouseX + " : " + mouseY);

strokeWeight(1);
noFill();
bezier(-70,110,-45,-20,125,-20,150,113);

strokeWeight(1);
fill(mouseY,235,329,235);
ellipse(390,390,240,235);

strokeWeight(1);
fill(mouseX,364,364,364);
ellipse(96,270,140,135);

strokeWeight(1);
fill(600,164,0);
rect(490,450,90,85);

strokeWeight(2);
point(50,110);
line(21,0,180,540);
line(0,111,386,118);
line(0,260,314,270);
line(45,450,340,450);
line(330,0,600,420);
line(385,0,465,130);
line(430,0,448,27);
line(535,490,600,490);
line(535,500,600,500);

fill(599,599,0);
noStroke();
quad(364,118,211,300,420,356,364,118);

stroke(0);
strokeWeight(5);
line(17,0,370,370);
}

