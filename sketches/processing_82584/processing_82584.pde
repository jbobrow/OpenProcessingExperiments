
void setup() { 
  size(600,600);  
  
  colorMode(HSB); 
  
}


void draw() { 
  background(0); 

  int counter = frameCount; 

  
  for(float yPos = 0; yPos<600 ; yPos+=40) {
    for(float xPos = 0; xPos<600; xPos+=40) { 
      
      float distance = dist(xPos, yPos, mouseX, mouseY); 
      
      float circleSize = map(distance, 0, 700, 50, 0); 
      
      fill(counter % 255, 255,255); 
      ellipse(xPos,yPos,circleSize,circleSize); 
       
      counter++;    
     
    }  
    
  }
  
  
  
}
