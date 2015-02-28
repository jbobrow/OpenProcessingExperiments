
PImage theImage;
PImage backImage;

class MovingSprite
{
  //data members
  float x,y,velx,vely,w,h;
  PImage theImage;
  
  //constructor
  MovingSprite(float inX, float inY, float inVelX, float inVelY, String inImageName)
  {
    x=inX;
    y=inY;
    velx=inVelX;
    vely=inVelY;
    theImage= loadImage(inImageName);
    w=theImage.width;
    h=theImage.height;
  }
  //methods
  void DrawSprite()
  {
    image(theImage,x,y);
  }
  void Location()
  {
    x += velx;
    y += vely;
  
  
  if ((x< 0) || ((x+w)>width))
  {
    velx=velx*-1;
    x+=velx;
  }
   if ((y< 0) || ((y+h)>height))
  {
    vely=vely*-1;
    y+=vely;
  }
  }
  
  void SetImage(String newImageName)
  {
    theImage= loadImage(newImageName);
    w=theImage.width;
    h=theImage.height;
  }
  
  boolean MouseInSprite()
  {
    boolean rVal;
    
   if (((mouseX>x)&&(mouseX<(x+w))) &&
      ((mouseY>y)&&(mouseY<(y+h))))
      rVal=true;
      else
      rVal=false;
      
      return (rVal);
  }
  
  
}

MovingSprite ms1,ms2,ms3,ms4,ms5,ms6,ms7,ms8,ms9,ms10;

void setup()
{

 ms1=new MovingSprite(100,100,2,3,"duck.png"); 
 ms1.DrawSprite();
 ms2=new MovingSprite(200,125,1,2,"duck.png");
 ms2.DrawSprite();
 ms3=new MovingSprite(100,200,1,1,"duck.png"); 
 ms3.DrawSprite();
 ms4=new MovingSprite(200,300,2,3,"duck.png");
 ms4.DrawSprite();
 ms5=new MovingSprite(150,400,2,2,"duck.png");
 ms5.DrawSprite();
 ms6=new MovingSprite(95,175,1,3,"duck.png");
 ms6.DrawSprite();
 ms7=new MovingSprite(25,250,2,1,"duck.png");
 ms7.DrawSprite();
 ms8=new MovingSprite(250,350,1,2,"duck.png");
 ms8.DrawSprite();
 ms9=new MovingSprite(400,375,2,1,"duck.png");
 ms9.DrawSprite();
 ms10=new MovingSprite(175,225,3,2,"duck.png");
 ms10.DrawSprite();
 
 size (900,450); 
 backImage= loadImage ("range.jpg");

}

void draw()
{ 
  image (backImage,0,0,900,450);
  ms1.Location();
  ms1.DrawSprite();
  ms2.Location();
  ms2.DrawSprite();
  ms3.Location();
  ms3.DrawSprite();
  ms4.Location();
  ms4.DrawSprite();
  ms5.Location();
  ms5.DrawSprite();
  ms6.Location();
  ms6.DrawSprite();
  ms7.Location();
  ms7.DrawSprite();
  ms8.Location();
  ms8.DrawSprite();
  ms9.Location();
  ms9.DrawSprite();
  ms10.Location();
  ms10.DrawSprite();
  
  fill (255,255,255,0);
  stroke(0);
  ellipse (mouseX,mouseY,50,50);
  line (mouseX+25,mouseY,mouseX,mouseY);
  line (mouseX-25,mouseY,mouseX,mouseY);
  line (mouseX,mouseY+25,mouseX,mouseY);
  line (mouseX,mouseY,mouseX,mouseY-25);
  

}

void mousePressed()
{
  
  if (ms1.MouseInSprite())
    ms1.SetImage("skull.gif");
  if (ms2.MouseInSprite())
    ms2.SetImage("skull.gif");
  if (ms3.MouseInSprite())
    ms3.SetImage("skull.gif");
  if (ms4.MouseInSprite())
    ms4.SetImage("skull.gif");
  if (ms5.MouseInSprite())
    ms5.SetImage("skull.gif");
  if (ms6.MouseInSprite())
    ms6.SetImage("skull.gif");
  if (ms7.MouseInSprite())
    ms7.SetImage("skull.gif");
  if (ms8.MouseInSprite())
    ms8.SetImage("skull.gif");
  if (ms9.MouseInSprite())
    ms9.SetImage("skull.gif");
  if (ms10.MouseInSprite())
    ms10.SetImage("skull.gif");

  
}
  

