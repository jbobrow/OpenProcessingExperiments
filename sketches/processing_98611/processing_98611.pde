
// Heart 02
//
// Mouse X - uncover
// r - clear and reset

Dot c1, c2;

void setup() {
 size(600,550);
 background(0,0,0);
 ellipseMode(CENTER);
 noFill();
 c1 = new Dot(200,200,100);
 c2 = new Dot(400,200,100);
}

void draw() {
  noStroke();
  fill(0,0,0,map(mouseX,0,600,50,0));
  rect(0,0,600,600);
  noFill();
  stroke(255,0,0, 400-dist(c2.x,c2.y,300,450));
  strokeWeight( abs(map(dist(c2.x,c2.y,300,450),100,200,0.1,1) ));
  line(c2.x,c2.y,300,450);
  stroke(255,0,0, 400-dist(300,450,c1.x,c1.y));
  strokeWeight( abs(map(dist(300,450,c1.x,c1.y),100,200,0.1,1) ));
  line(300,450,c1.x,c1.y);
  c1.move();
  c2.move();
}

class Dot {
  float x,y,CX,CY,angle,speed,r;
  
  Dot(float posX, float posY, float rad) {
    CX = posX;
    CY = posY;
    r = rad;
    reset();
 } 
  void move() {
    x= r*cos(radians(angle)) + CX;
    y= r*sin(radians(angle)) + CY;
    angle+=speed;
}
  void reset() {
    speed = random(-2,2);
    if (speed<=0) {speed--;} else {speed++;}
    angle = random(360);
  }
  
  
}

void keyPressed() {
 if (key == 'r') { background(0); c1.reset(); c2.reset();  } 
}


