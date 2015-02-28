
Ball ball;
Room room;
MouseCursor mCursor;
 
void setup() {
  size(700,400);
  smooth();
   
  room = new Room();
  ball = new Ball();
  mCursor = new MouseCursor(); 
}

void draw() {
  background(0); 
  if(ball.pos.dist(mCursor.pos) < ball.rad + mCursor.rad) {
    bounce(ball,mCursor);
  }
  
  mCursor.update();
  mCursor.display();
  
  room.display();
  
  ball.update();
  ball.display();
}

class Room {
  PVector vel = new PVector();
  float roomWidth;
  float roomHeight;
   
  Room() {
    roomWidth = 280;
    roomHeight = 160;
    vel.x = random(0,5);
    vel.y = random(0,5);
  }
   
  void display() {
    //color(255);
    fill(255);
    strokeWeight(3);
    rect(350-(roomWidth/2), 200-(roomHeight/2), roomWidth, roomHeight);
  }
  
  void update() {
    roomWidth = roomWidth + 21;
    roomHeight = roomHeight + 12;
  }
  
  void update2() {
    if (roomWidth > 280) {
    roomWidth = roomWidth - 0.35;
    roomHeight = roomHeight - 0.20;
    }
  }
}

class Ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float rad = 50;
  color c = 0;
   
  Ball() {
    pos.x = 350;
    pos.y = 200;
    vel.x = random(0,5);
    vel.y = random(0,5);
  }
   
  void update() {
    if (pos.y + rad > 200+(room.roomHeight/2)) {
      vel.y = abs(vel.y) * -1;
      room.update();
    }
    else {
      room.update2();
    }
    if (pos.y - rad < 200-(room.roomHeight/2)) {
      vel.y = abs(vel.y);
      room.update();
    }
    else {
      room.update2();
    }
    if (pos.x + rad > 350+(room.roomWidth/2)) {
      vel.x = abs(vel.x) * -1;
      room.update();
    }
    else {
      room.update2();
    }
    if (pos.x - rad < 350-(room.roomWidth/2)) {
      vel.x = abs(vel.x);
      room.update();
    }
    else {
      room.update2();
    }
    
    pos.add(vel);
  }
   
  void display() {
    fill(c);
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

