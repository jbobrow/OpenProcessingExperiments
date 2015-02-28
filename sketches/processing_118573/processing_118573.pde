
import controlP5.*;

ControlP5 cp5;
PFont font;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
int myColor = color(255);

int c1,c2;

float n,n1;

import ddf.minim.*;

Animation animation1;
Minim minim;
AudioSample granada;


float size = 1;




void setup() {
  size(1280, 920);
  minim = new Minim(this);
  a = loadImage("fondo.jpg");
  b = loadImage("shooter1.png");
  c = loadImage("shooter2.png");
  d = loadImage("shooter3.png");
   e = loadImage("hud.png");
  animation1 = new Animation("PT_Shifty_", 16); 
  granada = minim.loadSample( "granada.mp3", // filename
  512      // buffer size
  );

  
  // create a new button with name 'buttonA'
 
}

void draw() {
 

 background(0);
  //imageMode(CENTER);
 
  image(a, 0, 0);
    if ((mouseX >= 0)&&(mouseX <= 267))    
    image(b, mouseX, 400);
 if ((mouseX >= 267)&&(mouseX <= 534))    
    image(c, mouseX, 400);
    if ((mouseX >= 543)&&(mouseX <= 800))    
    image(d, mouseX, 400);
    fill(0,150,200,50);
  stroke(255);
    
    rect(100,100,100,100);
    
    if ((mouseX >= 100)&&(mouseX <= 200)&&(mouseY>=100)&&(mouseY<=200)){
    scale(1.3);
    image(e, 0, 0);}
    
   
    
   fill(255);
     font = loadFont("Krungthep-48.vlw");
textFont(font, 32);

text("VISTA", 100, 150);
   
}

void mousePressed() {

 
  
  if (mousePressed)
      scale(1);
 
  /*animation1.display(mouseX+400, mouseY +50);
  granada.trigger();
*/
  
}

// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}


