
// example program from Pearson (2011), p.28
// explaining the frame loop in processing
// modify to leave traces by schien@mail.ncku.edu.tw
// press the mouse button to restart drawing

int diam = 10;  
float centX, centY; 

void setup() {    
  size(500, 300); 
  frameRate(24);  // 24 frames per second                                     
  smooth(); 
  background(180); 
  centX = width/2; 
  centY = height/2; 
  stroke(0); 
  strokeWeight(3); 
  fill(255, 30);
} 

void draw() {    
  if (diam <= 400) { 
    //background(180);  // clears background every frame                                   
    ellipse(centX, centY, diam, diam);  
    diam += 15;  // increases diameter for next loop
  }
} 

void mousePressed() {
  diam = mouseX;
  centX = mouseX;
  centY = mouseY;
}


