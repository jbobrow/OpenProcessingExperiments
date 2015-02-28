
PFont w;
PFont s;
void setup()
{
  frameRate(12);
  size(600,400);
  background(200,55,10);
   
}
   
 void draw()
 
{
   background(200,55,10);
 fill(155,20,10);
  z=loadFont("Garamond-Bold-800.vlw");
  textFont(z);
   
text ("Yeeeeeah Baby",random(600),random(400));
 
 
fill(15,255,250);
  w=loadFont("Helvetica-40000.vlw");
  textFont(w);
text ("DAMN YEAAAAAH",random(600),random(400));
 
}
