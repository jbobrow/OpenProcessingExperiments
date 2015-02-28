
PImage life;
PImage end;
PFont font;
float x = 0;
float s = 0;
float y = 0;
float z = 0;
float d = 0;
float p = 0;
float timer = 0;
float slideTimer = 0;
float ignighter = 0;
import ddf.minim.* ;
Minim minim;
AudioPlayer music;

void setup()
{
  size(300, 500);
  frameRate(10);
  background(180);
  smooth();
  noStroke();
  life = requestImage("life1.png");
  end = requestImage("heartbeatEnd.png");
  font = loadFont("Font.vlw");
  frameRate(15);
  minim = new Minim(this) ;
  music = minim.loadFile("music.wav") ;
}

void draw()
{
  //println("x: " + mouseX + " y: " + mouseY);
  //println(slideTimer);
  if (ignighter > 0)
  {
    slideTimer += 0.0667;
  }
  else
  {
    image(life, 0, -250);
  }
  if (slideTimer < 50.5 && slideTimer > 0)
  {
    image(life, 0 - s, -250);
    s += 2.5;
    stroke(0);
    strokeWeight(1);
  }
  if (slideTimer == 50.55859)
  {
    background(180);
  }

  if (slideTimer > 50.6)
  {
    timer += 0.0667;
    x += 3;
    if (timer < 1)
    {
      line(0, 250, 0 + x, 250);
    }
    if (timer > 1 && timer < 1.2)
    {
      y += 20;
      line(41, 250, x, 250 - y);
    }
    if (timer > 1.2 && timer < 1.6)
    {
      z += 20;
      line(51, 189, x, 189 + z);
    }
    if (timer > 1.6 && timer < 1.8)
    {
      d += 20;
      line(69, 307, x, 307 - d);
    }
    if (timer > 1.8)
    {
      line(78, 248, x, 248);
    }
    if (timer > 6.6032987)
    {
      p += 3;
      image(end, 0 - p, 0);
    }
    else
    {
      fill(0);
      textFont(font, 28);
      text("THE END", 100, 400);
      noFill();
    }
  }
}

void mouseClicked()
{
  music.play();
  ignighter = 1;
}

void stop()
{
  music.close();
  minim.stop();
  super.stop();
}

// Background music: Blitzen Trapper Stranger in a strange land


