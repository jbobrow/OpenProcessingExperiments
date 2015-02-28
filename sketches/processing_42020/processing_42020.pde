
Ball ball;
MouseCursor mCursor;
 
void setup() {
  size(700,400);
  smooth();
   
  ball = new Ball();
   
  mCursor = new MouseCursor(); 
}

void draw() {
  background(255);   
  fill(0); 
  if(ball.pos.dist(mCursor.pos) < ball.rad + mCursor.rad) {
    bounce(ball,mCursor);
  }
  
  // rings
  noFill();
  stroke(60,100,100);
  strokeWeight(3);
  ellipse(350, 200, 175, 175);  
  
  mCursor.update();
  mCursor.display();
  
  ball.update();
  ball.display();
}

class Ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float rad = 30;
  color c = 0;
   
  Ball() {
    pos.x = random(0,width);
    pos.y = random(0,height);
    vel.x = random(0,5);
    vel.y = random(0,5);
  }
   
  void update() {
   
    if (pos.y + rad > height) vel.y = abs(vel.y) * -1;
    if (pos.y - rad < 0)      vel.y = abs(vel.y);
    if (pos.x + rad > width)  vel.x = abs(vel.x) * -1;
    if (pos.x - rad < 0)      vel.x = abs(vel.x);
     
    pos.add(vel);
  }
   
  void display() {
    fill(c);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(pos.x,pos.y,rad,rad);
  }
}

class MouseCursor extends Ball {
  MouseCursor() {
    vel.set(0,0,0);
    pos.x = mouseX;
    pos.y = mouseY;
    rad = 0;
  }
   
  void update() {
    pos.x = mouseX;
    pos.y = mouseY;
  }
}

void bounce(Ball ball, Ball mouse) {
  PVector ab = new PVector();
  ab.set(ball.pos);
  ab.sub(mouse.pos);
  ab.normalize();
  while(ball.pos.dist(mouse.pos) < ball.rad + mouse.rad) {
    ball.pos.add(ab);
  }
  
  PVector impact = new PVector();
  PVector impulse = new PVector();
  float impactSpeed;
   
  impact.set(ball.pos);
  impact.sub(mouse.pos);
   
  impulse.set(ab);
 
  impactSpeed = impulse.dot(impact);
   
  impulse.mult(sqrt(impactSpeed));
   
  ball.vel.add(impulse);
  mouse.vel.sub(impulse);  
}

