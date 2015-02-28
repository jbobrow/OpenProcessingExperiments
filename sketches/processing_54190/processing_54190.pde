
import processing.video.*;

Capture video;

int newx = 0;
int newy = 0;
int xjump = 20;
int yjump = 10;
//float circledrift = 0;
int count=0;
int r= 0;
int p= 0;
int circsize = 5;
boolean showvid = true;

void setup() {
  size(xjump*80, yjump*60, P2D);
  video = new Capture(this, 80, 60, 15);
  frameRate(300);
  //smooth();
}

void draw() {

/*  if(count>1000){
 count=0;
} */

  for (int y = 0; y < video.height; y++) {
    for (int x = video.width-1; x > -1; x--) { 
      int loc = x + y * video.width;
      color c = video.pixels[loc];
  {
    noStroke();
    fill(c,75);
    rotate(r);
    ellipse(newx+random(0),newy+random(0),circsize,circsize);
    pushMatrix();
    translate(count, count);
    popMatrix();
    //count++;
    r++;
    p++;
      }
     newx += xjump;
    }
    newx = 0;
    newy+=yjump;

  }
  newy = 0;
  
  /*
    if (showvid == true) {
      pushMatrix();
      rotate(0);
      translate(0,0);
    image(video, 0, height - video.height);
    popMatrix();
    
  }
  */

}


void captureEvent(Capture c) {
  c.read();
}

