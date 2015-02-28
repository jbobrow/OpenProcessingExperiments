
void setup()
{
  size(500,300);
  background(250);
  smooth();
  println();
  
 }
 //je crée une fonction draw pour faire bouger 2 cercles au centre du sketch
void draw ()
{
    line(random(0),0,500,300);
  line(500,random(0),0,random(300));
  ellipse(250,150,random(50),mouseY);
  ellipse(250,150,mouseX,random(50));

 
 //je crée une variable 
int PositionX;
PositionX = 10;
int PositionY;
PositionY = 10;

  //ellipses sur le bord
  ellipse(PositionX,PositionY,20,20);
  ellipse(PositionX,PositionY+40,20,20);
  ellipse(PositionX,PositionY+80,20,20);
  ellipse(PositionX,PositionY+120,20,20);
  ellipse(PositionX,PositionY+160,20,20);
  ellipse(PositionX,PositionY+200,20,20);
  ellipse(PositionX,PositionY+240,20,20);
  ellipse(PositionX,PositionY+280,20,20);

 
}

