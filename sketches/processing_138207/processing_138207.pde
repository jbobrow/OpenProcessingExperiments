
//Import Library minim

import ddf.minim.*;

// Globale Variables

float x = 30;
float y = 30;
color[] bzaf = {#FF5555,#27BCF0,#0CE5A2,#F0DD0A,#F0DD0A,#D80AF0,#F0470A};
Minim minim;

AudioSample a;
AudioSample b;
AudioSample c;
AudioSample d;
AudioSample e;
AudioSample f;
AudioSample g;
//Setup

void setup()
{
  size(700,300);
  minim = new Minim(this);
  a = minim.loadSample("a.wav");
  b = minim.loadSample("b.wav");
  c = minim.loadSample("c.wav");
  d = minim.loadSample("d.wav");
  e = minim.loadSample("e.wav");
  f = minim.loadSample("f.wav");
  g = minim.loadSample("g.wav");
}
void draw()
{
    background(0);
//Change color according to the key
  textSize(20);
  text("Press keys a. z. e. r. t. y. u to play piano and s to take Screenshot",0,20);
  if(key == 'a' || key == 'A')
  {
      x = random(width);
      y = random(height);
      float a = random(mouseX);
      float b = random(mouseY);
      ellipse(x,y,a,b);
  }
    if(key == 'z' || key == 'Z')
  {
      x = random(width);
      y = random(height);
      float d = random(650);
      ellipse(x,y,d,d);
  }
    if(key == 'e' || key =='E')
  {
      x = random(width);
      y = random(height);
      float d = random(100);
      ellipse(x,y,d,d);
  }
    if(key == 'r' || key == 'R')
  {
      x = random(width);
      y = random(height);
      float d = random(200);
      ellipse(x,y,d,d);
  }
    if(key == 't' || key == 'T')
  {
      x = random(width);
      y = random(height);
      float d = random(500);
      ellipse(x,y,d,d);
  }
    if(key == 'y' || key == 'Y')
  {
      x = random(width);
      y = random(height);
      float d = random(600);
      ellipse(x,y,d,d);
  }
    if(key == 'u' || key == 'U')
  {
      x = random(width);
      y = random(height);
      float d = random(300);
      ellipse(x,y,d,d);
  }
}
void keyPressed()
{
  
//Play Piano 
  
  //A key of pioano
  
  if(key == 'a' || key == 'A')
  {
    a.trigger();
    fill(bzaf[0]);
  }  
 
  //B key of pioano
  
  if(key == 'z' || key == 'Z')
  {
    b.trigger();
    fill(bzaf[1]);
  }
  
  //C key of pioano  
  
  if(key == 'e' || key =='E')
  {
    c.trigger();
    fill(bzaf[2]);
  }
  
  //D key of pioano   
  
  if(key == 'r' || key == 'R')
  {
    d.trigger();
    fill(bzaf[3]);
  }
  
  //E key of pioano  
  
  if(key == 't' || key == 'T')
  {
    e.trigger();
    fill(bzaf[4]);
  }
  
  //F key of pioano   
  
  if(key == 'y' || key == 'Y')
  {
    f.trigger();
    fill(bzaf[5]);
  }
  
  //G key of pioano   
  
  if(key == 'u' || key == 'U')
  {
    g.trigger();
    fill(bzaf[6]);
  }  
    if(key == 's' || key == 'S')
  {
    saveFrame("ScreenShot.jpg");
  }
}

