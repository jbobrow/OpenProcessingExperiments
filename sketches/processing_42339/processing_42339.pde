
//author:robertlun,ncku arch
//purpose: exercise on class 
//concept: practice loop,like a radar.
//reference:http://moodle.ncku.edu.tw/mod/resource/view.php?id=104672


int diam = 10;  
float centX, centY; 

void setup() {    
  size(500, 300); 
  frameRate(12);  // 24 frames per second                                     
  smooth(); 
  background(0); 
  centX = width/2; 
  centY = height/2; 
 
} 

void draw() {   
  stroke(255); 
  strokeWeight(1); 
  //noFill();
  fill(255,200,2, 40);
  
  if (diam <= 400) { 
    //background(180);  // clears background every frame                                   
    ellipse(centX, centY, diam, diam);
  
    diam += 20;  // increases diameter for next loop
  }
  
   else{
    stroke(0, 255, 0);
    strokeWeight(2);  
    diam -= 400;
  }
  fill(255,40,0);
  ellipse(centX, centY, 10, 10);
} 


