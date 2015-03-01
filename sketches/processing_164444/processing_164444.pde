
void setup() {
size(500, 500);
noCursor();
//background(0);
}
void draw() {
  frameRate(50);
//  background(0);  
  float sizeW = 100;
  float sizeH = 100;
  
  if (mousePressed == true) {
background(90);
} else {
background(0); // Black
}
  
  if ((mouseX >= 0) && (mouseX < 100)) {
    strokeWeight(15);
    fill(127,230,250,100);
    sizeW -= 30;
    sizeH -= 30;
  } else if ((mouseX > 100) && (mouseX < 200)) {
    strokeWeight(3);
    fill(255,133,133,100); 
    sizeW -= 45;
    sizeH -= 45;
  } else if ((mouseX > 200) && (mouseX < 300)) {
    strokeWeight(2);
    fill(170,255,150,100);
    sizeW -= 60;
    sizeH -= 60;
  } else if ((mouseX > 300) && (mouseX < 400)) {
    strokeWeight(1);
    fill(255,255,133,100);
    sizeW -= 75;
    sizeH -= 75;
  } else {
    strokeWeight(.4);
    fill(245,100);
    sizeW -= 90;
    sizeH -= 90;
  }
stroke(255,60);
ellipse(mouseX, mouseY,sizeW,sizeH);
}


