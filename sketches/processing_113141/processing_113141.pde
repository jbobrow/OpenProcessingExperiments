
PImage BF4;
PImage BF4glitch;
PImage BF4logo;
PImage FrostBite3;
PFont BFont;
PFont BFnumberFont;
float filterTimer = 0.0;
float timer = 0;
float jetScale = 1;
float ellipseX = 1;
float ellipseY = 2;

import ddf.minim.* ;
Minim minim;
AudioPlayer au_player1, au_player2 ;

void setup()
{
  size(810, 456);
  BF4glitch = requestImage("BF4glitch.jpg");
  BF4 = requestImage("BF4.jpg");
  BF4logo = requestImage("BF4logo.jpg");
  FrostBite3 = requestImage("Frostbite.jpg");
  BFont = loadFont("BFont.vlw");
  BFnumberFont = loadFont("BFnumberFont.vlw");
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  minim = new Minim(this) ;
  au_player1 = minim.loadFile("Battlefield 4.wav") ;
  noStroke();
}

void draw()
{
  println("x: " + mouseX + " y: " + mouseY);
  println(timer);
  au_player1.play() ;
  filterTimer += 1;
  timer = timer + 0.0167;

  if (timer < 3)
  {
    image(BF4, 0, 0, width, height);
  }
  if (timer == 3)
  {
    image(BF4, 0, 0, width, height);
  }
  if (timer > 6 && timer < 9)
  {
    image(BF4glitch, 0, 0, width, height);
    noFill();
    colorMode(HSB);
    stroke(random(360), 50, 50);
    strokeWeight(2);
    beginShape();
    curveVertex(0, 117); 
    curveVertex(58, 138); 
    curveVertex(111, 165);
    curveVertex(random(160, 165), random(185, 195));
    curveVertex(random(240, 245), random(210, 220));
    curveVertex(323, 216); 
    curveVertex(441, 240);
    endShape();
  }
  if (timer == 9)
  {
    image(BF4glitch, 0, 0, width, height);
  }
  if (timer > 10 && timer < 17)
  {
    background(0);
    image(FrostBite3, 405 - 456 / 2, 0, 456, 456);
    colorMode(GRAY, 255);
    strokeWeight(2);
    stroke(255);
    line(random(width), random(height), random(width), random(height));
    ellipseX += 1;
    ellipseY += 1;
    fill(random(0, 55));
    noStroke();
    ellipse(410, 212, 60 + ellipseX * random(1, 2), 60 + ellipseY * random(1, 2));
    ellipse(410, 212, 30 + ellipseX * random(1, 2), 30 + ellipseY * random(1, 2));
  }
  if (timer >= 17 && timer < 19)
  {
    colorMode(GRAY);
    background(0); 
    int zoomFactor = int(random(3));
    println(zoomFactor);
    scale(zoomFactor);
    if (zoomFactor == 2)
    {
      image(BF4logo, -200, -200, width, height);
      filter(BLUR, random(0, 3));
    }
    else
    {
      image(BF4logo, 0, 0, width, height);
      filter(BLUR, random(0, 3));
    }
  }
  if (timer > 20)
  {
    image(BF4logo, 0, 0, width, height);
  }

  if (filterTimer >= 70)
  {
    filter(ERODE);
    filterTimer = 0;
  }
  else
  {
    if (filterTimer == 40 || filterTimer == 50 || filterTimer == 20 || filterTimer == 30)
    {
      filter(DILATE);
    }
  }
  if (timer < 17)
  {
    colorMode(GRAY, 255);

    textFont(BFont, random(45, 55));
    fill(random(200, 255));
    text("BATTLEFIELD", random(190, 261), random(136, 158));

    textFont(BFnumberFont, random(75, 85));
    fill(random(200, 255));
    text("4", 385, 207);
  }
  if (timer < 6)
  {
    strokeWeight(2);
    stroke(random(360), 100, 100);
    line(random(width), random(height), random(width), random(height));
  }
}

void stop()
{
  minim.stop() ;
  super.stop() ;
}


