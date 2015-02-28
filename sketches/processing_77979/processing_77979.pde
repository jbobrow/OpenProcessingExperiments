
//Creat per Pau.A
 
float Top,Top2, C1, C2, C3, C4;
 
 
void setup()
{
  size(1010,800);
  background(182, 252, 8);
  Top = 0;
  Top2 = 0;
  println(C1);
  C1 = 0;
  C2 = 255;
  C3 = 255;
  C4 = 255;
  noStroke();
  smooth();
  rect(Top, Top2, width, 10);
}
 
void draw()
{
  C1 = mouseX;
  C2 = C2 + random(-4,10);
  C3 =  C3 + random(-4,10);
  C4 = C4 + random(-3,10);
  if(C4 > 220 && C3 > 220 && C2 > 220)
  {
    C4 =20;
    C3 =20;
    C2 =20;
  }
   
   fill(C2,C4,C3);
  if(mousePressed)
{
  ellipse(mouseX, mouseY, mouseX,mouseY);
  ellipse(width-mouseX, mouseY, width-mouseX, mouseY);
}
   
   
  if(mouseY <10)
  {
    fill(C1, C2, C3);
    rect(0,10,width,height);
    text("PASSA EL RATOLI", 450,8);
    
  }
}


