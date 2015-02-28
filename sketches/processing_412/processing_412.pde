
void setup() {
 size (600, 480);
}

void draw() {
  background (210,250,250);
  noStroke();
  fill(255);
  rect(0,400,600,80);
  drawFrosty();
  drawUFO();
  smooth();
}


void drawFrosty(){
  if (mouseY>400) {
    fill (255,0,0);
noStroke();
fill(255);
ellipse (300, 340, 220, 210);

//middle
noStroke();
fill(255);
ellipse (300, 200, 150, 150);

//head
noStroke();
fill(255);
ellipse (300, 100, 100, 100);

//bottom buttons
fill (0, 0, 0);
ellipse (300, 200, 20, 20);

fill (0, 0, 0);
ellipse (300, 170, 20, 20);

fill (0, 0, 0);
ellipse (300, 230, 20, 20);

//hat
fill (111,111,111);
noStroke ();
rect (265, 20, 70, 50);

//mouth
fill(0, 200, 255);
ellipse (width/2, 128, 15, 20);

float movingEyeX= map(mouseX,0,width,-3,3);
float movingEyeY= map(mouseY,0,height,-3,3);

//left eye
stroke(0);
 strokeWeight(1);
fill (255);
ellipse (284, 90, 20, 20);
//MOVING EYE!!!!!
fill (0);
ellipse (width/2-16+movingEyeX,90+movingEyeY,6,6);

//right eye
stroke(0);
 strokeWeight(1);
fill (255);
ellipse (316, 90, 20, 20);
//MOVING EYE!!!!!
fill (0);
ellipse (width/2+16+movingEyeX,90+movingEyeY,6,6);

fill (0, 0, 0);
ellipse (300, 110, 10, 10);
  }
  
  else{
//bottom
noStroke();
fill(255);
ellipse (300, 340, 220, 210);

//middle
noStroke();
fill(255);
ellipse (300, 200, 150, 150);

//head
noStroke();
fill(255);
ellipse (300, 100, 100, 100);

//bottom buttons
fill (0, 0, 0);
ellipse (300, 200, 20, 20);

fill (0, 0, 0);
ellipse (300, 170, 20, 20);

fill (0, 0, 0);
ellipse (300, 230, 20, 20);

//hat
fill (111,111,111);
noStroke ();
rect (265, 20, 70, 50);

float movingEyeX= map(mouseX,0,width,-3,3);
float movingEyeY= map(mouseY,0,height,-3,3);

//left eye
strokeWeight(1);
stroke(0);
fill (255);
ellipse (284, 90, 20, 20);
//MOVING EYE!!!!!
fill (0);
ellipse (width/2-16+movingEyeX,90+movingEyeY,6,6);

//right eye
  strokeWeight(1);
stroke(0);
fill (255);
ellipse (316, 90, 20, 20);
//MOVING EYE!!!!!
fill (0);
ellipse (width/2+16+movingEyeX,90+movingEyeY,6,6);

fill (0, 0, 0);
ellipse (300, 110, 10, 10);
  }
}

void drawUFO() {
  if (mouseY>400) {
  noStroke();
  fill(255,0,0);
  ellipse(mouseX+20,mouseY-20,50,60);
  triangle(mouseX+20,mouseY-50,mouseX-15,mouseY-30,mouseX+55,mouseY-30);
  
  stroke(0, 126, 255);
  strokeWeight(3);
  line(mouseX+12,mouseY-30,mouseX+15,mouseY-28);
  
  stroke(0, 126, 255);
  strokeWeight(3);
  line(mouseX+28,mouseY-30,mouseX+25,mouseY-28);
  
  fill(0,200,255);
  rect(mouseX+5,mouseY-12,30,10);
  
  stroke(0);
  strokeWeight(3);
  line(mouseX+28,mouseY+8,mouseX+35,mouseY+18);

  stroke(0);
  strokeWeight(3);
  line(mouseX+12,mouseY+8,mouseX+5,mouseY+18);
  
}
else {
 stroke(0);
 line(pmouseX,pmouseY-40,mouseX,mouseY);

// set CENTER mode
ellipseMode(CENTER);

// draw the unknown intellegent alience object's form
noStroke();
colorMode(HSB, 255);
color c = color(0, 126, 255);
fill(c);
ellipse(mouseX,mouseY,55,70);
//float value = saturation(c); // Sets "value" to "126"
//fill(value);
//ellipse(mouseX,mouseY,55,70);

//draw a transparent ball
noStroke();
color c2 = color(0, 126, 255, 102);
fill(c2);
ellipse(mouseX,mouseY,60,80);
//float value2 = alpha(c2); // Sets "value" to "126"
//fill(value2);
//ellipse(mouseX,mouseY,60,80);

// draw the unknown intellegent alience object's navigator
stroke(0);
fill(100);
ellipse(mouseX,mouseY,10,10);
fill(99,99,0);
ellipse(mouseX,mouseY,10,10);

noFill();
stroke(#ff6600);
arc(mouseX, mouseY, 80, 30, -PI/4, 5*PI/4);
}
}

