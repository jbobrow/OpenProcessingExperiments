
import processing.pdf.*;

void setup(){
  size(1400, 800);
  smooth();
  background(#ffffff);
}

void draw(){
  if(mousePressed){
    float durchmesser = dist(pmouseX, pmouseY, mouseX, mouseY);
    float dicke= 20-durchmesser;
    if(dicke < 1){dicke = 2;}
    strokeWeight(dicke);
    line(pmouseX, pmouseY, mouseX, mouseY);
}
}

void mousePressed(){
  colorMode(HSB, 100);
  stroke(random(100), random(100), random(100));
}

void keyPressed(){
  if(key == 's'){
    saveFrame();
  }
  if(key == 'p'){
    beginRecord(PDF, "zeichnung.pdf");
    colorMode(HSB, 100);
  }
  if(key == 'e')
  {
    endRecord();
  }
}


