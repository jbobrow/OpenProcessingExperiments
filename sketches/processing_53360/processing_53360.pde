
import processing.video.*;

Capture video;
int camw = 80;
int camh = 60;
int fps = 30;
int newx = 0;
int newy = 0;
int xjump = 11;
int yjump = 11;
int rectdrift = 3;
int linemax = 100;
int z = height;
int zspeed = 2;

void setup() {
  
  noCursor();
  background(0);
  size(camw*xjump-10,camh*yjump-10,P2D);
  smooth();
  video = new Capture(this,camw,camh,fps);
}

void draw() {
  
 
  video.loadPixels();
 
 for(int y = 0; y < video.height; y++) {
   for(int x = video.width-1; x >= 0; x--) {
     int location = x + y * video.width;
     color c = video.pixels[location];
     
     saturation(15);

     drawEllipses(c);
     drawBubbles();
     resetBubbles();
     moveBubbles();
    
   
  
     
     newx+=xjump;
   }
   newx = 0;
   newy+=yjump;
 }
 newy = 0;
 video.updatePixels();
}

void drawEllipses(color c) {
     float b = blue(c);
     fill(0,15,b);
     strokeWeight(.5);
     stroke(0,0,b,random(150));
     ellipse(newx+random(rectdrift),newy+random(rectdrift),
     xjump-random(rectdrift),yjump-random(rectdrift));  
}

void drawBubbles () {
  noStroke();
  fill(255,random(150));
  float bubh = random(3);
  float bubw = random(25);
  if(random(100)>99) {
  ellipse(random(width),z,bubw,bubw + bubh);
  }
 }
  
void resetBubbles() {
    if(z <= 0) {
    z = height;
  }
}

void moveBubbles() {
    z = z - zspeed;
}

void captureEvent(Capture v) {
  v.read();
}

void keyPressed() {
  switch(keyCode) {
    case UP:
    rectdrift++;
    break;
    case DOWN:
    rectdrift--;
    break;
  }
}

