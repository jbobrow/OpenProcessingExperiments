
/* This sketch is inspired by the 5th sketch 
from the week 2 material of the class Creative Coding
at future learn.

In this sketch rotating batons are placed along intervals across
the screen. The user can influence the rotation of the batons
by using the arrow keys.
*/

// set the center and radius of the baton.
int center = 16;
float radius = float(center);

// initialize the angle varialbe
float theta = 0;

// these values control the rotation of the baton
// batonNum allows each baton to have a unique angle 
float batonNum = 0;
float alpha = 1;
float beta = 1;


void setup() {
  size(512, 512);
}

void draw() {
  // clear the background and draw the batons
  background(255);
  for (int i = 0; i < width / center; i++) {
    for (int j = 0; j < height / center; j++) {
      pushMatrix();
      translate(i * center, j * center);
      theta = batonNum + alpha*i + beta*j;
      baton(theta);
      popMatrix();
      batonNum++;
    }
  }
  // useful to remember any particular patterns you enjoy
  println("alpha = ", + alpha + ", " + "beta = " + ", " + beta);
}

void baton(float theta) {
  // get the coordinates to draw the baton
  float tempX = center + radius*cos(theta);
  float tempY = center + radius*sin(theta);
  
  // draw the baton
  stroke(12, 77, 101);
  line(center, center, tempX, tempY);
  fill(44, 200, 66);
  ellipse(tempX, tempY, 4, 4);
}


// function to allow the user to influence the rotation
void keyReleased() {
  if (keyCode == UP) {
    alpha += 0.05;
  }
  
  if (keyCode == DOWN) {
    alpha -= 0.05;
  }
  
  if (keyCode == RIGHT) {
    beta += 0.05;
  }
  
  if (keyCode == LEFT) {
    beta -= 0.05;
  }
}


