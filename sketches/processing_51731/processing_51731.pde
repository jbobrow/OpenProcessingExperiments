
//April Lee
//Thanks to Ayako Matsuda for the rotating square code.
//D|MA 28 Interactivity

PImage eye;
PImage g1, g2, g3, g4, g5;

float angle = 0.0;
int displayTime = 1000;
float timeElapsed = millis(); 

void setup()
{
  //eye
  float pe = random(1, 18);
  int pickeye = int(pe);
  eye = loadImage(pickeye + ".png"); //load a random eye image

  //gurls
  float gr1 = random(1, 4);
  int girl1 = int(gr1);
  g1 = loadImage("g" + girl1 + ".png");

  float gr2 = random(5, 8);
  int girl2 = int(gr2);  
  g2 = loadImage("g" + girl2 + ".png");

  float gr3 = random(9, 12);
  int girl3 = int(gr3);
  g3 = loadImage("g" + girl3 + ".png");

  float gr4 = random(13, 16);
  int girl4 = int(gr4);
  g4 = loadImage("g" + girl4 + ".png");

  size(600, 600);
  imageMode(CENTER);
  rectMode(CENTER);

  smooth();
  background(0);
  noStroke();
  frameRate(20);
}

void draw()
{
  if (millis()-timeElapsed >= displayTime)
  {
    float x1 = random(0, 650);
    image(g1, x1, x1);

    float x2 = random(0, 650);
    image(g2, x2, x1);

    float x3 = random(0, 650);
    image(g3, x3, x2);

    float x4 = random(0, 650);
    image(g4, x4, x3);

    timeElapsed = millis();
  }

  float cx = random(0, 550);
  fill(0, 30);
  ellipse(width/2, height/2, cx, cx);

  angle = angle + .05;
  translate(width/2, height/2);
  rotate(angle);
  translate(-eye.width/2, -eye.height/2);
  image(eye, eye.width/2, eye.height/2);

  if (mousePressed)
  {
    setup();
  }
}

