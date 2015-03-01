
void setup () 
{
  size(500, 500);
}
void draw () { 
  if (mouseY > height/2) {
    background (255);
  } 
  else { 
    background (0) ;
  }
  ellipse (50, 255, 50, 50);
}
