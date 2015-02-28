
void setup () {
size (400,400);
smooth ();
strokeWeight (2);
}

void draw () {
float g=random (0,255);
  float a=random (0,255);
  
    
  for (int y = 0; y <= height; y += 40) {
  for (int x = 0; x <= width; x += 40) { 
    fill(g,a);
    ellipse (x,y,50,50);
  }
  }
}




