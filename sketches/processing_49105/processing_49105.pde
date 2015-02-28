
void setup() {
  
size(640,480);
smooth();
frameRate(30);
}

void draw() {
background(0);

//body
fill(152,93,15);
rectMode(CENTER);
rect(mouseX,mouseY,50,80);

//head
fill(152,93,15);
noStroke();
ellipse(mouseX,mouseY-60,100,100);

//eyes
fill(255);
noStroke();
ellipse(mouseX+40,mouseY-45,45,45);

fill(255);
noStroke();
ellipse(mouseX-40,mouseY-45,45,45);

fill(0);
ellipse(mouseX+40,mouseY-45,10,10);

fill(0);
ellipse(mouseX-40,mouseY-45,10,10);

//nose
fill(mouseX,0,mouseY);
triangle(mouseX-5,mouseY-25,mouseX+5,mouseY-25,mouseX,mouseY-20);

//ears
fill(152,93,15);
triangle(mouseX,mouseY-100,mouseX+38,mouseY-125,mouseX+40,mouseY-85);

fill(152,93,15);
triangle(mouseX-10,mouseY-100,mouseX-44,mouseY-83,mouseX-51,mouseY-120);

fill(mouseX,0,mouseY);
triangle(mouseX+34,mouseY-116,mouseX+16,mouseY-105,mouseX+36,mouseY-98);

fill(mouseX,0,mouseY);
triangle(mouseX-25,mouseY-103,mouseX-41,mouseY-94,mouseX-45,mouseY-112);

//wiskers
fill(0);
rectMode(CENTER);
rect(mouseX-11,mouseY-22,7,1);

fill(0);
rectMode(CENTER);
rect(mouseX-11,mouseY-19,7,1);

fill(0);
rectMode(CENTER);
rect(mouseX+12,mouseY-19,7,1);

fill(0);
rectMode(CENTER);
rect(mouseX+12,mouseY-22,7,1);

//feet
fill(90,56,11);
rectMode(CENTER);
rect(mouseX+12,mouseY+34,10,30);

fill(90,56,11);
rectMode(CENTER);
rect(mouseX-11,mouseY+34,10,30);

fill(90,56,11);
rectMode(CENTER);
rect(mouseX-31,mouseY+25,15,30);

fill(90,56,11);
rectMode(CENTER);
rect(mouseX+32,mouseY+25,15,30);

//tail
stroke(152,93,15);
noFill();
arc(mouseX+30,mouseY+5,15,20,radians(130),radians(320));
}

