
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
  if(second() % 5 ==0){
    testbars();
    test = true;
    
   
  } else {
   
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
  }


void drawnoise() {
  //based on code by Aramburu
  //open processing link: http://www.openprocessing.org/visuals/?visualID=23534
  int s = second();
  for (int x = 0; x < width; x+=1) {
    for (int y = 0; y < height; y +=1) {
      if(second() <= 30){
        fill (random(255));
      }
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

void testbars(){
  noStroke();
  
  fill(192,192,192);
  rect(0,0, width/7, height - height/3);
  fill(192,192,0);
  rect(width/7, 0, width/7, height-height/3);
  fill(0,192,192);
  rect(2*(width/7), 0, width/7, height-height/3);
  fill(0,192,0);
  rect(3*(width/7), 0, width/7, height-height/3);
  fill(192,0,192);
  rect(4*(width/7), 0, width/7, height-height/3);
  fill(192,0,0);
  rect(5*(width/7), 0, width/7, height-height/3);
  fill(0,0,192);
  rect(6*(width/7), 0, width, height-height/3);
  
  rect(0,height-height/3, width/7, height/12);
  fill(0,0,0);
  rect(width/7,height-height/3, width/7, height/12);
  rect(3*width/7,height-height/3, width/7, height/12);
  rect(5*width/7,height-height/3, width/7, height/12);
  fill(192,0,192);
  rect(2*width/7,height-height/3, width/7, height/12);
  fill(0,192,192);
  rect(4*width/7,height-height/3, width/7, height/12);
  fill(192,192,192);
  rect(6*width/7,height-height/3, width/7, height/12);
  
  float sl = (width - (2*width/7));
  fill(0,33,76);
  rect(0, 3*height/4, sl/4, height);
  
 fill(255,255,255);
  rect(sl/4, 3*height/4, sl/4, height);
  
  fill(50,0,106);
  rect(sl/2, 3*height/4, sl/4, height);
  
  
  fill(19,19,19);
  rect(3*sl/4, 3*height/4, sl/4, height);
  
  fill(0,0,0);
  rect(5*width/7, 3*height/4, width/21, height);
  
  fill(19,19,19);
  rect(16*width/21, 3*height/4, width/21, height);
  
  fill(29,29,29);
  rect(17*width/21, 3*height/4, width/21, height);
  
  fill(19,19,19);
  rect(6*width/7, 3*height/4, width/7, height);
 }

