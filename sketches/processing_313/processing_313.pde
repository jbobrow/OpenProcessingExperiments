

void setup(){
  size(640, 480);
  background(0);
  colorMode(HSB, 360, width, height); 
  smooth();
}

void draw(){
  noStroke();
   fill(mouseX, mouseX, mouseY);
   triangle(width/2,height/2,mouseX+20, mouseY+20, mouseX-20, mouseY+20); 
}


