
//David Kim
//Creative Programming
//Assignment 4-2
//10-15-12

void setup() {
  size(800, 800);
  background(0);
  smooth(4);
}
 
void draw() {
  if (mousePressed == true) {
    translate(width/2, height/2);
    rotate(radians(frameCount));
        
    stroke(random(255), random(255), random(255));

    line(-width/2, -height/2, mouseX, mouseY);
    //line(100, 100, mouseX, mouseY);
  
    line(width/2, height/2, mouseX, mouseY);
    //line(width-100, height-100, mouseX, mouseY);
  
    line(-width/2, height/2, mouseX, mouseY);
    //line(100, height-100, mouseX, mouseY);
    
    line(width/2, -height/2, mouseX, mouseY);
    //line(width-100, 100, mouseX, mouseY);
  }
   
    else {
      background(0);
  }
}
