
Rotater[] rotater1;
Rotater[] rotater2;

void setup() {
  size(400, 400, P3D);
  rotater1 = new Rotater[10];
  rotater2 = new Rotater[20];
  
  for(int i = 0; i < rotater1.length; i++) {
    rotater1[i] = new Rotater(random(width), random(height), random(50), random(-0.1,0.1));
  }
  for(int j = 0; j < rotater2.length; j++) {
    rotater2[j] = new Rotater(random(width), random(height), random(50), random(-0.05,0.05));
  }
}

void draw() {
  background(255);
  
  for(int i = 0; i < rotater1.length; i++) {
    rotater1[i].spin();
    rotater1[i].displayTrian();
  }
  for(int j = 0; j < rotater2.length; j++) {
    rotater2[j].spin();
    rotater2[j].displayRect();
  }
}

class Rotater{
  float x, y;
  float p;
  float theta;
  float speed;
  float w;
  
  Rotater(float tempX, float tempY,float tempP, float tempSpeed) {
    x = tempX;
    y = tempY;
    p = tempP;
    theta = 0.0;
    speed = tempSpeed;
  }
  
  // Increment angle
  void spin() {
    theta += speed;
  }
  
  void displayTrian() {
    stroke(0);
    
    pushMatrix();
    translate(x, y);
    rotate(theta);
    beginShape(TRIANGLES);
  
    fill(150, 0, 0, 127);
    vertex(-p, -p, -p);
    vertex( p, -p, -p);
    vertex( 0, 0, p);
  
    fill( 0, 150, 0, 127);
    vertex( p, -p, -p);
    vertex( p, p, -p);
    vertex( 0, 0, p);
  
    fill(0, 0, 150, 127);
    vertex( p, p, -p);
    vertex( -p, p, -p);
    vertex( 0, 0, p);
  
    fill(150, 0, 150, 127);
    vertex( -p, p, -p);
    vertex( -p, -p, -p);
    vertex( 0, 0, p);
  
    endShape();
    popMatrix();
  }
  
  void displayRect() {
    stroke(0);
    
    pushMatrix();
    translate(x, y);
    rotate(theta);
    beginShape(QUADS);
  
    // red
    fill(150, 0, 0, 127);
    vertex(-(p/4+p/2), -p/2, -p/2);
    vertex(0, -p, -p);
    vertex(0, -p/4, -p);
    vertex(-(p/4+p/2), p/4, -p/2);
  
    // green
    fill(0, 150, 0, 127);
    vertex(0, -p, -p);
    vertex((p/4+p/2), -p/2, -p/2);
    vertex((p/4+p/2), p/4, -p/2);
    vertex(0, -p/4, -p);
  
    // blue
    fill(0, 0, 150, 127);
    vertex(-(p/4+p/2), -p/2, -p/2);
    vertex(0, -p, -p);
    vertex((p/4+p/2), -p/2, -p/2);
    vertex(0, 0, 0);
  
    // yellow
    fill(150, 150, 0, 127);
    vertex(0, -p/4, -p);
    vertex((p/4+p/2), p/4, -p/2);
    vertex(0, (p/4+p/2), 0);
    vertex(-(p/4+p/2), p/4, -p/2);
  
    // cyan
  
    fill(0, 150, 150, 127);
    vertex((p/4+p/2), -p/2, -p/2);
    vertex((p/4+p/2), p/4, -p/2);
    vertex(0, (p/4+p/2), 0);
    vertex(0, 0, 0);
  
    // purple
    fill(150, 0, 150, 127);
    vertex(-(p/4+p/2), -p/2, -p/2);
    vertex(-(p/4+p/2), p/4, -p/2);
    vertex(0, (p/4+p/2), 0);
    vertex(0, 0, 0);
  
    endShape();
    popMatrix();
  }
}

