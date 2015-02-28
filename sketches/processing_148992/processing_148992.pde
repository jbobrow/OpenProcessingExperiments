
Player p;
PImage bg;
int y;
void setup() {
  p = new Player();
  size(640, 360);
  bg = loadImage("quidditch.jpg");
}

void draw() {
  background(bg);
  p.draw();
}
 void mousePressed() {
  if (p.isRunning)
    p.isRunning = false;
  else
    p.isRunning = true;
}
 class Player {
  PVector pos, target, direction, velocity;
  boolean isRunning;
  Player() {
  direction = new PVector(0, 0);
  pos = new PVector(width/2, height/2);
  target = new PVector(mouseX, mouseY);
  velocity = new PVector(0, 0);
  }
 void draw() {
   
    update();
    fill(255, 0, 0);
    
    pushMatrix();
    
    translate(pos.x, pos.y);
  
    float dX = pos.x - target.x;
    float dY = pos.y - target.y;
    float angle = radians((atan2(dY, dX) * 180 / PI));
    rotate(angle);
    fill (255,255,255);
    triangle (-14,30,70,30,40,60);
    
    triangle (-70,30,14,30,-40,60);
    fill (#FAD60A);
    ellipse (20-20,30-0,35,35);
    popMatrix();
  }
 
  void update() {
    target.x = mouseX;
    target.y = mouseY;
    direction = PVector.sub(target, pos);
    float separation = direction.mag();
    float distance = separation;
    direction.normalize();
    direction.mult(0.5);
    PVector acceleration = direction;
 

    velocity.add(acceleration);
    velocity.limit(3);
    if (isRunning)
      pos.sub(velocity);
    else
      pos.add(velocity);
  }
}



