
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs font="Georgia.ttf"; */

String message = "cucco";

float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

PImage bg;
PImage hide;
PImage link;
PImage link2;
PImage cucco;

PFont font;

void setup() {
  noCursor();
  imageMode(CENTER);
  size(640, 460);
  
  bg = loadImage("bg.png");
  hide = loadImage("hide.png");
  link = loadImage("link.gif");
  link2 = loadImage("link2.gif");
  cucco = loadImage("cucco.gif");
  
  font = loadFont ("ZeldaDXTT-BRK--48.vlw");
  textFont(font, 36);
  textAlign(CENTER, BASELINE);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  background(bg);
  
  image(link, mouseX, mouseY, 17,24);
  image(hide,width/2,height/2,640,460);
  
  text("CUCCO", x, y);
    if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
    

  if (mousePressed == true) {
    
    for (int i=0; i<width+100; i+=50) {
      for (int j=0;j<height;j+=35) {
         
        pushMatrix();
        scale(random(0.3,2));
         
        image(cucco, i, j);
        popMatrix();
        
        tint(255,0,0);
        image(link, mouseX, mouseY, 17,24);
        noTint();       
      }
    }
  }
  
  else
  {      
    pushMatrix();
    background(bg);
    image(link, mouseX, mouseY, 17,24);
    image(hide,width/2,height/2,640,460);
   
    tint(255,0,0);
    image(cucco, x, y);
    noTint();
    
    image(link2,mouseX,mouseY);
    scale(0.5);
    text("CUCCO", x*2,y*2);
    popMatrix();
  }
 
}

}


