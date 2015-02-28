
//nic goodman
//12.11.2009

import processing.video.*; //imports video library
Capture video;//webcam footage 
int dim;


int numLines = 50;
Line[] lnArray = new Line[numLines];
float stWeight;


void setup() {
  size(screen.width, screen.height);
  background(0);
  smooth();
  //for (int i=0; i<numLines; i++) { 
  //lnArray[i] = new Line(random(stWeight,width-stWeight), 0, random(height/50,height/5), random(width/200,width/50));
  //}

  frameRate(30);
  video = new Capture(this, width, height);//creates new webcam object
  dim = video.width*video.height;
}


void draw() {
  float r=0;
  float g=0;
  float b=0;

  if (video.available()) {//grabs color information from video feed
    video.read();
    video.loadPixels();
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        r += red(video.pixels[y*video.width + x]);
        g += green(video.pixels[y*video.width + x]);
        b += blue(video.pixels[y*video.width + x]);
      }
    }
  }

  stroke(r/dim,g/dim,b/dim,100);//averages the color of entire video and sets it to stroke color
  for (int i=0; i<numLines; i++) {
    lnArray[i] = new Line(random(stWeight,width-stWeight), 0, random(height/50,height/5), random(width/200,width/50));
  }
  for (int i=0; i<numLines; i++) {
    lnArray[i].display();
  }
  fill(0,100);
  rect(0,0,width,height);
  noFill();
}

class Line {//creates Line class
  float x1, y1, x2, y2;
  float lnLength;
  float lnWidth;
  int numDiv;

  Line (float xpos, float ypos, float lng, float stWeight) {//Line constructor
    x1 = xpos;
    y1 = ypos;
    lnLength = lng;
    lnWidth = stWeight;
    numDiv = int(height/lnLength);
  }

  void display() {//display method, draws a line composed of line segments that decrease proportionally in stroke weight
    for(int i=0; i<numDiv; i++) {
      strokeWeight(lnWidth);
      x2 = random((x1-lnWidth), (x1+lnWidth));
      y2 = y1+lnLength;
      line(x1,y1,x2,y2);
      x1 = x2;
      y1 = y2;
      if(lnWidth>0) {
        lnWidth-=lnWidth/numDiv;
      }
    }
  }
}




