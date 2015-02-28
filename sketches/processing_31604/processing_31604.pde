
//GLOBALS----------------------------
int totalPoints = 12;
int steps = totalPoints;
float ellipseDiam = 20.;
float distance = 0;
float easing = 0.08;
int g = 5;

//SETUP------------------------------
void setup() {
  size(600, 600, P3D);
  background(0);
  //stroke(255);
  noStroke();
  smooth();
  frameRate(60);
}

//DRAW------------------------------
void draw() {
  fill(0, 0, 0, 80);
  rect(0, 0, width, height);

  for (int j=-g; j<steps+g; j++) {
    for (int i=-g; i<steps+g; i++) {

      pushMatrix();
      float curX = width/steps*i;
      float curY = height/steps*j;
      float deltaX = (mouseX-curX);
      float deltaY = (mouseY-curY);
      deltaX *= easing;
      deltaY *= easing;
      curX += deltaX;
      curY += deltaY;
      translate(curX, curY);
      distance = dist(mouseX, mouseY, curX, curY);
      fill(255);
      rect(0, 0, distance/ellipseDiam*1.3, distance/ellipseDiam*1.3);
      popMatrix();
    }
  }
}


