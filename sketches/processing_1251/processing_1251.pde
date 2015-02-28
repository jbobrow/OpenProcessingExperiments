
int slinky = 25;

void setup() {
  size(600,550);
  background(255);
  smooth();
}

void draw() {
  slinkys(mouseX, mouseY, pmouseX, pmouseY);
}

void slinkys(int x, int y, int px, int py) {
  if (mousePressed == true)
  {
    fill(0);
    fill(255); 
    if(keyPressed) 
      if (key == 'r' || key == 'r')
        fill(255,0,0);
    if (key == 'c' || key == 'c')
      fill(455);
      if (key == 'g' || key == 'g')
        fill(0,255,0);
      if (key == 'b' || key == 'b')
        fill(0,0,255);
    if(mousePressed) {
      ellipse(mouseX, mouseY, slinky, slinky);

      if(key == '*' || key == '*') {
        slinky = slinky+1;
      }
      else {
        
        slinky = 25;
      }
    }
  }

  ellipse(x,y,45,45);
}

