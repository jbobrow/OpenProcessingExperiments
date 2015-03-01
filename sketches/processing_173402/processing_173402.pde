
/**
 * Recursion.
 *
 * A demonstration of recursion, which means functions call themselves.
 * Notice how the drawShape() function calls itself at the end of its block.
 * It continues to do this until the variable "level" is equal to 0.
 */

PImage b;
String url;

void setup() {
  size(512, 768);
  noStroke();
  noLoop();
}

void draw() {
  background(0);
  drawShape(0, 0, width, height, 5);
  save("image_pattern.png");
}

void drawShape(float x, float y, float w, float h, int level) {                    
  float xm = x + w / 2;
  float ym = y + h / 2;
  if(level > 0) {
    //if(random(4)<3) {
      level = level - 1;
      int r = int(random(4));
      if(r != 0) {
        drawShape(x, y, w / 2, h / 2, level);
      }
      else {
        drawImage(x, y, w / 2, h / 2);
      }
      if(r != 1) {
        drawShape(x, ym, w / 2, h / 2, level);
      }
      else {
        drawImage(x, ym, w / 2, h / 2);
      }
      if(r != 2) {
        drawShape(xm, y, w / 2, h / 2, level);
      } 
      else {
        drawImage(xm, y, w / 2, h / 2);
      }
      if(r != 3) {
        drawShape(xm, ym, w / 2, h / 2, level);
      }
      else {
        drawImage(xm, ym, w / 2, h / 2);
      }
    //}
    //else {
      //drawImage(x, y, w, h);
    //}
  }
  else {
    drawImage(x, y, w, h);
  }
}

void drawImage(float x, float y, float w, float h) {
  url = "http://lorempixel.com/"+int(ceil(w))+"/"+int(ceil(h));
  b = loadImage(url, "jpg");
  image(b, x, y);
}

void mousePressed() {
  draw();
}


