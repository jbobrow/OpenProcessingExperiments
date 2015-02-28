
// example program from Pearson (2011), p.28
// explaining the frame loop in processing
// original created by Nik
// edited 10/6 by Herbert.H

int diam = 10;  
float centX, centY; 

void setup() {    
  size(500, 300); 
    // 24 frames per second                                     
  smooth(); 
  background(168,220,220); 
  centX = width/2; 
  centY = height/2; 
  stroke(0); 
  strokeWeight(5); 
  fill(250);
} 

void draw() {    
  if (diam <= 400) { 
    //background(180);  // clears background every frame 
frameRate(24);    
    noFill();
    strokeWeight(diam/45+1);
    stroke(237,128,162,190);
    ellipse(centX, centY, diam, diam);  
    diam += 10;  // increases diameter for next loop
  } else {
    
   fill(200,20);
   strokeWeight(100);
    stroke(255,247,152,20);
    ellipse(centX, centY, diam, diam);  
  diam -= 250;
  }
} 
void keyPressed(){
saveFrame("trace.jpg");
}

