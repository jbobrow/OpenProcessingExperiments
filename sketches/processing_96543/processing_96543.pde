
void setup (){
  size (200,200);
  background (44, 190, 232);
}
 
void draw (){
  int x = mouseX;
  int y = mouseY;
   background (44, 190, 232);
  rect (85,85,25,25);
  fill (255);
  {
  if (x>=85 && x<=110 && y>=85 && y<=110)
  background (255);}
}
