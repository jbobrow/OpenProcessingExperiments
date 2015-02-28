
import processing.video.*;

Capture video;
Movie myMov;
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
//int r,g,b = 0;
int num = 90;

void setup() {
  
  myMov = new Movie(this, "Fish.mov");
  myMov.loop();
  
  smooth();
  noCursor();
  background(0);
  size(camw*xjump-170,camh*yjump-200,P2D);
  //smooth();
  video = new Capture(this,camw,camh,fps);
}

void movieEvent(Movie myMov) {
  myMov.read();
}

void draw() {
  
  if(random(100) >= num) {
   tint(255,255);
   image(myMov,0,0);
  }
  
  if(mousePressed == true) {
    //num--;
    tint(255,255);
   image(myMov,0,0);
  }
  
  
  
  
  
  video.loadPixels();
 
 for(int y = 0; y < video.height; y++) {
   for(int x = video.width-1; x >= 0; x--) {
     int location = x + y * video.width;
     color c = video.pixels[location];
     
     saturation(255);
     
    
     //drawBlue();
     drawEllipses(c);
     drawBubbles();
     resetBubbles();
     moveBubbles();
     keyPressed();
  
     
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
     
     if(keyPressed != true) {
     fill(0,b,b,175);
     brightness(255);
     strokeWeight(.5);
     stroke(0,0,b,50);
     ellipse(newx+random(rectdrift),newy+random(rectdrift),
     xjump-random(rectdrift),yjump-random(rectdrift));  
  }
}

void drawBubbles () {
  
  if(keyPressed == false) {
  noStroke();
  fill(255,random(150));
  float bubh = random(3);
  float bubw = random(25);
  if(random(100)>99.9) {  
  ellipse(random(width),z,bubw,bubw + bubh);
    }
   }
  }
  
 void keyPressed() {
   boolean keyPressed = false;
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



