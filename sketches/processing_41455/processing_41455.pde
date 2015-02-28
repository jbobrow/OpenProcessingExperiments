
// Author: Liliam Ivonne Rodas Padilla
// Purpose: Practice logic and repetition
// Functioning: At running it will generate 3 different loops: colors and sizes.
// Reference: example program from Pearson (2011), p.28


int diam1 = 1;
int diam2 = 1;
int diam3 = 1;

float centX, centY, centA, centB,centC, centD, tempdiam; 

void setup() {    
  size(400,400); 
  background (0);
  frameRate(20);  // 20 frames per second                                     
  smooth();
 
 //Blue
  centX = width/4; 
  centY = height/4; 
  
  
 //Pink
  centA = width/2; 
  centB = height/2;
 
 //Green
  centC = width-50; 
  centD = height-80; 
  
} 

void draw() {
  
  //Pink circle
  
  if (diam2 <= 400) { 
    stroke(70,4,64); 
    strokeWeight(2); 
    fill (239,29,187, 10);    
    ellipse(centA, centB, diam2, diam2);   
    diam2 += 20;  // increases diameter for next loop
  }
  
  // loop within loop
    while (tempdiam > 10) {                               
      ellipse(centA, centB, tempdiam, tempdiam); 
      tempdiam -= 10; 
    } 
    
 //Blue circle 
  if (diam1 <= 250) { 
    stroke(37,3,107); 
    strokeWeight(2); 
    fill(80,67,243,10);     
    ellipse(centX, centY, diam1, diam1);
    diam1 += 20;  // increases diameter for next loop
  }
  
  // loop within loop
    while (tempdiam > 10) {                               
      ellipse(centX, centY, tempdiam, tempdiam);
      tempdiam -= 10; 
    } 
  
  //Green circle 
  if (diam3 <= 200) { 
    stroke(1,46,4); 
    strokeWeight(2); 
    fill(12,175,16,20);     
    ellipse(centC, centD, diam3, diam3);
    diam3 += 20;  // increases diameter for next loop
  }
  
  // loop within loop
    while (tempdiam > 10) {                               
      ellipse(centC, centD, tempdiam, tempdiam);
      tempdiam -= 10; 
    } 
    
}
    void keyPressed(){
saveFrame("exercise_loop.jpg");
    }




