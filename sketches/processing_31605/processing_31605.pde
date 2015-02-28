
//GLOBALS----------------------------
int totalPoints = 15;
int steps = totalPoints;
float ellipseDiam = 20.;
float distance = 0;

//SETUP------------------------------
void setup() {
  size(600, 600, P3D);
  background(0);
  stroke(255);
  smooth();
}

//DRAW------------------------------
void draw() {
  fill(0);
  rect(0, 0, width, height);

  for (int j=0; j<=steps; j++) {
    for (int i=0; i<=steps; i++) {

      pushMatrix();
      float curX = width/steps*i;
      float curY = height/steps*j;
      translate(curX, curY);
      distance = dist(mouseX, mouseY, curX, curY);
      if (distance<20) distance = 20;
      fill(0, 0, 0, 0);
      ellipse(0, 0, ellipseDiam/distance*100, ellipseDiam/distance*100);
      //ellipseDiam = ellipseDiam + 3;
      popMatrix();
    }
  }
}

//FUNCTIONS------------------------------


