
import controlP5.*;
ControlP5 controlP5;

int brushRed=0;
int brushBlue=0;
int brushGreen=0;
int brushSize=1;
String fileType="";
String fileName="Picture";

void setup() {
  controlP5 = new ControlP5(this);
  size(900, 800);
  noStroke();
  controlP5.addSlider("brushRed", 0, 255, 0, 0, 0, 255, 15);
  controlP5.addSlider("brushGreen", 0, 255, 0, 0, 15, 255, 15);
  controlP5.addSlider("brushBlue", 0, 255, 0, 0, 30, 255, 15);
  controlP5.addSlider("brushSize", 1, 50, 0, 0, 45, 255, 15);
  controlP5.addButton("clearAll", 0, 315, 0, 100, 15);
  //controlP5.addTextfield("imageName", 315, 15, 100, 15);
  controlP5.addButton("saveImage", 0, 315, 45, 100, 15);
  Radio r = controlP5.addRadio("radio", 420, 3);
  r.add("JPG", 0);
  r.add("PNG", 1);
  r.add("TIF", 2);
  r.add("TGA", 3);


  background(255);
}

void draw() {
  //background(204);

  pushMatrix();
  fill(45);
  quad(0, 0, 0, 60, 1000, 60, 1000, 0);
  popMatrix();

  strokeWeight(brushSize);
  stroke(brushRed, brushGreen, brushBlue);
  line(700, 30, 850, 30);

  if (mousePressed) {
    if (mouseY>60) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

public void clearAll() {
  background(255);
}

void radio(int theID) {
  switch(theID) {
    case(0):
    fileType = ".jpg";
    break;  
    case(1):
    fileType = ".png";
    break;  
    case(2):
    fileType = ".tif";
    break;  
    case(3):
    fileType = ".tga";
    break;
  }
}
public void saveImage() {
  String s = fileName+fileType; 
  save(s);
}

public void texting(String theText) {
  fileName=theText;
}


