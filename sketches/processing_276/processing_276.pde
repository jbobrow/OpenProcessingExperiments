

void setup() 
{
  size(740,280);
  smooth();
  noStroke();
  mouseX = 730;
  mouseY = 50;
}

void draw() 
{
  //lights();
  background(0);
  
  for (int x = 0; x <= width + 200; x += 40) {
    for (int y = 0; y <= height + 200 ; y += 40) {
      pushMatrix();
      translate(x, y);
      fill(map(x, 0,width, 0, 255),map(y, 0,height, 0, 255),150);
      scale(map(mouseX, 0, width*1.95, 0, PI));
      ellipse(0,0,40,40);
      popMatrix();
    }
  }
}

