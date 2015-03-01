
void setup()
{
  size(500,500);
  frameRate(60);
  background(0);
  
  colorMode(HSB,100,100,100);
}

void draw()
{
  strokeWeight(10);
  stroke(random(0,100),random(25,100),random(50,100));
  if (mousePressed == true)
  {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

}

void keyPressed() {
  switch(key) {
    case 'a':
  background(random(0,100),random(10,100),random(10,100));
      break;
  case 'c':
  background(100);
      break;

}
}



