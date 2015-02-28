
// example program from Pearson (2011), p.28
// explaining the frame loop in processing

int diam = 10;  
float centX, centY; 

void setup() {    
  size(500, 300); 
  frameRate(10);  // 24 frames per second                                     
  smooth(); 
  centX = width/2; 
  centY = height/2; 
  stroke(0); 
  strokeWeight(1); 
  fill(255, 5);
} 

void draw() {
  for (int i=0; i < 20; i++) {
    stroke(0);  //Set the color to white
    if (diam <= 1000)  
      ellipse(centX, centY, diam, diam);  
      diam += 4;  // increases diameter for next loop
    }
}


