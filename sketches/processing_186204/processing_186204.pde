
void setup() {
  size(600, 600);
  background(255, 255, 255);
  noStroke();
}


  //sections
 void draw() {
  fill(29, 0, 178);
  rect(0, 0, width/2, width/2);
  rect(width/2, height/2, width/2, height/2);
  fill(255, 255, 255);
  rect(width/2, 0, width/2, height/2);
  rect(0, height/2, width/2, height/2);
  
  
  //animations
      
  //bottom right
  if (mouseX > width/2) {
    if(mouseY > height/2) {
      fill(255, 0, 0); 
      rect(width/3*2, height/3*2, 100, 100);
    }
  }
  
  //bottom left
  if(mouseX < width/2) {
    if(mouseY > height/2) {
      fill(0, 0, 0);
      rect(width/3/2, height/3*2, 100, 100);
    }
  }

  //top left
  if(mouseX < width/2) {
    if(mouseY < height/2) {
      fill(255, 0, 0);
      rect(width/3/2, height/3/2, 100, 100);
    }
  }

   //top right
   if(mouseX > width/2) {
    if(mouseY < height/2) {
      fill(0, 0, 0);
      rect(width/3*2, height/3/2, 100, 100);
    }
  }
 
  
 }
