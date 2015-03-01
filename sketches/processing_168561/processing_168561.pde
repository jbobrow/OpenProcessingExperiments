
void setup ()
{
  size (510,500);
  background (0);
  fill (255);
  rect (10,10,490,480);
  translate (10,10);
  fill (0);
  rect (10,0,10,480);
  rect (30,0,10,480);
  rect (50,0,10,480);
  rect (70,0,10,480);
  rect (90,0,10,480);
  rect (110,0,10,480);
  rect (130,0,10,480);
  rect (150,0,10,480);
  rect (170,0,10,480);
  rect (190,0,10,480);
  rect (210,0,10,480);
  rect (230,0,10,480);
  rect (250,0,10,480);
  translate (260,0);
  rect (10,0,10,480);
  rect (30,0,10,480);
  rect (50,0,10,480);
  rect (70,0,10,480);
  rect (90,0,10,480);
  rect (110,0,10,480);
  rect (130,0,10,480);
  rect (150,0,10,480);
  rect (170,0,10,480);
  rect (190,0,10,480);
  rect (210,0,10,480);
 }
 void draw ()
 {
 
   fill (0);
   rotate (radians (mouseY));
   rect (mouseX,mouseY,10,440);
   rect (mouseX+20,mouseY,10,440);
   rect (mouseX+40,mouseY,10,440);
   fill (255);
   rect (mouseX+10,mouseY,10,440);
   rect (mouseX+30,mouseY,10,440);
   rect (mouseX+50,mouseY,10,440);
 }
