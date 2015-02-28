
import gifAnimation.*;
Gif myAnimation;
PFont font;
float lineSep = 100;
int nLines = 0;
float ypos;
PImage img;      
String phrase = "";
color fakeCol = color(100,100,100);
int loc;
float maxSize;
 
void setup()
{
  smooth(); 
 img = loadImage("curtain.png");
  font = loadFont("Serif-48.vlw");
  textFont(font,120);
  textAlign(CENTER);
  textLeading(lineSep);
 
  
   myAnimation = new Gif(this, "08.gif");

	myAnimation.play();
  size(myAnimation.width, myAnimation.height);
  maxSize = 0.95*width;
  ypos = 0.5*height;
}
 
void draw() {
 
  image(myAnimation,0,0,width,height);
  image(img,0,0,width,height);
  fill(fakeCol);
  text(phrase,0.5*width,ypos);
 
  loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      loc = x + y*width;
      if (pixels[loc] == fakeCol){
        pixels[loc] = myAnimation.pixels[loc];
      }
    }
  }
  updatePixels();
}
 
void keyReleased() {
  if(key != CODED) {
    if(textWidth(phrase + key) > maxSize) {
      phrase = phrase + "\n";
      nLines++;
      ypos = 0.5*height - nLines*lineSep*0.5;
    }
    phrase = phrase + key;
    if(key == ENTER) {
      nLines++;
      ypos = 0.5*height - nLines*lineSep*0.5;
    }     
  }
}
 
void mousePressed() {
  if(mouseButton == RIGHT){
    lineSep = lineSep*0.8;
  }
  if(mouseButton == LEFT){
    lineSep = lineSep/0.8;
  }
  textLeading(lineSep);
  ypos = 0.5*height - nLines*lineSep*0.5;
}


