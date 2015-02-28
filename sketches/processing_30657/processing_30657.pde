
float circleSize; 
  circleSize = random (30); 
  
  size ( 600, 500);
  smooth(); 
  background(random(25));
  
  
  for ( int i = 0; i < 600; i = i +1)
  {
      float blueSize = random (70); 
      noStroke(); 
      fill (random(5,255),8,9);
      ellipse ( random(width), random(height),blueSize,blueSize);
  
  }
  
  
  noStroke(); 
  fill (0,random(15,145),9);
  ellipse ( 200, 200, 200, 200); 
  
 
  noStroke(); 
  fill (255,255,random(255));
  ellipse ( 150, 200, 100, 100);
   
