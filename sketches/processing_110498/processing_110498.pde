
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/110498*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;

Minim minim;
AudioPlayer bgmusic;
AudioSample bounce;



float x1=0, y1=random(200, (height-130)/2);
float x2=460, y2=random(300, height-150);
float x3=0, y3=random(100, height-250);
float x4=460, y4=random(200, height-200);

float w1=0, v1=random(80, height-130);
float w2=460, v2=random(80, height-130);

float x1Speed = random(2, 4), y1Speed = random(-4, -2);
float x2Speed = random(-4, -2), y2Speed = random(1, 3);
float x3Speed = random(1, 3), y3Speed = random(2, 4);
float x4Speed = random(-4, -2), y4Speed = random(-3, -1);

float w1Speed = random(2, 4), v1Speed = random(1, 3);
float w2Speed = random(-3, -1), v2Speed = random(-3, -1);

float score=0;
float she=0;
float he=4;
float a = 10;

PImage xl;
PImage shit;
PImage t;
PImage devil;
PImage devil2;
PFont yummyfont;
float angle;
void setup() {

  size(500, 500);
  noCursor();  
  xl = loadImage("xlb.png");
  shit = loadImage("shit.png");
  t = loadImage("ti.png");
  devil = loadImage("devil.png");
  devil2 = loadImage("devil2.png");
  yummyfont = createFont("PWYummyDonuts.ttf", 50);
  minim = new Minim(this);
  bgmusic = minim.loadFile("bgmusic.mp3");
  bgmusic.setGain(0.0);
  minim = new Minim(this);
  bounce = minim.loadSample("bounce.mp3");
  bounce.setGain(0.0);
}

