
void setup (){
  size (200,200);
  background (0);
}
  
void draw (){
  int x = mouseX;
  int y = mouseY;
   background (0);
  rect (85,85,30,30);
  fill (144,255,78);
  {
  if (x>=85 && x<=115 && y>=85 && y<=115)
  background (255);}
}
