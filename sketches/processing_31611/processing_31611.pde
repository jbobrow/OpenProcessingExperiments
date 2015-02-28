

//This is an edit to SR Sketch - trial to understand the concept of the matrix more
/*This sketch can be a basic concept to a website interface or 
a digital location map for a way finding system*/
//GLOBALS----------------------------
int totalPoints = 12;
int steps = totalPoints;
float ellipseDiam = 20;
float distance = 0;
 
//SETUP------------------------------
void setup() {
  size(800, 600, P3D);
  background(200);
  stroke(100);
  strokeWeight(2);  
  smooth();
}
 
//DRAW------------------------------
void draw() {
  fill(200,200,200, 80);
  rect(0, 0, width, height);
 
  for (int j=0; j<=steps; j++) {
    for (int i=0; i<=steps; i++) {
 
      pushMatrix();
      float curX = width/steps*i;
      float curY = height/steps*j;
      translate(curX, curY);
      distance = dist(mouseX, mouseY, curX, curY);
      if (distance<20) {distance = 20;}
      if (distance<40) {
      fill(225,0,0);
      float r1 = random (60,70);
    ellipse(0, 0, r1, r1);
  }
      fill(177, 177,177,0);
      float r2 = random (80,110);
      float s1 = random (0,5);
      float s2 = random (0,5);
      ellipse(s1, s2, ellipseDiam/distance*r2, ellipseDiam/distance*r2);
      popMatrix();
    }
  }
}
 

