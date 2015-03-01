
void setup () {
  size (300, 300);
  smooth ();
  
}

void draw () {
  
  background (150, 45, 98);
  if (mouseX <= 150) {
    cursor (TEXT);
  } else {
    cursor (HAND);
  }
  
  
}




