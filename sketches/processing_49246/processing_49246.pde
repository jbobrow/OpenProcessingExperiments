

void setup() { 
  size (400,400);  
  background(0); 
  noFill(); 
  rectMode(CENTER); 
  stroke(255); 
  smooth(); 
  
  colorMode(HSB); 
  
  pushMatrix(); 
  
  translate(width/2, height/2); 
  
  pushMatrix(); 
  
  for(int i =0; i<100; i++) { 
    
    strokeWeight(2); 
    stroke(i*2, 255, 255); 
    
    scale(0.95,0.95); 
    rotate(radians(5));
    
    rect(0,0,300,300);   
    
  }  
  
  popMatrix(); 
  
  stroke(255);
  noFill(); 
  rect(0,0,10,10);
 
  popMatrix(); 
  rect(0,0,10,10);
  
}
                
