
import processing.video.*;
int camw = 320;
int camh = 240;
int fps = 30;
int newx = 0;
int newy = 0;
int xjump = 10;
int yjump = 10;
int rectdrift = 10;
int s = second();

Capture video;


void setup() {
  background(0);
  size(320, 240, P2D );
  video = new Capture(this, camw, camh, fps);
}

void draw() {
  int s = second();

  //if(s >= 50){
  
  //} else {
      
      drawnoise();

  video.loadPixels();
  for (int y = 0; y < camh; y++) {
    for (int x = camw-1; x >= 0 ; x--) {
      int location = x + y * camw;
      color c = video.pixels[location];
      video.updatePixels();              
      drawpoints(c);
     
      

      newx++;
    }
    newx=0;
    newy++;
  }
  newy=0;
}
//}

void drawnoise() {
  //based on code by Aramburu
  //open processing link: http://www.openprocessing.org/visuals/?visualID=23534
  for (int x = 0; x < width; x+=1) {
    for (int y = 0; y < height; y +=1) {
      fill (random(255),random(255));
      noStroke();
      smooth();
      rect(x, y, 4, 4);
    }
  }
}

void drawpoints(color c) {
  color d = int(brightness(c));
  stroke(d,random(255));
  fill(d);       
  int s = second();
  int ms= millis();
  point(newx, newy);
  //point(newx+random(-s, s), newy);
  //point(newx, newy+random(-s, s));
  //point(newx+random(-s, s), newy+random(-s, s));
}


void captureEvent(Capture v) {
  v.read();
}


