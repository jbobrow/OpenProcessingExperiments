
//Nicolas Gomez
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section A
//9.11.12

//Single "=" sign is an assignment.
//If x == 100, then do something. Two equals is equal to. (condition)

float randomDiameter = 20; //Global variable -float


void setup() {
  size(1200, 600);
  background(0);
}


void draw() {

  background(0);
  smooth();
  stroke(255,36,36);
  strokeWeight(2);
  fill(255, 0,0); //inside circle's color

  //randomDiameter = random(100); //you can put one as a max, or use two
as a range
   stroke(255,30,36);
  if (randomDiameter<100) {
    randomDiameter++;
  }
  else {
    randomDiameter=40;
  }
  stroke(255,0,0);
  float a = 0.0;
float inc = TWO_PI/25.0;

for (int i = 0; i < 1000; i=i+10) {
  line(mouseY, 22+sin(a)*200.0, 22+sin(a)*200.0, 22+sin(a)*200.0);
  a = a + inc;
}
stroke(255,0,255);
//beginShape(TRIANGLE_FAN);
vertex(mouseX, mouseY);
vertex(257.5, 15);
vertex(292, 50);
vertex(mouseX,mouseY);
vertex(222, 50);
vertex(57.5, 15);
endShape();
fill(255, 255, 0);
//beginShape(TRIANGLE_FAN);
vertex(mouseX, mouseY);
vertex(257.5, 215);
vertex(292, 350);
vertex(mouseX,mouseY);
vertex(222, 450);
vertex(450, 315);
  {
  fill(0,255,0);
beginShape(TRIANGLE_STRIP);
vertex(700, mouseX);
vertex(mouseY, 520);
vertex(mouseX, mouseY);
vertex(mouseY, mouseX);
vertex(970, 30);
vertex(mouseX, 520);
vertex(mouseY, mouseY);
endShape();

    fill(13, 255, 237);
    ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
    //rect(mouseX,mouseY,50,100);
      fill(255,0,255,50);
  rect(0,0,width,height);
  }
}
void mouseClicked() {



}
