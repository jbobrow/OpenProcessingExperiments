
void setup (){
  size (200,200);
  background (255);
}
 
void draw (){
  int x = mouseX;
  int y = mouseY;
   background(0);
  rect (90,90,20,20);
  fill (255,0,0);
  {
  if (x>=90 && x<=110 && y>=90 && y<=110)
  background (255);
}
}
