

/**
 * Image Feedback Process. The picture pixelates the image. 
 * 
 * KEYS
 * del, backspace      : clear screen
 * s                   : save png
 */

import java.util.Calendar;

PImage img;

void setup() {
  size(1024, 580);
  //img = loadImage(selectInput("select an image"));
  img = loadImage("pic.jpg");
  background(255);
  image(img,0,0);
}

void draw() {
  int x1 = (int) random(0,width);
  int y1 = (int) random(0,height);

  int x2 = round(x1 + random(-10, 10));
  int y2 = round(y1 + random(-10, 10));

  int w = 150;
  int h = 50;

  copy(x1,y1, w,h, x2,y2, w,h);
}
void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,100);
  }
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

