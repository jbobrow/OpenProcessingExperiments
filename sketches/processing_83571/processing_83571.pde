
MousePosition[] mousePositions = new MousePosition[0];
int maxPositions = 20; 

void setup() { 
  size(600,600);  
}

void draw() { 
  background(0); 
  
  noFill();  
  stroke(255);
  
  mousePositions = (MousePosition[]) append(mousePositions, new MousePosition(mouseX, mouseY)); 
  
  if(mousePositions.length>maxPositions) { 
    
    mousePositions = (MousePosition[]) subset(mousePositions, 1); 
    
  }
  
  for(int i = 0; i<mousePositions.length; i++) { 
    ellipse(mousePositions[i].x, mousePositions[i].y, 10, 10); 
  }
}

class MousePosition {
  float x; 
  float y;
  
  MousePosition(float xpos, float ypos) { 
    x = xpos; 
    y = ypos; 
  }
}
