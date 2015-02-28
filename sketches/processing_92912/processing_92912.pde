
/* @pjs preload="sheep.png, scared.png"; */

timid sheep;
int minx = 10;
int miny = 10;
int maxx = 90;
int maxy = 90;
PImage img;
PImage img2;
 
void setup() {
    size(500, 500);
    background(0);
    smooth();
    sheep = new timid();
    img = loadImage("sheep.png");
    img2 = loadImage("scared.png");
}
 
void draw() {
    fill(0, 50);
    rect(0, 0, width, height);
    sheep.draw();
}
 
public class timid {
    float x, y;
    int w, h;
    float speedx, speedy;
    float accel;
 
    timid() {
        x = width  / 2;
        y = height / 2;
 
        w = 100;
        h = 100;
 
        speedx = 0;
        speedy = 0;
        accel  = 0.1;
    }
 
    void draw() {
      if (speedy < 2 && speedy > -2 && speedx < 2 && speedx > -2){
        image(img, x, y, w, h);
      }
      else{
        image(img2, x, y, w, h);
      }
 
        if (mouseX < x) {
            speedx += accel;
        }
        else if (mouseX > x) {
            speedx -= accel;
        }
        x += speedx;
 
        if (mouseY < y) {
            speedy += accel;
        }
        else if (mouseY > y) {
            speedy -= accel;
        }
       
        y += speedy;
 
        speedx = constrain(speedx, -5, 5);
        speedy = constrain(speedy, -5, 5);
        x      = constrain(x, minx, width-maxx);
        y      = constrain(y, miny, height-maxy);
 
        if (x == minx || x == width-maxx) speedx = 0;
        if (y == miny || y == width-maxy) speedy = 0;
    }
}


