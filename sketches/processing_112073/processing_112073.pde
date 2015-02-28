
import ddf.minim.*;

Minim minim;

AudioSample lose;
AudioSample win;
AudioPlayer bgsound;


float x = 130, y = 180;
float xSpeed = random(3, 1);
float ySpeed = random(5, 1);

float a = 20, b = 150;
float aSpeed = random(3, 5);
float bSpeed = random(4, 6);

float c = 130, d = 180;
float cSpeed = random(7, 5);
float dSpeed = random(5, 8);

float e = 250, f = 300;
float eSpeed = random(4, 5);
float fSpeed = random(3, 6);

float g = 300, h = 400;
float gSpeed = random(5, 8);
float hSpeed = random(4, 9);

float lr = 0;
float lrSpeed = 5;
float ud = 0;
float udSpeed = 5;
int score = 0;

PImage img;

void setup() {
  size(600, 600);
  noStroke();
  img = loadImage("rat.png");

 minim = new Minim(this);
  lose = minim.loadSample("145811_SOUNDDOGS__ga.mp3");
  win = minim.loadSample("469890_SOUNDDOGS__ba.wav");
  bgsound = minim.loadFile("BoxCat_Games_-_08_-_CPU_Talk.wav");
  bgsound.loop();

}

void draw() {
  fill(0);
  rect(0, 0, 600, 600);
  fill(255);
  rect(100, 100, 400, 400);
  fill(0);
  rect(200, 200, 200, 200);
  fill(255);
  rect(250, 250, 100, 100);
  fill(0, 255, 0);
  textSize(20);
  text("GO HERE", 254, 310);
  fill(0, 255, 255);
  text("score ="+ score, 100, 100);

  //ball 1
  fill(255);
  ellipse(x, y, 50, 50);
  x = x + xSpeed;
  y = y + ySpeed;
  if (x > width-5 || x < 5) {
    xSpeed = -xSpeed;
  }
  if (y > height-5 || y < 5) {
    ySpeed = -ySpeed;
  }
  //ball 2
  fill(0);
  ellipse(c, d, 10, 10);
  c = c + cSpeed;
  d = d + dSpeed;
  if (c > width-5 || c < 5) {
    cSpeed = -cSpeed;
  }
  if (d > height-5 || d < 5) {
    dSpeed = -dSpeed;
  }

  //ball 3
  fill(255);
  ellipse(a, b, 10, 10);
  a = a + aSpeed;
  b = b + bSpeed;
  if (a > width-5 || a < 5 )
  {
    aSpeed *= -1;
  }

  if (b > height-5 || b < 5 )
  {
    bSpeed *= -1;
  }


  if ((b >= 100 && bSpeed>0) && a > 105 && a < 500)
  {
    bSpeed *= -1;
  }

  if ((b >= 500 && bSpeed<0) && a > 105 && a < 500)
  {
    bSpeed *= 1;
  }

  fill(0);
  ellipse(e, f, 10, 10);
  e = e + eSpeed;
  f = f + fSpeed;
  if (e > width-5 || e < 5 || e > 200 && e < 400 ) {
    eSpeed = -eSpeed;
  }
  if (f > height-5 || f < 5) {
    fSpeed = -fSpeed;
  }

  fill(0);
  ellipse(g, h, 20, 20);
  g = g + gSpeed;
  h = h + hSpeed;
  if (g > width-5 || g < 5 )
  {
    gSpeed = -gSpeed;
  }

  if (h > height-5 || h < 5 )
  {
    hSpeed = -hSpeed;
  }



  //mouse move
  image(img, lr, ud, 50, 50);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      ud = ud - udSpeed;
    }
    if (key == 's' || key == 'S') {
      ud = ud + udSpeed;
    }
    if (key == 'a' || key == 'A') {
      lr = lr - lrSpeed;
    }
    if (key == 'd' || key == 'D') {
      lr = lr + lrSpeed;
    }
  }

  //mouse move to centre
  if (lr >= 240 && lr <= 300 && ud >=245 && ud <= 305)
  {
    textSize(32);
    fill(0, 0, 255);
    text("YOU WIN", 200, 200);
    text("PRESS R TO PLAY AGAIN", 200, 500);
    win.trigger();
    noLoop();
    score += 2;
  }

  //ball hit the mouse
  if ( x <= lr+50 && x >= lr &&  y <= ud+50 && y >= ud||
    a <= lr+50 && a >= lr &&  b <= ud+50 && b >= ud||
    c <= lr+50 && c >= lr &&  d <= ud+50 && d >= ud||
    e <= lr+50 && e >= lr &&  f <= ud+50 && f >= ud
    )

  {
    textSize(32);
    fill(255, 0, 0);
    text("YOU LOSE", 200, 200);
    noLoop();
    text("PRESS R TO RESTART", 200, 500);
    lose.trigger();
    score -= 1;
  }
}
// restart the game
void keyReleased() {
  if (key == 'r' || key == 'R') {
    loop();
    lr = random(0,600);
    ud = random(0,600);
    x = 200;
    y = 300;
  }
}


