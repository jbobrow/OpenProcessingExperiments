
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

int x, y;
float x2, y2;
float x3, y3;
float x4, y4;
float x5, y5;
float k, k2, k3, k4, k5;
int  cr = (int)random(64, 192);
int  cg = (int)random(64, 192);
int  cb = (int)random(64, 192);
int dd = 0;

float alpha, alphaMax=64;
float xdir=0, ydir=0;
int di = 50;
int fRate = 29;
float l, ls=0.0;

Maxim maxim;
AudioPlayer player;
float speedAdjust=0.5;
float volumeAdjust=0.25;

void setup()
{
  //size(640, 960);
  size(960, 640);
  //size(displayWidth,displayHeight);

  // background(gray)
  background(0);

  // Draws all geometry with smooth (anti-aliased) edges
  smooth();

  // Specifies the number of frames to be displayed every second. 
  //frameRate(fRate);

  // wandering around, starting at center of screen
  x = width/2;
  y = height/2;

  maxim = new Maxim(this);
  player = maxim.loadFile("174450__sonicfreak__space-ambience_mono2.wav"); 

  player.cue(0);
  player.play();
  player.setLooping(true);
}

void draw()
{
  dd+=1;
  // code that happens every frame
  // drawing - loop over 360 grad

  cr = max(min(cr+(int)random(-24, 24), 255), 0);
  cg = max(min(cg+(int)random(-24, 24), 255), 0);
  cb = max(min(cb+(int)random(-24, 24), 255), 0);

  ls = ls + random(0.1, 0.3);
  if (ls>=2.) {
    ls=random(0.0, 0.2);
  };

  alpha = (int)random(0, alphaMax);

  for ( int i = 0; i < 360; ) {
    cr=max(min(cr+(int)random(-5, 5), 255), 0);
    cg=max(min(cg+(int)random(-5, 5), 255), 0);
    cb=max(min(cb+(int)random(-5, 5), 255), 0);

    alpha = max(min(alpha+(int)random(-3, 3), alphaMax), 0);

    for ( int j = i; j < i+di; j+=47) {      

      l=random(ls+0.1, ls+0.3);

      // grad (360) to angle (2pi)
      k2 = 2*PI*((float) j) / 360.0;
      k3 = 2*PI*((float) (j+(int)random(5/l, 13/l))) / 360.0;

      x4 = x + (int) ((ls*width)*cos(k2));
      y4 = y + (int) ((ls*height)*sin(k2));

      x5 = x + (int) ((ls*width)*cos(k3));
      y5 = y + (int) ((ls*height)*sin(k3));


      x2 = x + (int) ((l*width)*cos(k2));
      y2 = y + (int) ((l*height)*sin(k2));

      x3 = x + (int) ((l*width)*cos(k3));
      y3 = y + (int) ((l*height)*sin(k3));

      noStroke();
      fill(cr, cg, cb, alpha);
      //triangle (x, y, x2, y2, x3, y3);
      quad(x5, y5, x4, y4, x2, y2, x3, y3);
    }

    i+=di;
    di = (int)random(30, 100);
  }

  // recalculate the center of the drawing: x, y
  if (dd % (int)(fRate/1) == 0) {
    x = max(min(x + (int)(xdir*random(1)), width), 0);
    y = max(min(y + (int)(ydir*random(1)), height), 0);

    xdir = max(min(xdir+random(-3, +3), 15), -15);
    ydir = max(min(ydir+random(-3, +3), 15), -15);

    if (x>=width  || x<=0) { 
      xdir=-xdir;
    };
    if (y>=height || y<=0) { 
      ydir=-ydir;
    };

    speedAdjust = map(mouseX, 0, width, 0.2, 1.0);
    volumeAdjust = map(mouseY, 0, height, 0.5, 0);
    player.speed(speedAdjust);
    player.volume(volumeAdjust);
    player.play();
  }
}

void mouseDragged()
{
  // code that happens when the mouse moves
  // with the button down
  speedAdjust = map(mouseX, 0, width, 0.2, 1.0);
  volumeAdjust = map(mouseY, 0, height, 0.5, 0);
  player.speed(speedAdjust);
  player.volume(volumeAdjust);
  player.play();
}

void mousePressed()
{
  // code that happens when the mouse button
  // is pressed
  x = mouseX;
  y = mouseY;
}

void mouseReleased()
{
  // code that happens when the mouse button
  // is released

    switch ((int)random(1, 3.9)) {
  case 1:
    cr=(int)map(mouseX, 0, width, 0, 255);
    cg=(int)map(mouseY, 0, height, 0, 255);
    break;
  case 2:
    cg=(int)map(mouseX, 0, width, 0, 255);
    cb=(int)map(mouseY, 0, height, 0, 255);
    break;
  case 3:
    cg=(int)map(mouseX, 0, width, 0, 255);
    cr=(int)map(mouseY, 0, height, 0, 255);
    break;
  }
}



