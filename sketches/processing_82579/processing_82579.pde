
float rectX = 200; 
float rectY = 200; 
float rectWidth = 100; 
float rectHeight = 50; 

void setup() { 
  size(600,600); 
}

void draw() { 
  background(0); 
  
  // check the mouse position to see if it's inside the rectangle
  if((mouseX>rectX) && (mouseX<rectX + rectWidth) && (mouseY>rectY) && (mouseY<rectY+rectHeight)) { 
    fill(255,0,0); 
  } else { 
    fill(128,0,0); 
  } 
    
  rect(rectX, rectY, rectWidth, rectHeight);  
  
  
}
