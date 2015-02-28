
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;

float vol = 0;

Circle[] circle = new Circle[1000];
int currentCircle = 0;
float bCirsY, bCir1X, bCir2X;


void setup()
{
  background(0);
  size(500, 500);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);

  minim = new Minim(this);
  audio = minim.loadFile("techno.mp3");
  audio.loop();

  bCirsY = height*.5;
  bCir1X = width*.25;
  bCir2X = width*.75;
}

void draw() {
  background(0);

  vol = audio.mix.level();

  if (audio.position() < 8000) 
  {

    float dia = vol*500;
    float trans = getTrans(dia);
    fill(230, trans);


    ellipse(bCir1X, bCirsY, dia, dia);
    ellipse(bCir2X, bCirsY, dia, dia);

    if ( audio.position() > 5600)
    {
      bCir1X--;
      bCir2X++;
    }
  }

  else {

    circle[currentCircle] = new Circle();

    if (circle[currentCircle] != null)
    {
      circle[currentCircle].x = random(width);
      circle[currentCircle].y = height - vol*1200;

      if (circle[currentCircle].y < 20)
        circle[currentCircle].y = 20;


      strokeWeight(6);
      stroke(255);
      line(width/2, height, circle[currentCircle].x, circle[currentCircle].y);


      for (int i = 0; i<currentCircle; i++) {
        if (circle[i].y < 300 && circle[i].colorChanged == false) {
          circle[i].r = random(255);
          circle[i].g = random(255);
          circle[i].b = random(255);
          circle[i].colorChanged = true;
        }

        strokeWeight(4);
        stroke(255, circle[i].trans);   
        fill(circle[i].r, circle[i].g, circle[i].b, circle[i].trans);  
        ellipse(circle[i].x, circle[i].y, circle[i].dia, circle[i].dia);

        circle[i].trans -=10;
      }

      currentCircle++;
      if (currentCircle == circle.length - 1) {
        currentCircle = 0;
      }
    }
  }
}


float getTrans(float dia)
{
  float trans;   
  trans = 5 * dia;  
  return trans;
}


class Circle
{
  float trans = 300;
  float x = 0, y = 0, dia = 20;
  float r =0, g = 0, b = 0;
  boolean colorChanged = false;
}


