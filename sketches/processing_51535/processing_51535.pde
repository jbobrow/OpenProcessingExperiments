
/*
Assignment #2
 Hoang Ha
 hha@brynmawr.edu
 CS 100-02
 Feb 7, 2012
 
 My drawing contain clouds in the sky and flowers on the ground.
 The clouds and flowers get smaller as they get to the horizon.
 */


int horizon = 300;

void setup() {
  size(600, 600);
  //background sky
  smooth();
  fill(145, 233, 242);
  rect(0, 0, width, horizon);

  //background ground
  fill(186, 169, 150);
  rect(0, horizon, width, horizon);
}


void draw() {
  //draw Sun
  noStroke();
  fill(255,255,0);
  ellipse(600,0, 150,150);
  
  //drawHouse
  fill(160,82,45);
  beginShape();
  vertex(510,330);
  vertex(550,380);
  vertex(470,380);
  vertex(510,330);
  endShape(CLOSE);
  
  fill(233,150,122);
  beginShape();
  vertex(480,380);
  vertex(540,380);
  vertex(540,440);
  vertex(480,440);
  endShape(CLOSE);
}

void mousePressed() {
  // flower
  if (mouseY > horizon + 40) { //draw flower with 10 petals when mouse is pressed below horizon 
  flower(mouseX, mouseY, 10);
  }


  //clouds
  if (mouseY < horizon-40) { //draw cloud when mouse is pressed above horizon
    noStroke();
    fill(255); 
    int distY = abs (horizon - mouseY);
    ellipse (mouseX, mouseY, 40+ distY/5, 35+ distY/5);
    ellipse (mouseX-30, mouseY+10, 35 + distY/5, 25+ distY/5);
    ellipse (mouseX+20, mouseY+10, 30+ distY/5, 30+ distY/5);
    ellipse (mouseX-40, mouseY-20, 25+ distY/5, 10+ distY/5);
    ellipse (mouseX-10, mouseY-15, 35+ distY/5, 25+ distY/5);
    ellipse (mouseX+3, mouseY-15, 30+ distY/5, 20+ distY/5);
  }
}

//draw flower at centerX and centerY with n petals
void flower(int centerX, int centerY, int n){
  int distY = abs (horizon - mouseY);
  int size = 10+ distY/7;     // size of petals (circles)
  float angle = 2*PI/n;  
  for (int i=0; i<n; i++) {
    noStroke();
    fill(random(100, 255), 0, 0, 140);
    ellipse(centerX+size*cos(angle*i), centerY+size*sin(angle*i), size, size);
  }
}  


