
PImage bg;

void setup() {
  size(600, 360);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "earth.jpg"
  // is 450 x 450 pixels.
  bg = loadImage("dots.png");
}

void draw(){
  
  background(bg);
  
  fill(35,247,61,100);
  ellipse(70,mouseY,70,70);
  
  fill(247,35,212,100);
  ellipse(mouseX,70,70,70);
  
  fill(55,35,247,100);
  ellipse(70,mouseY,70,70);
  
  fill(255,248,31,100);
  ellipse(mouseX-100,mouseY-100,70,70);
  
  fill(247,71,55,100);
  ellipse(mouseX-150,mouseY-300,70,70);
  
  fill(158,64,242,100);
  ellipse(mouseX-230,mouseY+50,70,70);
  
 
 
 
 
 
 
  fill(35,247,61,100);
  ellipse(80-100,mouseY-50,80,80);
  
  fill(247,35,212,100);
  ellipse(mouseX-100,80,80,80);
  
  fill(55,35,247,100);
  ellipse(80-100,mouseY,80,80);
  
  fill(255,248,31,100);
  ellipse(mouseX-100,mouseY,80,80);
  
  fill(247,71,55,100);
  ellipse(mouseX-100,mouseY,80,80);
  
  fill(158,64,242,100);
  ellipse(mouseX-100,mouseY,80,80);
}



