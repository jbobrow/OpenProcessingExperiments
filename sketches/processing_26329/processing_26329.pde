
import processing.video.*;
MovieMaker mm; 

void setup () {
  size (960,540);
  background (255);
  smooth();
   mm = new MovieMaker(this, width, height, "draw.mov",
                       30, MovieMaker.H264, MovieMaker.HIGH);
}

void draw () {
  if (key =='s') {
    noLoop();
 mm.finish();

  }
       mm.addFrame(); 
}

void mouseDragged() {

  noStroke();
  fill(100,200,random(255),70);
  rect (mouseX,mouseY, 10, random(50));
  rect (mouseX,mouseY,random(50),15);
  
}


                
                
