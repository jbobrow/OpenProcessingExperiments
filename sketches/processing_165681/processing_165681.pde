
void draw()
{
  if( 20<mouseX && mouseX<(20+50)
  && 20<mouseY && mouseY<(20+30) )
 {
   fill(150);
 }
 else
 {
   fill(250);
 }


quad(20,20,50,30);
}


