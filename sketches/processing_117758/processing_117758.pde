
//Li Cheuk Hin 53077582 Mini Project
PImage mon;
PImage spman;
PImage pow;
import ddf.minim.*;

int x, y;
int d=150;
int m=1;
int last_d = 500;
int last_m = 0;

Minim minim;
AudioSample atk;
AudioPlayer bgmusic;

void setup() {

  size(750, 500);
  minim = new Minim(this);
  atk = minim.loadSample("atk.wav");
  bgmusic = minim.loadFile("angrybird.mp3");
  bgmusic.loop();
  mon = loadImage("mon.png");
  spman =loadImage("spman.png");
  pow = loadImage("pow.gif");

  textFont(createFont("Courier", 50));
  changePosition(-1); //user-defined function 1
  marks(0); //user-defined function 2
}

void draw() {

  fill(0, 10);
  noStroke();
  rect(0, 0, 800, 500);
  fill(255);
  noStroke();
  ellipse(x, y, 10, 10);
  x=floor(random(800));
  y=floor(random(500));
  image(mon, 500, d, 200, 200);
  image(spman, 30, 100, 200, 300);
  fill(200);
  text(m, 300, 100);
}

void keyPressed() {

  stroke(200, 200, 0);
  strokeWeight(50);
  if (key == 'o' && last_d == 0) {
    changePosition(0);
    marks(m=1);
    line(230, 200, 570, 70);
    image(pow, 550, 50, 150, 130);
  } 
  else if (key == 'k' && last_d == 150) {
    changePosition(150);
    marks(m=1);
    line(230, 200, 570, 200);
    image(pow, 550, 200, 150, 130);
  } 
  else if (key == 'm' && last_d == 300) {
    changePosition(300);
    marks(m=1);
    line(230, 200, 570, 430);
    image(pow, 550, 350, 150, 130);
  } 
  else {
    marks(m=0);
  }
}

void changePosition(int except) {

  do {
    d=floor(random(0, 3));
    if (d==0) {
      d=0;
    } 
    else if (d==1) {
      d=150;
    }
    else {
      d=300;
    }
  }
  while (d == except);

  last_d = d;
  
  atk.trigger();
}

void marks(int except) {

  do {
    if (m==1) {
      m=last_m+200;
    } 
    else if (m==0) {
      m=last_m-300;
    }
  }
  while (m == except);

  last_m = m;
}

//sources:
//pow.gif: http://s3.amazonaws.com/rapgenius/Pow.gif


