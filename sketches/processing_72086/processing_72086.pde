
//Music
import ddf.minim.*;

Minim minim = new Minim(this);

//name of sound effects
AudioSample bounce;
AudioSample win;
AudioPlayer bgm;

//ball position & moving speed
float circleX = 450;
float circleY = 263;
float t1 = 5;
float t2 = 2;

//socre
int scoreA = 0;
int scoreB = 0;
String score = ":";

//cpu movemnet
float cpu = 213;
float cpuspeed = 3;

//image: frame + paddle + ball + title
PImage frameUP;
PImage frameDOWN;
PImage frameLEFT;
PImage frameRIGHT;
PImage bgFloor;
PImage ball;
PImage padUser;
PImage padCpu;
PImage title;
PImage base;



void setup ()
{
  //window size
  size (900, 700);
  smooth();
  
  //load image: frame + floor + paddle + title + ball
  frameUP = loadImage("frame_up.png");
  frameDOWN = loadImage("frame_down.png");
  frameLEFT = loadImage("frame_left.png");
  frameRIGHT = loadImage("frame_right.png");
  bgFloor = loadImage("floor.png");
  ball = loadImage("ball.png");
  padUser = loadImage("pad_user.png");
  padCpu = loadImage("pad_cpu.png");
  title = loadImage("title.png");
  base = loadImage("base.png");


  //load + play background music
  bgm = minim.loadFile("bgm.mp3", 4096);
  bgm.loop();

  //load sound effects
  bounce = minim.loadSample("pong.mp3");
  win = minim.loadSample("win.wav");
}

void draw()
{
  //background
  fill (0);
  rect (0, 0, width, height-75);


  //frame + floor
  image(bgFloor, 0, 0);
  image(bgFloor, 0, 525);
  image(frameUP, 0, 0);
  image(frameDOWN, 0, 500);
  image(frameLEFT, 0, 25);
  image(frameRIGHT, 875, 25);
  image(base, 0, 525);

  //middle line
  noStroke();
  fill (36, 147, 72, 224);
  rect (447, 25, 6, 475);

  //score
  PFont font;
  font = loadFont ("Andalus-48.vlw");
  fill (255);
  textFont (font, 30);
  text (scoreA, 230, 580);
  text (scoreB, 670, 580);
  text (score, 447, 580);

  //title
  image(title, 250, 600);


  //user paddle
  image(padUser, 830, mouseY-40);
  if (mouseY >= 500) {
    mouseY = 500;
  }
  //cup paddle
  image(padCpu, 41, cpu-40);
  if (cpu >=500) {
    cpu = 500;
  }

  //ball
  image(ball, circleX, circleY);
  circleX = circleX +t1;
  circleY = circleY +t2;

  //bouncing on the long edge
  if ((circleY > 480) || (circleY <25)) {
    t2 = t2 * -1;
    bounce.trigger();
  }

  //user side bounce
  if (circleX == 810) {
    if ((circleY > mouseY-50) && (circleY < mouseY+30)) {
      t1 = t1 * -1;
      bounce.trigger();
      cpuspeed = random(0, 4);
    }
    else {
      scoreA = scoreA + 1;
      win.trigger();
    }
  }

  //cpu side bounce
  if (circleX == 70) {
    if ((circleY > cpu-50) && (circleY < cpu+30)) {
      t1 = t1 * -1;
      bounce.trigger();
    }
    else {
      scoreB = scoreB + 1;
      win.trigger();
    }
  }


  //cpu movement   



  if (t1 < 0) { 
    if (cpu != circleY && cpu < circleY) {
      cpu = cpu + cpuspeed;
    }

    if (cpu != circleY && cpu > circleY) {
      cpu = cpu - cpuspeed;
    }
  }


  // start over
  if ((circleX < 0) || (circleX>900)) {
    t1 = t1 * -1;
    circleX = 450;
    circleY = random(45, 480);
    t2 = random(-5, 5);
    cpuspeed = random(0, 4);
  }
}
void stop()
{
  // always close Minim audio classes when you are done with them
  bounce.close();
  win.close();
  bgm.close();
  minim.stop();
  super.stop();
}


