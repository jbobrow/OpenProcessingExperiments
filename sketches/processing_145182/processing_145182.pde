
//click and the ellipses turn yellow
//Porter Windell-period 4 engineering- 4.9.14
void setup ()
{
size (400,400);
 
}
void draw ()
 
{
 
 
  frameRate(99);
// background(#000000);
 // quad (random(0,400),random(0,400),random(0,400),random(0,400),random(0,400),random(0,400),random(0,400),random(0,400));
fill(random(0,255),random(0,255),random(0,255));
ellipse(random(0,400),random(0,400),random(0,50),random(0,50));
rect(random(0,400),random(0,400),random(0,50),random(0,50));
 

 { if ( mousePressed == true ) {
      fill(234,215,33,10); 
  }
  else {
      fill(5,5,1,5);
  }
//fill(178,193,84,50);
frameRate(30);
ellipse(mouseX,mouseY,75,75);
}
{ if ( mousePressed == true ) {
      fill(234,215,33,10); 
  }
  else {
      fill(5,5,1,5);
  }}}


