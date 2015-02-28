
void setup()      //setup runs at the beginning one time
{
  size(500,400);

}

void draw()       //loop
{
   fill(100,150,0);
   ellipse(mouseX,mouseY,20,20);
   
   println(mouseY);

}
