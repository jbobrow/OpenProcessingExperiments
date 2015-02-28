
void setup() {
  size (500, 500);
  noFill();
  smooth();
  noCursor();
  stroke(255);
  frameRate(20);
  background(0);
  
}
 
 
void draw() {
  
  background(0,0,0);
  
  strokeWeight((mouseX+mouseY)/35);
  stroke(mouseX,mouseY,(mouseX+mouseY)/2);
  
  for (int x=10; x<= width; x=x+50) 
  { 
    
    ellipse(mouseX+(random(100)-50),(pmouseY+(random(50)-25)),15+(mouseX/5),15+(mouseX/5));
  }
    
  for (int y=10; y<= height;y= y+50 )
  { 
  
    ellipse((pmouseX+(random(50)-25)),mouseY+(random(100)-50),15+(mouseY/5),15+(mouseY/5));
  }
    
}



