
// the rose
// schien@mail.ncku.edu.tw

void setup() {
  size(400, 400);
  background(51);
  frameRate(8);
  stroke(60, 150, 60);
  noFill();
  strokeWeight(0.3);
  smooth();
}

float x, y, k=3.0;
float m = 20;
//color c = color(255, 255, 255);

void draw() {
  background(51);
  //beginShape(POINTS);
  beginShape();
  for (int theta=0; theta<360*m; theta+=1) {
    x = 200.0* sin(k*theta*PI/180.0) * cos(theta*PI/180.0);
    y = 200.0* sin(k*theta*PI/180.0) * sin(theta*PI/180.0);
    //println("x=" + x + "; y=" + y);
    //set((int)(x+width/2), (int)(height/2-y), c);
    //curveVertex((int)(x+width/2), (int)(height/2-y));
    vertex((int)(x+width/2), (int)(height/2-y));
  } 
  endShape();
  
  if (keyPressed) {
    saveFrame("rose.png");
  }
}

void mouseReleased() {
  background(51);
  //k = random(0, 2);
  k = (float)mouseX/(float)mouseY;
  println("k = " + k);
}


