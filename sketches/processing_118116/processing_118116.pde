
import processing.pdf.*;

boolean recording;
PGraphicsPDF pdf;

void setup() {
  size(800, 400);
  background(255);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
}

void draw() {
  if(mousePressed) {
    beginShape();
    float a= random(800);
    float b= random(800);
    float t= 0.05;
  
  for (int p=0;p<400;p++) {
    float l = random(10,50);
    stroke(a/3, b/3, 255);
    strokeWeight(t);
    //line( mouseX, mouseY, a, b);
    line(mouseX, mouseY, pmouseX, pmouseY);
    //quad(mouseX, mouseY + l, a, b, a + l, b + l, 20, 20);
    line(mouseX, mouseY+ l,pmouseX,pmouseY+l);
    triangle(mouseX, mouseY + l, pmouseX, mouseY, 30, 30);
  }
}
}

void keyPressed() {
  if(key=='s'){
    saveImage();}
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }
}


void saveImage() {
  String fileName = timeStamp()+".png";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}
 
String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}



