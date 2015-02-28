
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float SMOOTHING = 0.90;
float vol = 0;
Ln[] ln = new Ln[2];
Circle[] circle = new Circle[100];
int currentArrayIndex = 0;


void setup()
{
  size(500, 500);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);

  minim = new Minim(this);
  audio = minim.loadFile("techno.mp3");
  audio.loop();
}

void draw() {
  background(0);

  vol = audio.mix.level();



  for (int i = 0; i < ln.length; i++) {
    ln[i] = new Ln();
    circle[i] = new Circle();

    if (ln[i] != null)
    {
      ln[i].x = random(width);
      ln[i].y = height - vol*1000;

      strokeWeight(5);
      stroke(255, ln[i].trans);
      line(width/2, height, ln[i].x, ln[i].y);
      println(ln[i].y);
      
      if(ln[i].y < 200)
          fill(random(255), random(255), random(255));
      ellipse(ln[i].x, ln[i].y, 20, 20);
      
      
    }
  }
}

class Ln
{
  float trans=100, x, y;
}

class Circle
{
  float x, y, trans, dia;
}

//circles at end of lines


