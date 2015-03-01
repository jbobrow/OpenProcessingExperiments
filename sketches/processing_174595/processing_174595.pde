
int eSize;
int x,y; 

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  smooth();
  noStroke();
  background(99); 
  
 eSize = 50; 
}

void draw() {}


void mouseDragged(){ 
  fill(random(100),30,99); 
  ellipse(mouseX,mouseY,eSize,eSize); 
} 


void mousePressed() {
  fill(random(100),30,99);
  if (mouseButton == LEFT) {
    ellipse(mouseX, mouseY, eSize, eSize);
  }  
}


void keyPressed() {
  switch(key) {
  case '1': 
    eSize = 100;
    break;
  case '2': 
    eSize = 50;
    break;
  case '3': 
    eSize = 20;
    break;
  case '4':
    background(99);
    break;
  }
}


