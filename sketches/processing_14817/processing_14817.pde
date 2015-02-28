
/*
ellen khansefid edited this code by Sam Wood
 
Some code borrowed from Ira Greenberg and then altered
*/
 
int ballCount = 1500;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speedX1 = new float[ballCount];
float[] speedX2 = new float[ballCount];
float[] speedY = new float[ballCount];
float[] gravity = new float[ballCount];
float[] damping = new float[ballCount];
float[] friction = new float[ballCount];
float[] radius = new float[ballCount];
 
void setup() {
  size(300, 600);
   
  // input variables
  for (int i=0; i<ballCount; i++) {
    speedX1[i] = random(.1, 2.5);
    speedX2[i] = random(-2.5, -.1);
    speedY[i] = random(-2.0);
    gravity[i] = random(.001, .005);
    radius[i] = random(3, 2);
  }
}
 
// drawing the snowflakes, buildings, moon, and background landscape
void draw() {
  background(10, 7, 44);
  noStroke();
  smooth();
  fill(20, 210, 225, 150);
  ellipse(75, 150, 200, 100);
  fill(185, 185, 200, 150);
  ellipse(72, 147, 80, 80);
  fill(20, 75, 25, 150);
  rect(0, 455, 600, 300);
  stroke(115, 115, 160);
  strokeWeight(2);
  fill(80, 80, 115);
  rect(100, 325, 100, 300);
  rect(45, 375, 100, 300);
  rect(300, 300, 100, 300);
  rect(215, 500, 100, 300);
  rect(450, 350, 100, 300);
  rect(375, 450, 100, 300);
  fill(210, 210, 225, 100);
  noStroke();
  rect(170, 335, 25, 75);
  rect(115, 385, 25, 75);
  rect(370, 310, 25, 75);
  rect(285, 510, 25, 75);
  rect(520, 360, 25, 75);
  rect(445, 460, 25, 75);
  stroke(135, 190, 230);//(0, 105, 185);
  strokeWeight(1);
  noSmooth();
  fill(195, 220, 240);//(0, 140, 255); 


}
 
   





