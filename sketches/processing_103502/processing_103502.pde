
//Press left mouse button to fire;
//Press right mouse button to reload;
//For Mac users, press anykey to reload;

boolean shooting, win;
int score;
float bullets;

Target[] targets = new Target[15];

void setup() {
  size(400, 400);
  noCursor(); 

  bullets =10;

  for (int i=0; i<targets.length;i++) {
    targets[i] = new Target(random(width), random(height), random(1, 3), random(1, 3));
  }
}

void draw() {
  background(0); 

  //Press left button to fire
  if (bullets>=1 &&mousePressed;&&mouseButton; == LEFT) {
    shooting = true; 
    bullets-=0.2;
    if (bullets<0) bullets=0;
  } 
  else if (mousePressed&&mouseButton; ==RIGHT) {
    shooting =false;
    bullets = 10;
  } 
  else {
    shooting =false;
  }

//Draw targets, move them, compute if they are all hit and the overall score
  score =0; 
  win =true;
  for (int i=0; i<targets.length;i++) {
    if (!targets[i].hit) {
      targets[i].checkHit(shooting, mouseX, mouseY);
      targets[i].update();
      targets[i].display();
      win =false;
    }
    score += targets[i].score;
  }

//Display the aim circle
  noFill();
  if (shooting) {
    stroke(255, 0, 0);
  } 
  else {
    stroke(200);
  }
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX-20, mouseY, mouseX+20, mouseY);
  line(mouseX, mouseY-20, mouseX, mouseY+20);

//Display bullets left, your score
  noStroke();
  fill(150);
  for (int i=0; i<int(bullets); i++) {
    rect(width-20, 380-i*10, 10, 5);
  }
  text("Your score is: "+score, 10, 20);
  if (win) text("You win, your score is "+score +"!", width/2-80, height/2+10);
}

void keyPressed() {
 bullets =10; 
}

class Target {
  float x, y;
  float vX, vY;
  boolean hit; 
  int score;

  Target(float _x, float _y, float _vX, float _vY) {
    x= _x;
    y =_y;
    vX = _vX;
    vY = _vY;
  }

  void update() {
    x += vX;
    y += vY;

    if (x>width) {
      vX *=-1;
      x =width;
    }

    if (x<0) {
      vX *=-1;
      x =0;
    }

    if (y>height) {
      vY *=-1;
      y =height;
    }

    if (y<0) {
      vY *=-1;
      y =0;
    }
  }

  void display() {
    if (!hit) {
      fill(100);
      ellipse(x, y, 36, 36);
      fill(160);
      ellipse(x, y, 24, 24);
      fill(220, 90, 90);
      ellipse(x, y, 12, 12);
    }
  }

  void checkHit(boolean _p, float _x, float _y) {
    float distance = dist(_x, _y, x, y);
    if (_p && distance<15) {
      hit =true;
      if (distance<6) score = 10;
      if (distance<12 &&distance;>=6) score = 8;
      if (distance<18 &&distance;>=12) score = 4;
    }
  }
}
