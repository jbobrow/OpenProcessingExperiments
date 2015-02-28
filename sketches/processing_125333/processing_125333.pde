
import ddf.minim.*;

Minim minim;
AudioSample sound;
String sounds[] = {"Cosmic Arp 175.wav", 
                  "Funky Electro Full.wav",
                  "Heavy Bass 175.wav",
                  "Jungle 160 Amen Break.wav",
                  "Melodic Dubstep 140.wav",
                  };
                  
String frames[] = {"1b.png", "1t.png", "2b.png", "2t.png", 
                  "3b.png", "3t.png", "4b.png", "4t.png"};                  

PImage img;
PFont f;
int value = 0;
int svalue = 0;
int fvalue = 0;

void setup()
{
  size(800, 600);
  img = loadImage("1b.png");
  minim = new Minim(this);
  sound = minim.loadSample("Cosmic Arp 175.wav");
  sound.setVolume(0.25);
  background(img);
  rectMode(CENTER);
  f = createFont("Arial",13,true);
}

void draw()
{
  textFont(f,13);
  text("INSTRUCTIONS: \n'S' -> Save Screenshot  'B' -> Change Brush  \n'A' -> Change Audio  'F' -> Change Frame  \nSTART DRAWING !",90,450);
  
}


void mouseDragged()
{
  image(img,0,0);
  
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed*0.5, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  line(pmouseX, pmouseY,mouseX, mouseY);
  if (value == 0)
  {
    brush(mouseX, mouseY,speed, speed,lineWidth);
  }
  else if (value == 1)
  {
    brush2(mouseX, mouseY,speed, speed,lineWidth);
  }
  else if (value == 2)
  {
    brush3(mouseX, mouseY,speed, speed,lineWidth);
  }
  else if (value == 3)
  {
    brush1(mouseX, mouseY,speed, speed,lineWidth);
  }
}

void mouseReleased()
{
  sound.stop();
}

void mousePressed()
{
  img = loadImage(frames[fvalue+1]);
  sound.trigger();
}

void keyPressed()
{
  if(key == 's' || key == 'S') saveFrame("screenshot.png");
  
  if(key == 'b' || key == 'B')
  {
    value++;
    value = value % 4;
  }
  
  if(key == 'a' || key == 'A')
  {
    sound.stop();
    svalue++;
    svalue = svalue % 5;
    sound = minim.loadSample(sounds[svalue]);
  }
  
  if(key == 'f' || key == 'F')
  {
    fvalue += 2;
    fvalue = fvalue % 8;
    img = loadImage(frames[fvalue]);
    image(img,0,0);
  }
}
    

void brush(float x,float y, float px, float py, float lineWidth) 
{
  strokeWeight(lineWidth);
  rect(x,y,px,py); 
  
  return;
}

void brush1(float x,float y, float px, float py, float lineWidth) 
{
  strokeWeight(lineWidth);
  ellipse(x,y,px,py); 
  
  return;
}

void brush2(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brush3(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();

  return;
}

