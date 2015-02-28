
//Martin C, CP1, Mods 4-5
//Pong

Ball[] balls = new Ball[1];
Paddle player = new Paddle(50, false);
Paddle computer = new Paddle(450, true);

void setup()
{

  size(500, 500);
  for (int i=0;i<balls.length;i++)
  {
    balls[i] = new Ball(278, 115, random(2*PI));
  }
}

void draw()
{
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text(pscore+" - "+cscore, 250, 100);
  player.show();
  player.collide();
  player.move();
  computer.show();
  computer.collide();
  computer.move();
  for (int i=0;i<balls.length;i++)
  {
    if (balls[i].checkCollide) {
      checkCollisions(i);
    }
    balls[i].show();
    balls[i].move();
    balls[i].bounce();
    //balls[i].collide();
  }
}

void checkCollisions(int i) {
  for (int j=0;j<balls.length;j++) {
    if (dist(int(balls[i].bx), int(balls[i].by), int(balls[j].bx), int(balls[j].by))<=25) {
      balls[i].collided=true;
      balls[j].collided=true;
      balls[i].checkCollide=false;
      balls[j].checkCollide=false;
      balls[i].t=0;
      balls[j].t=0;
    }
  }
}

class Ball
{
  int speed, r, g, b, t;
  float dir, bx, by;
  boolean collided, checkCollide;
  Ball(int x_, int y_, float dir_)
  {
    dir = dir_;
    bx = float(x_);
    by = float(y_);
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    collided=false;
    speed=6;
  }
  void move()
  {
    bx+=speed*cos(dir);
    by+=speed*sin(dir);
    if (bx<50) {
      lose();
    }
  }
  void bounce()
  {
    if (bx<12) {
      dir=PI-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (by<12) {
      dir=-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (bx>500-12) {
      dir=PI-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (by>500-12) {
      dir=-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
  }
  void collide()
  {
    collided=false;
  }
  void show()
  {
    fill(r, g, b);
    ellipse(int(bx), int(by), 25, 25);
    if (checkCollide==false) {
      t++;
    }
    if (t>2) {
      checkCollide=true;
    }
  }
}

class Paddle
{
  boolean comp, laser;
  int py, px, lx, ly, t;
  Paddle(int px_, boolean comp_)
  {
    t = 0;
    lx=-500;
    ly=-500;
    laser = false;
    comp = comp_;
    px=px_;
    py=210;
  }
  void show()
  {
    fill(125);
    rect(px, py, 20, 80);
  }
  void move()
  {
    if (comp) {
      if (t==0) {
        py=int(balls[0].by-40);
      }
    }
    else {
      if (keyPressed&&key;=='s') {
        py+=balls[0].speed;
      }
      else if (keyPressed&&key;=='w') {
        py-=balls[0].speed;
      }
    }
    if (laser) {
      fill(255, 0, 0);
      noStroke();
      rect(lx, ly, 25, 5);
      lx+=2*balls[0].speed;
      if (lx>500) {
        lx=-500;
        laser=false;
      }
    }
  }
  void collide()
  {
    if (comp) {
      if (player.lx>px&&player;.ly>=py&&player;.ly<=py+80) {
        win();
        player.laser=false;
      }
    }
    for (int i=0;i<balls.length;i++) {
      if (balls[i].bx<250) {
        if ((abs(balls[i].bx-px)<=33)&&balls;[i].by-player.py<=80&&balls;[i].by-player.py>=0) {
          balls[i].dir=PI-balls[i].dir;
        }
      }
      else if (balls[i].bx>250) {
        if ((abs(balls[i].bx-px)<=13)) {
          balls[i].dir=PI-balls[i].dir;
        }
      }
    }
  }
  void laser()
  {
    lx=50;
    ly=player.py+40;
    laser = true;
  }
}

void keyPressed() {
  for (int i=0;i<balls.length;i++)
  {
    if (keyCode==UP) {
      balls[i].speed++;
    }
    else if (keyCode==DOWN) {
      balls[i].speed--;
    }
    if (key==' ') {
      player.laser();
    }
  }
}

int pscore =0;
int cscore =0;

void lose() {
  for (int i=0;i<balls.length;i++) {
    balls[i].bx=250;
    balls[i].by=250;
  }
  cscore++;
}

void win() {
  for (int i=0;i<balls.length;i++) {
    balls[i].bx=250;
    balls[i].by=250;
  }
  pscore++;
}
