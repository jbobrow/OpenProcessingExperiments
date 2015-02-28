
import ddf.minim.*;

//for audio
Minim minim;
AudioSample sound;

//song file names
String sounds[] = {"bb.wav",  
                  "b.wav",
                  "ca.wav", 
                  "fe1.wav", 
                  "fe2.wav", 
                   };

//frame file names                  
String frames[] = {"1b.png", "1t.png", "2b.png", "2t.png", "3b.png", "3t.png"};                  

//for font
PFont f;

//for image
PImage img;

int value = 0;
int svalue = 0;
int fvalue = 0;

//setup function
void setup()
{
  size(800, 600);
  img = loadImage("1b.png"); //load image
  minim = new Minim(this);
  sound = minim.loadSample("bb.wav"); //load sound
  sound.setVolume(0.25);
  background(img);
  rectMode(CENTER);
  f = createFont("Arial",13,true);
}

// draw function
void draw()
{ 
  textFont(f,13);
  // draw instruction text
  text("INSTRUCTIONS: \n'S' -> Save Screenshot  'B' -> Change Brush  \n'A' -> Change Audio  'F' -> Change Frame  \nSTART DRAWING !",90,450);
}

// mouse drag event handler
void mouseDragged()
{
  image(img,0,0);
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed*0.5, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 15);
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  line(pmouseX, pmouseY,mouseX, mouseY);
  if (value == 1)
  {
    brush(mouseX, mouseY,speed, speed,lineWidth);
  }
  else if (value == 0)
  {
    brush2(mouseX, mouseY,speed, speed,lineWidth);
  }
}

// mouse release event handler
void mouseReleased()
{
  sound.stop();
}

// mouse press event handler
void mousePressed()
{
  img = loadImage(frames[fvalue+1]);
  sound.trigger();
}

// key press event handler
void keyPressed()
{
  if(key == 's' || key == 'S') // screenshot
    saveFrame("screenshot.png");
    
  if(key == 'b' || key == 'B') // change brush
  {
    value++;
    value = value % 2;
  }
  
  if(key == 'a' || key == 'A') // change audio
  {
    sound.stop();
    svalue++;
    svalue = svalue % 5;
    sound = minim.loadSample(sounds[svalue]);
  }
  
  if(key == 'f' || key == 'F') // chaange frame
  {
    fvalue += 2;
    fvalue = fvalue % 6;
    img = loadImage(frames[fvalue]);
    image(img,0,0);
  }
}
    
// brush 1 implementation    
void brush(float x,float y, float px, float py, float lineWidth) 
{
  strokeWeight(lineWidth);
  rect(x,y,px,py); 
  return;
}

// brush 2 implementation 
void brush2(float x,float y, float px, float py, float lineWidth) 
{
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

