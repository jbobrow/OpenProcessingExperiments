
Coco coco1;
   
PImage C1;
PImage C2;
int pointillize = 11;
import processing.video.*;
Capture vid;
   
void setup(){
 coco1 = new Coco(300,300);
  size(600,600);
    frameRate(30);
  vid = new Capture(this, 500, 500, 500);
     C1 = loadImage("C1.jpg");
    C2 = loadImage("C2.jpg");
    imageMode(CENTER);
}
void captureEvent(Capture vid) {
  vid.read();
     
}
void draw(){
 coco1.update(mouseX,mouseY);
 coco1.display();
   int x = int(random(vid.width));
  int y = int(random(vid.height));
  int loc = x + y*vid.width;
 
  loadPixels();
  float r = red(vid.pixels[loc]);
  float g = green(vid.pixels[loc]);
  float b = blue(vid.pixels[loc]);
  noStroke();
   
  
  fill(r,g,b,183);
  filter(THRESHOLD);
  filter(INVERT);
}
class Coco{
  int x,y;
  float counter;
  boolean over;
  boolean pressed;
  Coco(int _x,int _y){
    x= _x;
    y= _y;
    over = false;
    pressed = false;
  }
  void update(int mX,int mY){
    if(dist(mX,mY,100,200)  <100 ){
   over= true;
  } else {
    over = false;
   }
  }
     
void display(){
   if(over){
        image(C1,300,300);
   } else{
        background(mouseX,mouseY,pmouseX);
  }
}
void press(){
   if (over){
   filter(BLUR, 29);
  pressed = true;
 }
}
void release(){
pressed = false;
}
}
  void mousePressed(){
    coco1.press();
   }
  


