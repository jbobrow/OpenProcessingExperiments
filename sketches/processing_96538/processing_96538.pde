
void setup (){
  size (200,200);
  background (255);
}

void draw (){
  int x = mouseX;
  int y = mouseY;
  
  rect (85,85,25,25);
  fill (255,0,0);
  {
  if (x>=85 && x<=110 && y>=85 && y<=110)
  background (255);}
}
