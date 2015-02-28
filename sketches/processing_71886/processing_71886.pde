
//Jarivs Law, User Input, CP1 mods 16-17
float r=256;
float g=256;
float b=256;
void setup()
{
size(500,500);
noStroke();
background(0);

}
void draw()
{
  fill(1,5);
  rect(0,0,500,500);
 
}
void mouseDragged()
  {
    if(keyPressed==true&&key; =='z')
    {
      fill(255-r,255-g,255-b);
    ellipse(mouseX,mouseY,20,20);
    ellipse(500-mouseX,mouseY,20,20);
    }
     if (keyPressed==true&&key; =='x')
     {
       ellipse(mouseX,mouseY,30,30);
       ellipse(500-mouseX,mouseY,30,30);
     }
         {
      stroke(r,g,b);
      r=random(256);
      g=random(256);
      b=random(256);
    }
  }
  void keyPressed()
  {
     if (key=='c')
    {
      noStroke();
      background(0);
    }
  }
