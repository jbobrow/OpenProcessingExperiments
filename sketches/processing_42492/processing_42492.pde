
void setup() { 
  size(300, 300); 
  strokeWeight(1); 
  smooth();
}
void draw() { 
  
 noStroke();
 fill(0, 10);
rect (0,0, width, height); 

   
  stroke(255); 
  line(0, 150, mouseX, mouseY); // White line 
  stroke(255);
  float mx = mouseX/2 + 60; 
  line(300, 150, mouseX, mouseY); // Black line
  stroke(255);
  line(150, 0, mouseX, mouseY);
  stroke(255);
  line(0, 300, mouseX, mouseY);
  stroke(255);
  line(300, 300, mouseX, mouseY);
  stroke(142, 138,138);
  ellipse(150, 150, mouseX, mouseY);
}



