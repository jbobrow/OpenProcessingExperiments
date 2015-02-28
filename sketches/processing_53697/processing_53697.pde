
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
boolean test = false; 
int v = 0;

Capture video;


void setup() {
  background(0);
  size(320, 240, P2D );
  video = new Capture(this, camw, camh, fps);
}

void draw() {
  int s = second();
  int fc = frameCount; 

  //if(s >= 50){

  //} else {
  
    
  if(second() % 10 == 0){
     testbars();
     test = true;
    } else {
    
  int pick = int(random(5));
  if (pick == 0 ) {
    drawnoise();
  } 
  else {

    if (pick == 1 ||pick == 3) {
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
    else {


      if (pick == 2 ||pick == 4) {
        video.loadPixels();
        for (int y = 0; y < camh; y++) {
          for (int x = camw-1; x >= 0 ; x--) {
            int location = x + y * camw;
            color c = video.pixels[location];
            video.updatePixels();              


            drawpointsbw(c);


            newx++;
          }
          newx=0;
          newy++;
        }
        newy=0;
      } 


    }
  }
}
  }

void drawnoise() {
  //based on code by Aramburu
  //open processing link: http://www.openprocessing.org/visuals/?visualID=23534
  int s = second();
  for (int x = 0; x < width; x+=1) {
    for (int y = 0; y < height; y +=1) {

      fill (random(255));

      noStroke();
      smooth();
      rect(x, y, 4, 4);
    }
  }
}


void drawpointsbw(color c) {
  color b = int(brightness(c));
  stroke(b, random(255));
  fill(b);       
  int s = second();
  int ms= millis();
  point(newx, newy);
  //point(newx+random(-s, s), newy);
  //point(newx, newy+random(-s, s));
  //point(newx+random(-s, s), newy+random(-s, s));
}


void drawpoints(color c) {

  stroke(c, random(255));
  fill(c);       
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


