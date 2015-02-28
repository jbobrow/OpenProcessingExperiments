
//Greg Conte
//march4
//Creative Computing
//Trippy
 float x, y;
void setup() {
  size(500, 500);
}
 
void draw() {
  background(0);
 //white
  for ( int x = 0; x<width; x+=6) {
    stroke(255);
    line (mouseX, mouseY, x, 0);
  }
 //red
  for ( int x = 0; x<width; x+=4) {
    stroke (200,20,29);
    line (mouseX, mouseY, y, x);
  }
 //green
  for ( int y = 0; y<width; y+=10) {
    stroke (90,199,50);
    line (mouseX, mouseY, x, y);
  }
 //purple
  for ( int y = 0; y<width; y+=1) {
    stroke (80,3,50);
    line (mouseX, mouseY, y, x);
  }
  
  
  
 //on click
  if (mousePressed==true) {
     
   
   


     for (float y = 0; y<width; y+=mouseY+10) {
      noStroke();
      ellipse(250, y, mouseY, mouseX);
    }

    }
    }







