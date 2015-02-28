
Ball b;

void setup() {
  size(600,600,P3D);  
  background(0);
  stroke(255);
  
  translate(100,100,100);
  sphereDetail(60);
  b = new Ball(new PVector(0,0,0), new PVector (random(5),random(5),random(5)));
}
void draw() {
  background(0);
  
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateX(map(mouseY, 0, width, 0, TWO_PI));
  
  noFill();
  stroke(255);
  
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
  
  ambientLight(255,0,0);
  //spotLight(255, 0, 0, width/2, height/2, 300, 0, 0, -1, PI/2, 10);
  
  box(300);
  noStroke();
  fill(200);
  b.move();
  b.drawMe();
}

class Ball {
  PVector pos, vel;
  float rad = 20;
  public Ball(PVector pos, PVector vel) {
    this.pos = pos;
    this.vel = vel;
  }
  
  void move() {
    if (abs(pos.x)+rad>150)
      vel.x = -vel.x;
    if (abs(pos.y)+rad>150)
      vel.y = -vel.y;
    if (abs(pos.z)+rad>150)
      vel.z = -vel.z;
    
   
    pos.add(vel);  
  }
  
  void drawMe() {
      pushMatrix();
      
      translate(pos.x, pos.y, pos.z);
      sphere(rad);
      
      popMatrix();
  }
}


