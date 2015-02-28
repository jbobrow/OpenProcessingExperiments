
float[] xPositions = new float[0]; 
float[] yPositions = new float[0]; 

void setup() { 
  size(600,600); 
  frameRate(60);   
}

void draw() { 
  background(0); 
  noFill(); 
  stroke(255, 30);
  strokeWeight(2); 
  
  xPositions = append(xPositions, mouseX); 
  yPositions = append(yPositions, mouseY); 
  
  for(int i=0; i<xPositions.length; i++) { 
    ellipse(xPositions[i], yPositions[i], 200-i,200-i);     
  }
  
  if(xPositions.length>200) { 
    xPositions = subset(xPositions, 1); 
    yPositions = subset(yPositions, 1);   
  }
}
