

void setup() { 
  size(400,400); 
  smooth(); 
}

void draw() { 
  
  background(127); 
  
  // count from 20 to 380 jumping 20 each time.
  for(int x=20; x<=380; x+=20) { 
    
    // and draw a circle in that position
    ellipse(x, 200, 15,15);  
    
  }
  
}
