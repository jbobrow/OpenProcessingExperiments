
void setup() { 
  size(1260, 800); 
  smooth(); 
  frameRate(30); 
  }; 
 
void draw() { 
   
  background(255); 
  ellipseMode(CENTER);    
   
  //UFO structure 
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY-25, 80, 100);
   
  noStroke(); 
  fill(0); 
  ellipse(mouseX, mouseY, 150, 60); 
    

  noStroke(); 
  fill(255); 
  ellipse(mouseX, mouseY-23, 80,15); 
  }; 

