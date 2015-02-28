
import processing.video.*;

Capture video;

PFont font;
int camw = 80;
int camh = 60;
int fps = 15;
int newx = 0; // my x
int newy = 0; // my y
int xjump = 8;
int yjump = 8;


void setup() {
  background(0);
  noCursor();
  smooth();
  size(camw*xjump,camh*yjump, P2D);
  
  
  //font = loadFont("ComicSansMS-48.vlw");
  //textFont(font);
  //textSize(50);
  
  //declare a variable of type Capture called video and sent it four paramters:
  // this, width, height, framerate (in seconds)
  video = new Capture(this, camw, camh, fps);
}

void draw() {
  background(loadImage("cat.jpg"));
  //text("word", 15, 30, 200, 200);
  //fill(0, 102, 153);
  //filter(THRESHOLD);
 
  //let processing know that we're about to access and play with the pixel[]
  // array
  video.loadPixels();
  
  
  for(int y = 0; y < video.height; y++) {
    for(int x = video.width-1; x >= 0; x--) {
      int location = x + y * video.width;
      color c = video.pixels[location];
      // same as newx = new x + xjump
      drawPoints(c);
      //drawCurve(c);
      //drawArrow(c);
  
      
      
      newx+=xjump;
    }
    newx = 0;
    newy+=yjump;
  }
  newy = 0;
  //let processing know that we're done playing with the pixel[] array    
  video.updatePixels();
  
}

/*void drawArrow(color c) {
  noFill();
  smooth();
  strokeWeight(2);
  strokeJoin(ROUND);
  beginShape();
  vertex(35, 40);
  vertex(55,50);
  vertex(35,60);
  endShape();
}*/

/*void drawCurve(color c) {
  noFill();
  stroke(255, 102, 0);
  curve(5, 26, 5, 26, 73, 24, 73, 61);
  stroke(0); 
  curve(5, 26, 73, 24, 73, 61, 15, 65); 
  stroke(255, 102, 0);
  curve(73, 24, 73, 61, 15, 65, 15, 65);
}*/



void drawPoints(color c) {
  int op = 0;
  float value = saturation(c);
  tint(0, 0, 0,500);
  noFill();
  smooth();
  strokeWeight(7);
  float r = red(c);
  float g = green(c);  
  float b = blue(c);
  

  if (r < 150) {
    stroke(100, g, b);
} else if (r > 150) {
    stroke(160, b, g);
    
}

  if (g < 150) {
    stroke(r, 50, b);
} else if (g > 150) {
    stroke(r, 210, b);  
}


  if (b < 150) {
    stroke(r, g, 30);
} else if (b > 150) {
    stroke(r, g, 250);  
}

if (value > 100) {
  op = 200; } else
  { op = 0; } 

  stroke(r,g,b, op);
  point(newx, newy);
}




void captureEvent(Capture v) {
  v.read();
}

void keyPressed () {
  switch(keyCode) {
    case UP:
    //rectdrift++;
    break;
    case DOWN:
    //rectdrift--;
    break;
  }
}

