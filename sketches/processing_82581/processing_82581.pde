
float[] rectXs = {200, 400, 500}; 
float[] rectYs = {200, 250, 300}; 
float[] rectWidths = {100, 80, 50}; 
float[] rectHeights = {50, 100, 120}; 

void setup() { 
  size(600,600); 
}

void draw() { 
  background(0); 
  
  for(int i = 0; i<rectXs.length; i++) {
      // check the mouse position to see if it's inside the rectangle
      if((mouseX>rectXs[i]) && (mouseX<rectXs[i] + rectWidths[i]) && (mouseY>rectYs[i]) && (mouseY<rectYs[i]+rectHeights[i])) { 
        fill(255,0,0); 
      } else { 
        fill(128,0,0); 
      } 
        
      rect(rectXs[i], rectYs[i], rectWidths[i], rectHeights[i]);  
  }
  
}
