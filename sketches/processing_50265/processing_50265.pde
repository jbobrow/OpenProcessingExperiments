
 void setup(){
  size (1000, 1000);
  smooth();
}

void draw(){
 
  fill(0, 0, 255, random(0, 3));
  
  strokeWeight(random(.11, .15));
  //making ellipses match mouse movement
  ellipse (mouseX, mouseY, mouseX, mouseY);
}

