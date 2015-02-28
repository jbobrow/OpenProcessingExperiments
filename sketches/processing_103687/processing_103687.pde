

PImage background;
Pad pad;
Ball ball;
Brick[] bricks;

Maxim maxim;
AudioPlayer[] impacts;

int level, score;
boolean menu = true, play = false;

boolean newBall = true; //at the beginning when the ball needs to be launched and when you lose a ball and need to start again

void setup() {
  size(600, 600);
  background = loadImage("background.jpg");
  imageMode(CENTER);
  smooth();
  score = 0;
  frameRate(30);

  maxim = new Maxim(this);
  impacts = new AudioPlayer[5];
  impacts[0] = maxim.loadFile("audio/impact0.wav"); //impact ball with pad
  impacts[1] = maxim.loadFile("audio/impact1.wav"); //impact ball with bricks
  impacts[2] = maxim.loadFile("audio/impact3.wav"); //impact ball with walls
  impacts[0].setLooping(false);
  impacts[1].setLooping(false);
  impacts[2].setLooping(false);
  impacts[0].volume(1.0);
  impacts[1].volume(1.0);
  impacts[2].volume(0.4);

  pad = new Pad();
  ball = new Ball();
  bricks = new Brick[35];
  for (int i=0; i<5; i++) {
    for (int j=0; j<7; j++) {
      bricks[i*7+j] = new Brick(j*width/7 + width/14, 35 + i*height/25 + height/50, 100);
    }
  }
}

void draw() {
  image(background, width, width * background.height/background.width);
  //if (play) {
    pad.display();
    ball.display();
    ball.move();
    for (int i=0; i<bricks.length; i++) {
      bricks[i].display();
    }
    if (mousePressed) {
      pad.move();
    }
  //}
  /*else {
    showMenu();
  }*/
}

void mousePressed() {
  //if (play) {
    if (newBall) {
      ball.velocity(0, 7);
      newBall = false;
    }
 // }
}

void mouseDragged() {
}

class Pad
{
  float x, y; //coordonates
  float l, h; //length, height

  float speed;

  Pad() {
    x = width/2; //in the middle
    l = 4.2 * width / 15; //the length of the pad
    h = height/23; //the height of the pad
    y = height - 2*h/3; //the y-axis coordonate
    speed = 8; //the speed of the pad
  }

  void display() {
    //pad drawing
    noStroke();
    fill(129, 230, 200);
    rectMode(CENTER);
    rect(x, y, l, h);
  }

  float xPos() {
    return x;
  }
  float yPos() {
    return y;
  }
  float length() {
    return l;
  }
  float height() {
    return h;
  }

  void move() {
    /*if (x + speed > mouseX) {
     x = mouseX;
     }*/
    if (x < mouseX) {
      x += speed;
    }
    if (x > mouseX) {
      x -= speed;
    }
    /*else if (x - speed < mouseX) {
     x = mouseX;
     }*/
    if (x + l/2 > width) {
      x = width - l/2;
    }
    else if (x - l/2 < 0) {
      x = 0 + l/2;
    }
  }
}

class Ball
{
  float x, y; //ball coordinates
  float radius; //ball radius
  float velX, velY; //the ball velocity on x,y-axis
  float dmg; //the damage it does on impact

  Ball() {
    radius = 12;
    x = width/2;
    y = pad.yPos() - pad.height()/2 - radius;
    velX = 0;
    velY = 0;
    dmg = 100;
  }

  void velocity(float xVel, float yVel) {
    velX = -xVel;
    velY = -yVel;
  }

  void display() {
    noStroke();
    fill(255, 255, 102);
    ellipseMode(CENTER);
    ellipse(x, y, radius*2, radius*2);
  }

  void move() {
    x += velX;
    y += velY;
    if (x + radius >= width || x - radius <= 0) {
      velX = -velX;
      impacts[2].cue(0);
      impacts[2].play();
    }
    if (y - radius <= 0) {
      velY = -velY;
      impacts[2].cue(0);
      impacts[2].play();
    }

    //Brick collision
    for (int i=0; i<bricks.length; i++) {
      if (bricks[i].hp() > 0) {
        if (x + radius >= bricks[i].xPos() - bricks[i].length()/2 && x - radius <= bricks[i].xPos() + bricks[i].length()/2) {
          if (y + radius >= bricks[i].yPos() - bricks[i].height()/2 && y - radius <= bricks[i].yPos() + bricks[i].height()/2) {
            bricks[i].Dmg(dmg);
            velY = -velY;
            impacts[1].cue(0);
            impacts[1].play();
          }
        }
        else if (y + radius >= bricks[i].yPos() - bricks[i].height()/2 && y - radius <= bricks[i].yPos() + bricks[i].height()/2) {
          if (x + radius >= bricks[i].xPos() - bricks[i].length()/2 &&  x - radius <= bricks[i].xPos() + bricks[i].length()/2) {
            bricks[i].Dmg(dmg);
            velX = -velX;
            impacts[1].cue(0);
            impacts[1].play();
          }
        }
      }
    }

    //Pad collision
    if (x + radius >= pad.xPos() - pad.length()/2 && x - radius <= pad.xPos() + pad.length()/2) {
      if (y + radius >= pad.yPos() - pad.height()/2) {
        //pad collion
        float alpha = map(x, pad.xPos() - pad.length()/2, pad.xPos() + pad.length()/2, 30, 150);
        //println("alpha = " + alpha);
        float speed = sqrt(velX * velX + velY * velY);
        //println("speed = " + speed);
        velX = speed * cos(radians(alpha));
        velY = speed * sin(radians(alpha));
        velX = -velX;
        velY = -velY;
        if (speed > 0) {
          impacts[0].cue(0);
          impacts[0].play();
        }
      }
    }
  }
}

class Brick
{
  float x, y; //brick coordonates
  float l = width/7, h = height/25; //brick length & height
  float Hp; //brick hp
  float r=random(0, 255), b=random(0, 255), g=random(0, 255); //brick red,blue,green color

  Brick(float newX, float newY, float newHp) {
    x = newX;
    y = newY;
    Hp = newHp;
  }

  float length() {
    return l;
  }
  float height() {
    return h;
  }
  float hp() {
    return Hp;
  }
  float xPos() {
    return x;
  }
  float yPos() {
    return y;
  }

  void Dmg(float dmg) {
    Hp -= dmg;
  }
  void display() {
    if (Hp > 0) {
      rectMode(CENTER);
      noStroke();
      fill(r, b, g);
      rect(x, y, l, h);
    }
  }
}



