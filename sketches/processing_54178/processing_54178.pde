
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
boolean black = false;
int bary = 0;
int baryh = height/10;
int brmax = 5;
int[] bars = new int[brmax];



Capture video;


void setup() {
  background(0);
  size(320, 240, P2D );
  video = new Capture(this, camw, camh, fps);
  int ybar = 0;
  for (int br = 0; br < brmax; br++) {
    bars[br] = ybar;
    ybar+= 50;
  }
}
void draw() {
  int s = second();
  int fc = frameCount; 

  drawbar();



  rect(0, bary, width, baryh);
  fill(255);
  bary++;
  if (bary == height) {
    bary = 0;
  }

  if (second() == 54 || second() == 55 || second() == 56) {
    testbars();
    test = true;
  } 
  else {
    if (second() == 57 || second() == 58 || second() == 59 || second() == 60) {
      fill(0);
      rect(0, 0, width, height);
      black = true;
    }
    else {
      int pick = int(random(7));
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
        if (pick == 5 || pick == 6) {
          drawbknoise();
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

void drawbar() {
  for (int j = 0; j < brmax ; j++) {
    rect(0, bars[j], width, baryh);
    fill(255);
    bars[j] ++;
    if (bars[j] >= height) {
      bars[j] = 0;
    }
  }
}

void drawbknoise() {
  //based on code by Aramburu
  //open processing link: http://www.openprocessing.org/visuals/?visualID=23534
  for (int x = 0; x < width; x+=2) {
    for (int y = 0; y < height; y +=2) {

      fill (0, random(255));

      noStroke();
      smooth();
      rectMode(CORNER);
      rect(random(width), random(height), 1, 1);
    }
  }
}

void captureEvent(Capture v) {
  v.read();
}


