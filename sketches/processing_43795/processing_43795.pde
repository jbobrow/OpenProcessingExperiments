
import ddf.minim.*;

Minim minim;
AudioSample sample;

PImage head;  
PImage fog;

PImage[] eyes=new PImage[4];
PImage[] brow=new PImage[4];
PImage[] nose=new PImage[4];
PImage[] mouth=new PImage[4];




int x= 150; //set size of image
int currentArrayIndex = 0;

Fog [ ] fo =new Fog[7];

class Fog
{
  float x=random(-40, 600);
  float y = random (-40, 80);
  float sz =random(50, 100);
  void drawfog()
  {
    image(fog, x, y, sz, sz);
  }
}

void setup()
{   
  setsketchnsound();
  loadfaceimage();
  drawinitialfaceimage();
  fog= loadImage("22.png");
  text("Click anywhere to see the family members!", width/2, x+35);
}


void draw() {
  for (int i = 0; i < fo.length; i++) {
    if (fo[i] != null)
    {
      fo[i].drawfog();
    }
  }

  if (mousePressed)
  {
    createfog();
    sample.trigger();
    drawface();
  }
}


void setsketchnsound() {
  size(600, 200);
  background(255);
  smooth();
  noStroke();
  textFont(createFont("Victorian LET", 19));
  textAlign(CENTER);
  fill(255, 0, 0);
  minim = new Minim(this);
  sample = minim.loadSample("815.mp3");
  //mp3 file from http://sc.chinaz.com/yinxiao/1406069669.htm
}

void loadfaceimage()
{ 
  for (int i=0; i< eyes.length; i++)
  { 
    eyes[i]=loadImage(i+"e.png");
    brow[i]=loadImage(i+"b.png");
    nose[i]=loadImage(i+"n.png");
    mouth[i]=loadImage(i+"m.png");
  }
}

void drawinitialfaceimage()
{ 
  head= loadImage("bg.png");
  for (int m=0; m<width; m=m+x)
  {  
    image(head, m, 10, x, x);
    image(eyes[int(random(4))], m, 10, x, x); 
    image(brow[int(random(4))], m, 10, x, x); 
    image(nose[int(random(4))], m, 10, x, x); 
    image(mouth[int(random(4))], m, 10, x, x);
  }
}

void drawface()
{
  for (int m=0; m<width;  m=m+x)  //set the image to move to the right
  {  
    image(eyes[int(random(4))], m, 10, x, x);   
    image(brow[int(random(4))], m, 10, x, x);   
    image(nose[int(random(4))], m, 10, x, x);   
    image(mouth[int(random(4))], m, 10, x, x);
  }
}

void createfog() {
  Fog newF = new Fog();
  fo[currentArrayIndex] = newF;
  currentArrayIndex++;
  if (currentArrayIndex == fo.length-1)
  {  
    currentArrayIndex = 0;
  }
}

void stop()
{ 
  sample.close();
  minim.stop();  
  super.stop();
}


