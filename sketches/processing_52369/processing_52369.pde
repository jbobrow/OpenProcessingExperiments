
// April Lee
// February 14th 2012
// D|MA 28 Interactivity

PImage eye;
PImage g1, g2, g3, g4, g5, g6, g7, g8;
PShape laser1, laser2, laser3;

float spiralAngle = 0.0;
float scalar = 7;
float speed = 0.25;

float gx = cos(frameCount/30.0) * 200;
float gy = sin(frameCount/30.0) * 200;

float[] girlParamSA = new float[6];
float[] girlParamSB = new float[6];
float[] girlParamSC = new float[6];
float[] girlParamXY = new float[6];

void setup()
{
  for (int i = 0; i <= girlParamSA.length-1; i++)
  { 
    girlParamSA[i] = random(1, 7);
  }

  for (int i = 0; i <= girlParamSB.length-1; i++)
  { 
    girlParamSB[i] = random(1, 5);
  }

  for (int i = 0; i <= girlParamSC.length-1; i++)
  { 
    girlParamSC[i] = random(1, 3);
  }

  for (int i = 0; i <= girlParamXY.length-1; i++)
  { 
    girlParamXY[i] = random(0, 650);
  }

  //eye
  float pe = random(1, 18);
  int pickeye = int(pe);
  eye = loadImage(pickeye + ".png"); //load a random eye image

  //girls
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

  float gr5 = random(1, 16);
  int girl5 = int(gr5);
  g5 = loadImage("g" + girl5 + ".png");

  float gr6 = random(1, 16);
  int girl6 = int(gr6);
  g6 = loadImage("g" + girl6 + ".png");

  laser1 = loadShape("laser1.svg");
  laser2 = loadShape("laser2.svg");
  laser3 = loadShape("laser3.svg");

  size(600, 600);
  imageMode(CENTER);

  smooth();
  background(0);
  noStroke();
}

void girl(PImage girlNumber, int Number, float gx, float gy)
{ 
  float sa = girlParamSA[Number - 1];
  float sb = girlParamSB[Number - 1];
  float sc = girlParamSC[Number - 1];
  float xy = girlParamXY[Number - 1];

  image(girlNumber, gx + xy, gy + xy);
  image(girlNumber, gx/9 + width-xy, gy + height-xy, girlNumber.width/sa, girlNumber.height/sa);
  image(girlNumber, gx + xy, gy/7 + height/2-xy/2, girlNumber.width/sb, girlNumber.height/sb);
  image(girlNumber, gx/5 + width/2+xy/2, gy + xy, girlNumber.width/sc, girlNumber.height/sc);
}

void draw()
{ 
  background(0);

  //girls
  float gx = cos(frameCount/30.0) * 200;
  float gy = sin(frameCount/30.0) * 200;
  tint(255, 215);
  girl(g1, 1, gx, gy);
  girl(g2, 2, gx, gy);
  girl(g3, 3, gx, gy);
  girl(g4, 4, gx, gy);
  girl(g5, 5, gx, gy);
  girl(g6, 6, gx, gy);

  //eye
  float x = cos(spiralAngle) * scalar;
  float y = sin(spiralAngle) * scalar;

  //reverse eye direction when close to edge
  float eyeDist = dist(width/2, height/2, x, y);
  if (eyeDist >= width)
  {
    scalar = -1*scalar;
  }
  tint(255, 255);
  image(eye, width/2 + x, height/2 + y);
  translate(x + width/2, y + height/2);

  spiralAngle += speed;
  scalar += speed;

  //laser
  float laserAngle = sin(frameCount/20.0)*150;
  rotate(laserAngle);  
  if (frameCount % 2 == 0)
  { shape(laser1, 0, 0); }
  else if (frameCount % 3 == 0)
  { shape(laser2, 0, 0); }
  else if (frameCount % 5 == 0)
  { shape(laser3, 0, 0); }

  if (mousePressed)
  {
    setup();
  }
}