void draw() {


  background(0);
  if (frameCount<600) {
    fill(255);
    textSize(50);
    text("INSTRUCTION", 80, 60);
    textSize(24);
    text("BY USING YOUR MOUSE", 50, 120);
    text("TRY TO GET", 50, 175);
    image(xl, 200, 145, 40, 40);
    text("WITH", 250, 175);
    image(t, 330, 130, 80, 60);
    text("TRY NOT TO GET", 50, 225);
    image(shit, 255, 190, 40, 40);
    text("DO NOT LET THE", 30, 330);
    image(devil, 245, 275, 60, 60);
    text("EAT YOUR", 310, 330);
    image(xl, 440, 300, 40, 40);
    text("YOU CAN TRY TO LET ", 30, 410);
    image(devil, 290, 355, 60, 60);
    text("EAT", 355, 410);
    image(shit, 410, 375, 40, 40);
  }
  //instruction
  if (frameCount > 600) {
    bgmusic.play();
  }
  if (frameCount > 600 && frameCount < 660)
  { 
    textSize(40);
    text("Game will start in 3", 60, 200);
  }
  if (frameCount > 660 && frameCount < 720 )
  {
    textSize(40);
    text("Game will start in 2", 60, 200);
  }
  if (frameCount > 720 && frameCount < 780 )
  {
    textSize(40);
    text("Game will start in 1", 60, 200);
  }
  //countdown
  if (frameCount>780) {
    image(t, mouseX, height-110, 80, 60);
    image(xl, x1, y1, 40, 40);
    x1 = x1 + x1Speed;
    y1 = y1 + y1Speed;
  }
  if (frameCount > 780 && she == 0) {
    image(devil, mouseX, 10, 60, 60);
  }
  if (she == 1) {
    image(devil2, mouseX, 10, 60, 60);
  }
  if (she == 2) {
    a=-100;
  }

  if (frameCount > 960) {
    image(xl, x2, y2, 40, 40);
    x2 = x2 + x2Speed;
    y2 = y2 + y2Speed;

    image(shit, w1, v1, 40, 40);
    w1 = w1 + w1Speed;
    v1 = v1 + v1Speed;
  }
  if (frameCount > 1120) {
    image(xl, x3, y3, 40, 40);
    x3 = x3 + x3Speed;
    y3 = y3 + y3Speed;
    image(xl, x4, y4, 40, 40);
    x4 = x4 + x4Speed;
    y4 = y4 + y4Speed;

    image(shit, w2, v2, 40, 40);
    w2 = w2 + w2Speed;
    v2 = v2 + v2Speed;
  }
  //initial setting



  if (x1 < 0 || x1 > width-40) {
    x1Speed = -x1Speed;
  }
  if (y1 < 0) {
    y1Speed = -y1Speed;
  }
  if (x2 < 0 || x2 > width-40) {
    x2Speed = -x2Speed;
  }
  if (y2 < 0) {
    y2Speed = -y2Speed;
  }
  if (x3 < 0 || x3 > width-40) {
    x3Speed = -x3Speed;
  }
  if (y3 < 0) {
    y3Speed = -y3Speed;
  }
  if (x4 < 0 || x4 > width-40) {
    x4Speed = -x4Speed;
  }
  if (y4 < 0) {
    y4Speed = -y4Speed;
  }

  if (w1 < 0 || w1 > width-40) {
    w1Speed = -w1Speed;
  }
  if (v1 < 0 || v1> height-40) {
    v1Speed = -v1Speed;
  }
  if (w2 < 0 || w2 > width-40) {
    w2Speed = -w2Speed;
  }
  if (v2 < 0 || v2>height-40) {
    v2Speed = -v2Speed;
  }
  //bounce
  if (x1 > mouseX-40 && x1 < mouseX+80 && y1 > height-130 && y1 < height-130+y1Speed-0.1) {
    x1Speed = -x1Speed * random(1, 1.05);
    y1Speed = -y1Speed * random(1, 1.05);
    score++;
    bounce.trigger();
  }
  if (x2 > mouseX-40 && x2 < mouseX+80 && y2 > height-130 && y2 < height-130+y2Speed-0.1) {
    x2Speed = -x2Speed * random(1, 1.05);
    y2Speed = -y2Speed * random(1, 1.05);
    score++;
    bounce.trigger();
  }
  if (x3 > mouseX-40 && x3 < mouseX+80 && y3 > height-130 && y3 < height-130+y3Speed-0.1) {
    x3Speed = -x3Speed * random(1, 1.05);
    y3Speed = -y3Speed * random(1, 1.05);
    score++;
    bounce.trigger();
  }
  if (x4 > mouseX-40 && x4 < mouseX+80 && y4 > height-130 && y4 < height-130+y4Speed-0.1) {
    x4Speed = -x4Speed * random(1, 1.05);
    y4Speed = -y4Speed * random(1, 1.05);
    score++;
    bounce.trigger();
  }

  if (w1 > mouseX-40 && w1 < mouseX+80 && v1 > height-130 && v1 < height-130+v1Speed-0.1) {
    w1Speed = -w1Speed * random(1, 1.1);
    v1Speed = -v1Speed * random(1, 1.1);
    score = score - 2;
    fill(100, 0, 0);
    rect(0, 0, width, height);
  }
  if (w2 > mouseX-40 && w2 < mouseX+80 && v2 > height-130 && v2 < height-130+v2Speed-0.1) {
    w2Speed = -w2Speed * random(1, 1.1);
    v2Speed = -v2Speed * random(1, 1.1);
    score = score - 2;
    fill(100, 0, 0);
    rect(0, 0, width, height);
  }
  //collide
  if (x1 > mouseX-40 && x1 < mouseX+60 && y1 > a && y1 < a+60)
  {
    x1 = -40; 
    y1 = -40;
    x1Speed = 0;
    y1Speed  = 0;
    he--;
  }
  if (x2 > mouseX-40 && x2 < mouseX+60 && y2 > a && y2 < a+60)
  {
    x2 = -40; 
    y2 = -40;
    x2Speed = 0;
    y2Speed  = 0;
    he--;
  }
  if (x3 > mouseX-40 && x3 < mouseX+60 && y3 > a && y3 < a+60)
  {
    x3 = -40; 
    y3 = -40;
    x3Speed = 0;
    y3Speed  = 0;
    he--;
  }
  if (x4 > mouseX-40 && x4 < mouseX+60 && y4 > a && y4 < a+60)
  {
    x4 = -40; 
    y4 = -40;
    x4Speed = 0;
    y4Speed  = 0;
    he--;
  }
  if (w1 > mouseX-40 && w1 < mouseX+60 && v1 > a && v1 < a+60)
  {
    w1 = -40; 
    v1 = -40;
    w1Speed = 0;
    v1Speed  = 0;
    w1=-80;
    v1=-80;
    she++;
  }
  if (w2 > mouseX-40 && w2 < mouseX+60 && v2 > a && v2 < a+60)
  {
    w2 = -40; 
    v2 = -40;
    w2Speed = 0;
    v2Speed  = 0;
    w2=-80;
    v2=-80;
    she++;
  } 
  //eat

  for (int i=0;i<score;i++) {
    image(xl, 70+40*i, 20, 20, 20);
  }
  if (frameCount>600)
  {
    fill(255);
    textSize(15);
    text("score:", 0, 20, 70, 20);
  }
  //score

  if (score==4) {
    fill(200, 100, 60);
    textFont(yummyfont, 70);
    text("yummy", 120, 250);
    x1 = x2 = x3 = x4 = w1 = w2 = width; 
    y1 = y2 = y3 = y4 = v1 = v2 = height;
  }
  if (y1 > height || y2 > height || y3 > height || y4 >height || he == 0) {
    textFont(yummyfont, 50);
    fill(255, 0, 0);
    text("hungry to die", 42, 250);
    x1 = x2 = x3 = x4 = w1 = w2 = width; 
    y1 = y2 = y3 = y4 = v1 = v2 = height;
  }
  //result
}


