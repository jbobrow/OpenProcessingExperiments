
void setup()
{
size (500,500);
background (0);    //creation setup
stroke (255,30);
noFill ();
}
 
void draw()   //draw
{
 translate(mouseX,mouseY);
 rotate(frameCount/20);      //mouse click input
 rotate(random(PI));
 
  if (mousePressed) 
  {
   ellipse (0,0, random(0,20),random(100,200));  //mouse click draw
   ellipse (10,50, 20,50);

   }
}
void keyReleased()
{
if (key=='c' || key=='C') 
 {
  background(0);                     //CLEAN SCREEN PRESSING "C"
 }
}



