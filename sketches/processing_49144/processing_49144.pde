
void setup() {
  frameRate(30);
  size(640,480);
  smooth();
}

void draw() {
  background(0);
  println(frameRate);

ellipseMode(CENTER);
rectMode(CENTER);

//body
fill(255,243,152);
stroke(200);
ellipse(mouseX,mouseY,35,35);

//ears
fill(255,68,0);
noStroke();
ellipse(mouseX-15,mouseY-55,20,20);

fill(255,68,0);
noStroke();
ellipse(mouseX+25,mouseY-40,20,20);

//Large Head
fill(255,243,152);
stroke(200);
ellipse(mouseX,mouseY-35,50,50);

//Black Pupils
fill(0);
stroke(0,0,255);
ellipse(mouseX+13,mouseY-37,20,20);

fill(0);
stroke(0,0,255);
ellipse(mouseX-10,mouseY-47,20,20);

//Eye glitters
//right eye
noStroke();
fill(255);
ellipse(mouseX+10,mouseY-43,5,5);

fill(255);
ellipse(mouseX+14,mouseY-40,2,2);

fill(255);
ellipse(mouseX+10,mouseY-35,8,8);

//left eye
noStroke();
fill(255);
ellipse(mouseX-8,mouseY-53,5,5);

fill(255);
ellipse(mouseX-10,mouseY-48,2,2);

fill(255);
ellipse(mouseX-8,mouseY-45,8,8);

//Smile
noFill();
stroke(0);
arc(mouseX-5,mouseY-30,10,10,0,radians(180));

//feet
fill(225,68,0);
noStroke();
ellipse(mouseX-15,mouseY+12,15,15);

fill(225,68,0);
noStroke();
ellipse(mouseX+15,mouseY+12,15,15);

//flower
stroke(16,129,41);
line(mouseX-20,mouseY-6,mouseX+10,mouseY+20);

fill(255,255,0);
stroke(47,206,247);
ellipse(mouseX-20,mouseY-5,5,5);

fill(0,mouseX,mouseY);
ellipse(mouseX-21,mouseY-10,7,7);

fill(0,mouseX,mouseY);
ellipse(mouseX-16,mouseY-8,7,7);

fill(0,mouseX,mouseY);
ellipse(mouseX-15,mouseY-2,7,7);

fill(0,mouseX,mouseY);
ellipse(mouseX-20,mouseY+1,7,7);

fill(0,mouseX,mouseY);
ellipse(mouseX-24,mouseY-1,7,7);

fill(47,mouseX,mouseY);
ellipse(mouseX-25,mouseY-5,7,7);

}

