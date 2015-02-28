
void setup()
{
  size(500,500);
 frameRate(20); 
}
void draw()
{ 
  background(255);
 

  fill(45,255,7,180);
  translate(35,0);
  int i = 0;
 
 while (i <4) 
{ 
  translate(0,45);        //Reihe 1
    pushMatrix();
    translate(0,mouseX/29);
  ellipse(40,30,30,30);
   pushMatrix();
   translate(-mouseY/29,0);
  ellipse(90,30,30,30);
   popMatrix();
  ellipse(140,30,30,30);
   pushMatrix();
   translate(-mouseY/28,0);
  ellipse(190,30,30,30);
   popMatrix();
  ellipse(240,30,30,30);
   pushMatrix();
   translate(-mouseY/28,0);
  ellipse(290,30,30,30);
   popMatrix();
  ellipse(340,30,30,30);
   pushMatrix();
   translate(-mouseY/28,0);
  ellipse(390,30,30,30);
   popMatrix();
  popMatrix();
  
    translate(0,50);          //Reihe 2
  ellipse(40,30,30,30); 
    pushMatrix();
   translate(-mouseY/29,0);
  ellipse(90,30,30,30);
   popMatrix();
  ellipse(140,30,30,30);
    pushMatrix();
   translate(-mouseY/29,0);
  ellipse(190,30,30,30);
   popMatrix();
  ellipse(240,30,30,30);
    pushMatrix();
   translate(-mouseY/29,0);
  ellipse(290,30,30,30);
   popMatrix();
  ellipse(340,30,30,30);
    pushMatrix();
   translate(-mouseY/29,0);
  ellipse(390,30,30,30);
   popMatrix();
  i = i +1;
 } 
}
