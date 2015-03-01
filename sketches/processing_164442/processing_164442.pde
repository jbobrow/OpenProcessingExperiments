
void setup() {
size(500, 500);
noStroke();
}
void draw() {
  float normX = mouseX/float(width);
  float normY = mouseY/float(height);
  
  if ((mouseX < 250) && (mouseY < 250)) {
    background(76);
  } else if ((mouseX > 250) && (mouseY < 250)) {
    background(170); 
  } else if ((mouseX > 250) && (mouseY > 250)) {
    background (255);
  } else {
    background (0);
  }



fill(127,230,250,100);
ellipse(width-(pow(normX,2)*width),height-(pow(normY,2)*height),width-mouseX,width-mouseX);
fill(255,133,133,100);
ellipse(pow(normX,2)*width,pow(normY,2)*height,width-mouseX,width-mouseX);
fill(170,255,150,100);
ellipse(pow(normX,2)*width,pow(normY,2)*height,height-mouseY,height-mouseY);
fill(255,255,133,100);
ellipse(width-(pow(normX,2)*width),height-(pow(normY,2)*height),height-mouseY,height-mouseY);
}



