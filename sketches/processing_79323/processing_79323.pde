
Tentacle wiggle;
 

void setup() {

  wiggle = new Tentacle(270);
 
  size(800, 400);
  background(100);
 
   
  noCursor();
   
}



void draw() {
  background(100);

  wiggle.move();
  wiggle.draw();
}
 
class Tentacle {
 
  int length = 20;     
  PVector[] nodes = new PVector[length];
  
  float speed = 2 + 5; 
  float sway = 0.1 + random(10) / 250;
  float theta;
  float count;
   
  Tentacle (float initTheta) {
    theta = initTheta;
 for (int n = 0; n < length; n++) {
      nodes[n] = new PVector(height, height);
    }
  }
 
  void move() {
         
    float thetaMuscle;
    float dx, dy, d;
 

    nodes[0].x = mouseX;
    nodes[0].y = mouseY;
 
   
    count += sway;
    if(keyPressed) {
      nodes[1].x = nodes[0].x ;
      nodes[1].y = nodes[0].y ;
    } else {
      nodes[1].x = nodes[0].x ;
      nodes[1].y = nodes[0].y -cos(count) ;
    }
     

    for (int i = 2; i < nodes.length; i++) {
      dx = nodes[i].x - nodes[i - 2].x;
      dy = nodes[i].y - nodes[i - 2].y;
 
      d = sqrt(dx * dx + dy * dy);
      nodes[i].x = nodes[i - 1].x + (dx * speed) / d;
      nodes[i].y = nodes[i - 1].y + (dy * speed) / d;
    }
  }
 
 
  void draw() {
    pushMatrix();
 
    for (int i=1; i<length; i++) {
      stroke(255);
      line(nodes[i].x, nodes[i].y,
      nodes[i].x, nodes[i].y);
    }
    
    fill(0, 0, 0);
    rect(nodes[1].x, nodes[1].y, 30, 3);
 
    popMatrix();
  }
}


