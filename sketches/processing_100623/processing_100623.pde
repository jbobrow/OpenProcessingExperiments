
import processing.video.*;

Capture cam;

Line[] lines;
int res;


void setup() {
  size(640, 480);
  res =4;
  frameRate(20);
  strokeWeight(3);
  lines=new Line[width/res*height/res];
  for(int i= 0; i<width/res; i++){
   for(int j= 0; j<height/res; j++){
     int loc = i+j*width/res;
    lines[loc]=new Line(i*res+random(-5, 5), j*res+random(-5, 5),i*res+random(-5, 5), j*res+random(-5, 5));

  }  
  }

String[] cameras = Capture.list();
   cam = new Capture(this, cameras[0]);
    cam.start(); 
  }      


void draw() {
  background(255);
//  if (cam.available() == true) {
    cam.read();
//  }
//  image(cam, 0, 0);
cam.loadPixels();

for(int i= 0; i<cam.width/res; i++){
   for(int j= 0; j<cam.height/res; j++){
     int loc = i+j*cam.width/res;
     int loc2 = i*res+j*res*cam.width;
     float r = red(cam.pixels[loc2]);
     float g = green(cam.pixels[loc2]);
     float b = blue(cam.pixels[loc2]);
     float br = brightness(cam.pixels[loc2]);
     r= map(g, 0, 255, 0, 255);
     g= map(g, 0, 255, 0, 255);
     b=map(b, 0, 255, 0, 255);

    lines[loc].c=color(r, g, b, 200);
    lines[loc].display2();
  }  
  }
//for(int i= 0; i<width/res; i++){
//   for(int j= 0; j<height/res; j++){
//     int loc = i+j*width/res;
//    lines[loc].c=cam.pixels[i+j/width/res];
//    lines[loc].display();
//  }  
//  }
}
class Line {
  float x1;
  float x2;
  float y1;
  float y2;
  color c;
  int counter;
  float mover = random(-1,1);
  
  Line(float x1, float y1, float x2, float y2){
    this.x1=x1;
    this.x2=x2;
    this.y1=y1;
    this.y2=y2;
    counter=0;
  }
  
  void display(){
    stroke(c);
    line(x1, y1, x2, y2);
  }
  
  void display2(){
    pushMatrix();
    translate(x1, y1);
    rotate(counter*mover);
    stroke(c);
    line(0, 0, x1-x2, y1-y2);
    counter++;
    popMatrix();
  }
}


