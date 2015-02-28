

void setup()

{ 
  
  size (192,157);
  background (0);
  
  }
  int value = 0;
void draw()

{
  strokeWeight(2);
fill(value,150,180);
rect (mouseX, mouseY, mouseX, mouseY);
smooth();
  
}

void mouseMoved() {
  value = value + 2;
  if (value > 255) {
    value = 0;
  }
}


  




