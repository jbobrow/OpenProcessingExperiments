
// Final Project
/*
 * This sketch tries to simulate the thunder storm sounds and generates the trees on click of the mouse.
 */

import ddf.minim.*;


// Global variables
int n;
float x1, x2;
float y1, y2;
float x, y;
int count;
int treeSize;

color buildingPalette[] = {#B4FF7C, #E8AD30, #FF4542, #AC96E8, #58FFFD};
color cloudPalette[] = {#474747, #4D4D4D, #595959};

Minim minim;
AudioPlayer thunder;

void setup() {
  
  size(1280, 720);
  background(0);
  colorMode(HSB);
  
  minim = new Minim(this);
  thunder = minim.loadFile("thunder.wav");
  
  noStroke();
  fill(#FFFFFF);
  ellipse(90, 80, 50, 50);
}

void draw() {
  
  // Buildings
  if(count < 50) {
    x = random(width);
    y = random(500, height);
      
    stroke(0);
    strokeWeight(3);
    fill(buildingPalette[(int) random(5)]);     
    rect(x, y, random(100), height - random(50, 100));
    count = count + 1;    
  }
  
  // Trees
  while(n != 0 && treeSize < 10) {
    
    stroke(#00FF00);
    strokeWeight(random(0.1, 0.5));
    x2 = random(x1 - 10, x1 + 10);
    y2 = random(y1 - 50, y1 - 100);  
        
    line(x1, y1, x2, y2);
    n = n - 1;
    treeSize = treeSize + 1;
  }  
  
  x1 = x2;
  y1 = y2;
  n = 5;  
}

void mousePressed() {
  
  // Tree generation
  if(mouseY > 510) {
    x1 = mouseX;
    y1 = mouseY;
    n = 1; 
    treeSize = 1;
  }
}

void mouseDragged() {
   
  // Thunder
  if(mouseY < 300) {
    noStroke();
    fill(cloudPalette[(int) random(3)]);
    ellipse(mouseX, mouseY, random(70), random(70)); 
    thunder.play();
  }
}








