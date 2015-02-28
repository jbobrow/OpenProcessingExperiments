
Robot myRobot;

Beast monster;

boolean hit = false;

void setup() {
  size(1000, 500);
  myRobot= new Robot(color(random(255)), height-30, width/2, 3);

  monster = new Beast ();
}

void draw() {

  background(random(255), random(255), random(255));
  gameover();
  if (hit==false) {
  myRobot.move();
  myRobot.display();
  fill(random(255), random(255), random(255));
textSize(70);
text("YOLO", 100,200);

   monster.move();
  monster.display();}
}

class Robot {
  color c;
  int eye;
  float x;
  float y;
  float xspeed;
  float xacc;
  float size=2;

  Robot(color tempc, float tempy, float tempx, float tempxspeed) {
    c=tempc;
    x=tempx;
    y=tempy;
    xspeed=tempxspeed;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    //eyestalks
    rect(x+5*size, y-10*size, 5*size, 10*size);
    rect(x-5*size, y-10*size, 5*size, 10*size);

    //body
    rect(x, y+25, 10*size, 2*size);
    rect(x, y+20, 15*size, 5*size);
    rect(x, y+10, 18*size, 8*size);
    rect(x, y, 20*size, 10*size);



    //eye color/flashing
    fill(eye, 0, 0);
    eye=eye+5;
    if (eye>255) {
      eye=0;
    }
    //eyes
    ellipse(x+5*size, y-12*size, 7*size, 7*size);
    ellipse(x-5*size, y-12*size, 7*size, 7*size);
  }

  void move() {
    if (x>mouseX)
    {
      x=x-xspeed;
    }
    if (x<mouseX) {
      x=x+xspeed;
    }

    if (y>mouseY) {
      y=y-xspeed;
    }
    if (y<mouseY) {
      y=y+xspeed;
    }
  }
}


class Beast {
  float x;
  float y;
  float size;
  color furColor;
  float xspeed;
  float bulbX;
  float bulbY;
  float bulbSize;
  
  Beast () {
    x = random (600);
    y = random (600);
    size = random (50, 100);
    furColor = color (random (255), random (255), random (255));
    xspeed = random (13,17);
    bulbY = y + size / 2;
    bulbSize = random (10, 20);
  }

  void display () {
    
    ellipseMode (CENTER);
    fill (furColor);
    ellipse (x, y, size, size);
    fill (0);
    ellipse (x - 10, y, bulbSize, bulbSize);
    ellipse (x + 10, y, bulbSize, bulbSize);
    fill (255);
    ellipse (x - 10, y, bulbSize - 2, bulbSize - 2);
    ellipse (x + 10, y, bulbSize - 2, bulbSize - 2);
    rect (x - 1, y, 3, 40);
  }

  void move () {
    x += xspeed;
    if (x > width ) {
      x = 0;
      y = random(500);
      furColor = color (random (255), random (255), random (255));
    }
  }
}

void gameover() {
  int m = millis()/1000;
  if (dist(myRobot.x, myRobot.y, monster.x, monster.y)<=40) {
    text("Game Over", 40, 60);
    int score = m;
    text(score, 850, 380);
    text("Score:", 620, 380);
    hit=true;
  }
}
