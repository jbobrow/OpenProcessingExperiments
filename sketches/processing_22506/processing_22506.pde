
/**
 * KEYS
 * left click       : activate
 * right click      : clear screen
 * s                   : save png
 */
 
PImage img;
PImage bg;
 
 
void setup() {
  size(800, 580);
   img = loadImage("IMG_0351.jpg");
   background (255);
   image(img,0,0);
 
}
 
boolean drawing = false;
 
 
void draw() {
  if (drawing) {
    int x1 = (int) random(0,width);
    int y1 = (int) random(0,height);
 
    int x2 = round(x1 + random(-10, 10));
    int y2 = round(y1 + random(-10, 10));
 
    int w = mouseX;
    int h = mouseY;
 
    copy(x1,y1, w,h, x2,y2, w,h);
  }
}
 
 
void mousePressed () {
  if (mouseButton == LEFT) {
    drawing = true;
    
} else if (mouseButton == RIGHT) {
  
    image(img,0,0);
  }
}
 
void mouseReleased () {
  drawing = false;
}
 
 
 
 
 
void keyReleased() {
    if(keyCode == DELETE || keyCode == BACKSPACE) {
    background (255);
    image(img,0,0);
  }
}


