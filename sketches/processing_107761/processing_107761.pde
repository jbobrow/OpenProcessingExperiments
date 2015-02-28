
// turret test - simple shooting game

Shell[] shells;
int shellnum = 0;
int numshells = 8;
int width = 800;
int height = 600;
float turretX = width/2; 
float turretY = height;
float targetX = 0, targetY = 0;
float targetVX = 0;
float targetVY = 0;

color pink = color(255, 102, 204);

void setup() {
  // frameRate(12);
  size(width, height);
  background(255);
  shells = new Shell[numshells]; 
  
  for (int n = 0; n < numshells; n++) {
    shells[n] = new Shell(0, 0, 0, 0, 0);
  }

  newTarget();
}

void draw() {
  background(0);
  // draw turret
  fill(0,255,0);
  ellipse(turretX, turretY, 60, 40);
  
  drawTarget();
  
  // handle shells
  fill(pink);
  for (int n = 0; n < numshells; n++) {
    shells[n].display();
    shells[n].move();
    boolean bang = shells[n].hit();
    if (bang) newTarget(); 
  }
}

void newTarget() {
  targetX = int(random(600) + 100);
  targetY = int(random(400) + 100);
  targetVX = random(10)-5;
  targetVY = random(10)-5;
}

void drawTarget() {
  // draw target
  fill(0, 0, 255);
  ellipse(targetX, targetY, 30, 30);
  targetX = targetX + targetVX;
  targetY = targetY + targetVY;
  if ((targetX > width) || targetX < 0) targetVX = -targetVX;   
  if ((targetY > height) || targetY < 0) targetVY = -targetVY;   
}


class Shell {
  float xpos;
  float ypos;
  float speed;
  float angle;
  int shellnum;
  
  Shell(float tempXpos, float tempYpos, float tempspeed, float tempangle, int tempshellnum) {
    xpos = tempXpos;
    ypos = tempYpos;
    speed = tempspeed;
    angle = tempangle;
    shellnum = tempshellnum;
  }
  
  void display() {
    ellipse (xpos, ypos, 10, 10);
  }
  
  void move() {
    xpos = xpos + speed*sin(angle);
    ypos = ypos - speed*cos(angle);
  }
  
  boolean hit() {
    float dist = sqrt(sq(targetX-xpos) + sq(targetY - ypos) );
    if (dist < 20) {
      return true;
    }
    else {
      return false;
    }
  }
} 

void mousePressed() {
  shellnum = (shellnum + 1) % numshells;
  float a = atan((mouseX-turretX) / (turretY-mouseY)); 
  shells[shellnum] = new Shell(turretX, turretY, 3, a, shellnum);
}
