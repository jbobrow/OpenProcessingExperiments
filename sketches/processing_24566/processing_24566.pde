
import processing.pdf.*;

void setup(){
size(800, 400);
background(255);
fill(0, 10);
smooth();
colorMode(HSB, 360, 100, 100);
}

void draw(){  
  if(mousePressed){
  float dm = dist(pmouseX, pmouseY, mouseX, mouseY)*3;
  stroke(dm*3, 20, 100);
  strokeWeight(max(35-dm, 1));
  line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void keyPressed(){
  if (key=='b'||key=='B')
  {
    beginRecord(PDF, "zeichnung.pdf");
    colorMode(RGB, 255);
    background(255);
    colorMode(HSB, 360, 100, 100);
  }
  if (key=='e'||key=='E')
  {
    endRecord();
  }
  
  if (key==' '){
    colorMode(RGB, 255);
    background(255);
    colorMode(HSB, 360, 100, 100);
  }
}

