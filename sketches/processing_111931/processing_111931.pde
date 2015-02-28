
float inc = 40;

void setup() {
  size(1000, 500, P2D);
  frameRate(24);
  colorMode(RGB, width,height,255);
  background(mouseX, mouseY, 255);
}

void draw() {
  
  background(mouseX, mouseY, 255);
  stroke(0);
  
  if (mousePressed == true){
  
  for (float x = 0 ; x <= width ; x += inc) {
    line(mouseX, mouseY, x, 0);
    line(mouseX, mouseY, x, height);
  }
  
  for (float y = 0 ; y <= height ; y += inc) {
    line(mouseX, mouseY, 0, y);
    line(mouseX, mouseY, width, y);
  }
  }
  else{
    
   for (float x = 30 ; x <= width ; x += inc) {
    line(mouseX, mouseY, x, random(0,60));
    line(mouseX, mouseY, x, height-random(0,60));
  }
  
  for (float y = 30 ; y <= height ; y += inc) {
    line(mouseX, mouseY, random(0,60), y);
    line(mouseX, mouseY, width-random(0,60), y);
  }
  /*line(mouseX, mouseY, width, 0);
  line(mouseX, mouseY, width/2, 0);
  line(mouseX, mouseY, 0, 0);
  line(mouseX, mouseY, width, height);
  line(mouseX, mouseY, width/2, height);
  line(mouseX, mouseY, 0, height);*/
  } 
}
