
void setup () {
  size (300, 300);
  noStroke ();
  smooth ();
  
  
}

void draw () {
  float x = mouseX;
  float y = mouseY;
  float xa = width - mouseX;
  float ya = height - mouseY;
  background (#12A589);
  fill (#02362C, 150);
rect (x, height/2, y, y);
  fill (#02362C, 250);
  ellipse (xa, height/2, ya, ya);
  fill (#02362C, 50);
rect (x,0, x*2, height);
fill (#02362C, 50);
ellipse (xa, 0,  ya*2, ya*2);

  
}




