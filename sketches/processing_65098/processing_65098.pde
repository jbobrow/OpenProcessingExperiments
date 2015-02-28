
//Author - Lostrit form Communicatoin University of China
//UCLA Summer12 - Interactivity - Workshop 3


float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

//sclae value when mouse over the shape
float targetScale = 1.4;

//use these variable to define the shape size
float targetRd = rd;
float targetEd = ed;

//easing coefficient
float easing = 0.08;

//sprites
int spriteCount = 15; //number of sprites
Sprite[] sprites = new Sprite[spriteCount];  //sprite array
String currentShape;

//

//sprite's variable
float spritex = 0;
float spritey = 0;
float spriteVx = 0;
float spriteVy = 0;
float spriteAy = -10;
  
void setup() {
  size(640, 360);
  smooth();
   
  // Set the x- and y-coordinates for the rectangle
  rectMode(CENTER);
  rx = width * 0.33;
  ry = height * 0.5;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(102);
  
  
  //check the ellipse mouse over
  if (ellipseMouseOverCheck(ex,ey,targetEd))
  {
    targetEd += easeTween(targetEd,ed*targetScale);
  }else{
    targetEd += easeTween(targetEd,ed);
  }
  
  //check the recrangle mouse over
  if(rectMouseOverCheck(rx,ry,targetRd))
  {
    targetRd += easeTween(targetRd,rd*targetScale);
  }else{
    targetRd += easeTween(targetRd,rd);
  }
  
  //when mouse pressed initialize the sirptes
  if (mousePressed)
  {
    if(ellipseMouseOverCheck(ex,ey,targetEd))
    {
      currentShape = "ellipse";
      for (int i = 0;i<spriteCount;i++)
      {
        sprites[i] = new Sprite(ex,ey);
      }
    }
    
    if(rectMouseOverCheck(rx,ry,targetRd))
    {
      currentShape = "rect";
      for (int i = 0;i<spriteCount;i++)
      {
        sprites[i] = new Sprite(rx,ry);
      }
    }
  }
  
  //if mouse ever pressed , darw the sprites
  if (currentShape != null)
  {
    for (int i = 0;i<spriteCount;i++)
      {
        sprites[i].fly();
        sprites[i].drawShape(currentShape);
      }
  }
  
  //draw shapes
  rect(rx, ry, targetRd, targetRd);
  ellipse(ex, ey, targetEd, targetEd);
}

//---------------------Mouse Event Check Functions---------------------

//return true if mouse over the ellipse
boolean ellipseMouseOverCheck(float ex,float ey,float ed)
{
  if (dist(ex,ey,mouseX,mouseY)<=targetEd/2)  //check if mouse over the ellipse
  {
    println("mouse over the ellipse");
    return true;
  }else{
    return false;
  }
}

//reutrn true if mouse over the rectangle
boolean rectMouseOverCheck(float rx,float ry,float rd)
{
  if ( mouseX>rx-rd/2 && mouseX<rx+rd/2 && mouseY>ry-rd/2 && mouseY<ry+rd/2)  //check if mouse over the rect
  {
    println("mouse over the rectangle");
    return true;
  }else{
    return false;
  }
}

//------------------------Animation Functions-----------------------
float easeTween(float currentValue,float targetValue)
{
  float disValue = targetValue - currentValue;
  if (abs(disValue)>5)
  {
     return disValue*easing;
  }else{
    return 0;
  }
}


//------------------------Class of Sprite----------------------------

class Sprite
{
  float px;    //sprite position x
  float py;    //sprite position y
  float vx;    //sprite velocity x
  float vy;    //sprite velocity y
  float ay=.5;    //sprite acceleration y
  float spriteSize = random(20,40);  //get a random sprite size
  
  Sprite (float sx,float sy)
  {
    px = sx;
    py = sy;
    
    vx = random(-5,5);  //get a ramdom velocity x for the start velocity
    vy = -random(5,15);  //get a ramdom velocity y for the start velocity
  }
  
  //math count of sprite count
  void fly()
  {
    px+=vx;
    py+=vy;
    vy+=ay;
  }
  
  //doaw ellipse if shape name is ellipse,rect if shape name is rect
  void drawShape(String shapeName)
  {
    fill(0,80);
    if (shapeName == "ellipse")
    {
      ellipse(px,py,spriteSize,spriteSize);
    }
    
    if (shapeName == "rect")
    {
      rect(px,py,spriteSize,spriteSize);
    }
    fill(255);
  }
}

