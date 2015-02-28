
import controlP5.*;

ControlP5 controlP5;
Button b;


int elipseStroke = 10;
int sliderOpacity = 25;
int sliderScale = 1;

float angle;

void setup()
{
  size(800, 800);
  smooth();
  background(255);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("elipseStroke", 0, 100, 128, 20, 10, 100, 10);
  controlP5.addSlider("sliderOpacity", 0, 100, 128, 20, 50, 100, 10);
  controlP5.addSlider("sliderScale", 0, 3, 128, 20, 90, 100, 10);
}


void draw()
{  

  strokeWeight(elipseStroke);
  //  stroke(sliderR, sliderG, sliderB, sliderOpacity);
}

void mouseMoved()
{
  pushMatrix(); 
  float x = map(mouseX, 0, width, 0, 10);
  angle += 1;


  translate(mouseX, mouseY);
  float offsetA = random(-x+10, x+10);
  float offsetB = random(100, 200);
  //rotates entire coordinate system
  rotate(radians(angle)); //rotate by framecount
  float r = map(mouseX, 0, width, 0, 255);
  float g = map(mouseY, 0, height, 0, 255);
  float b = 100;

  stroke(r, g, b, sliderOpacity);
  scale(sliderScale);

  //  filter(BLUR, );

  //  strokeWeight(random(1, 100));
  noFill();
  //rect(offsetA,0, 200,100);
  if (keyPressed) {
    if (key == 't' || key =='T') {
      line(offsetA, 0, x+58, x+20);
    }
    else {
    }
  }
  
    if (keyPressed) {
    if (key == 'r' || key =='R') {
      rect(offsetA, 0, offsetB, offsetB);
    }
    else {
    }
  }
  
      if (keyPressed) {
    if (key == 'e' || key =='E') {
      ellipse(offsetA, 0, offsetB, offsetB); 
    }
    else {
    }
  }
  
        if (keyPressed) {
    if (key == 'c' || key =='C') {
      background(255);
    }
    else {
    }
  }
  
  
  popMatrix();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("drawing-##.tif");
  }
}



