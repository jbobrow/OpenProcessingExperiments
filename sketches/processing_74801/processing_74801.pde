
  
// Click within the image to change 
// the value of the rectangle after
// after the mouse has been clicked
void setup() {
  size(600, 600);
}

int value = 0;
int value2 = 0;

int value3= 0;

void draw() {
  float r = random(-50,50);
  fill(value,value2,value3);
  
  ellipse(mouseX, mouseY, r, r);
  fill(value,value2,value3);  
  ellipse(mouseX+100, mouseY+100, r, r);
  fill(value,value2,value3);
  
  ellipse(mouseX-100, mouseY+100, r, r);
  fill(value,value2,value3);
  
  ellipse(mouseX+100, mouseY-100, r, r);
  fill(value,value2,value3);
  ellipse(mouseX-100, mouseY-100, r, r);
}


void mouseMoved() {
  if (value == 0) {
    
    value = int(random(1, 255));
    value2 = int(random(1, 255));
    value3 = int(random(1, 255));
  } 
  else {
    value = 0;
  }
}
void mousePressed() {
 
  background(value,value2,value3);
}
