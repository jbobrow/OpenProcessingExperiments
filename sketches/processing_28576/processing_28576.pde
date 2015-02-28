
import processing.pdf.*;

boolean saveOneFrame = false;

void setup( )
{
  size(800, 600);
  background(255);
  frameRate(10);
  smooth();
}

void draw() {
  if(saveOneFrame == true) {
    beginRecord(PDF, "kai"+timeStamp()+".pdf");
  }

  if(keyPressed) {
    if (key == 'f') {
      translate(mouseX, mouseY);
      fill(random(0,255),random(255),random(0,255),random(255));
      stroke(0);
      beginShape();
      vertex(random(20,30), random(500,600)); // first point
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      bezierVertex(random(0,30), random(0,40), random(0,50), random(0,60), random(0,70), random(0,80));
      endShape();
    }
    if(key == 'g') {
      translate(mouseX, mouseY);
      fill(random(0),random(0,255),random(0,255),random(200,220));
      stroke(0);
      beginShape();
      vertex(random(20,30), random(500,600)); // first point
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150)); 
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));
      bezierVertex(random(0,100), random(0,110), random(0,120), random(0,130), random(0,140), random(0,150));

      endShape();
    }
    if(saveOneFrame == true) {
      endRecord();
      saveOneFrame = false;
    }
  }
}

void mousePressed() {
  saveOneFrame = true;
}


