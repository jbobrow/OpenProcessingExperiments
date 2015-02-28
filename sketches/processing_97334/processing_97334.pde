
void setup (){
  size (200,200);
  background (#84EDA9);
noStroke ();
}
   
void draw (){
  int x = mouseX;
  int y = mouseY;
   background(#1D9046);
  rect (80,80,30,30);
  fill (#84C2DE);
  {
  if (x>=85 && x<=115 && y>=85 && y<=115)
  background (#0A5A7E);
}
}
