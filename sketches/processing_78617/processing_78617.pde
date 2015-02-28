
PFont font;
float pmoveX = 150;
float pmoveY = 150;
float pDirectionX = .5;
float pDirectionY = .5;
float pWidth = 40;
float pHeight = 40;
float SpeedX = 0;
float SpeedY = 0;

String a = "^";
String b = "u";
String c = "o";


boolean sizeChangeX = false;
boolean sizeChangeY =false;

void setup()
{
  size(600,600);
  font = loadFont("MVBoli-20.vlw");
  textFont(font);
}

void draw()
{
  noStroke();
  smooth();
  fill(0,40);
  rect(0,0,600,600);
  fill(255,80,140);
  ellipse(pmoveX, pmoveY, pWidth, pHeight);
  fill(0);
  ellipse(pmoveX-7, pmoveY, 10,15);
  ellipse(pmoveX+7, pmoveY, 10,15);
  fill(255);
  ellipse(pmoveX-9, pmoveY-5, 7,7);
  ellipse(pmoveX+5, pmoveY-5, 7,7);
  fill(0);
  ellipse(pmoveX-1, pmoveY+12, 3,3);
  
  pmoveX += pDirectionX;
  pmoveY += pDirectionY;
  
  if(pmoveX >= 598) //Reversals of Direction
  {
    pDirectionX = -pDirectionX;
  }
  
  if(pmoveY >= 598)
  {
    pDirectionY= -pDirectionY;
  }
  
  if(pmoveY <= 2)
  {
    pDirectionY= -pDirectionY;
  }
  
  if(pmoveX <= 2)
  {
    pDirectionX = -pDirectionX;
  }
  
  if(pWidth<=2) //size change
  {
    pWidth =40;
  }
  
  if(pWidth>=50) //expression change
  {
    fill(255,80,140);
  ellipse(pmoveX, pmoveY, pWidth, pHeight);
  fill(0);
  ellipse(pmoveX-7, pmoveY, 10,2);
  ellipse(pmoveX+7, pmoveY, 10,2);
  fill(0);
  ellipse(pmoveX-1, pmoveY+12, 3,13);
  }
  
  if(pWidth<=35) //expression change
  {
     fill(0,40);
 rect(0,0,600,600);
    fill(255,80,140);
  ellipse(pmoveX, pmoveY, pWidth, pHeight);
  fill(0);
  ellipse(pmoveX-5, pmoveY, 2,10);
  ellipse(pmoveX+5, pmoveY, 2,10); //width height
  fill(0);
  ellipse(pmoveX, pmoveY+8, 12,2);
  }
  
  if(pWidth>=200)
  {
    pHeight =40;
    pWidth =40;
  }
  
  if(pHeight<=2)
  {
    pHeight =40;
    pWidth =40;
  }
  
   if(pHeight>=200)
  {
    pHeight =40;
    pWidth =40;
  }
  //OFF SCREENS
  
  //Relaxed face
  if(pDirectionX == 0 && pDirectionY == 0)
  {
      fill(255,80,140);
  ellipse(pmoveX, pmoveY, pWidth, pHeight); //body
  fill(0);
  textSize(14);
  text(a,pmoveX-13, pmoveY);
  text(a,pmoveX+2, pmoveY);
  fill(255);
  fill(0);
  text(b, pmoveX-4, pmoveY+12);
  }
}
  void keyPressed()
  {
     
     if(keyCode== '=')
     {
        pWidth += 4;
        pHeight += 4;
     }
     
     if(keyCode =='-')
     {
       pWidth += -4;
       pHeight += -4;
     }
     
        if(keyCode == RIGHT)
     {
      pDirectionX = 4;
      pDirectionY = 0;
     }
         if(keyCode == LEFT)
     {
      pDirectionX = -4;
      pDirectionY = 0;
     }
     
         if(keyCode == DOWN)
     {
       pDirectionX = 0;
      pDirectionY = 4;
     }
         if(keyCode == UP)
     {
       pDirectionX = 0;
      pDirectionY = -4;
     }
              if(key == 'r')
     {
       pDirectionX = 0;
      pDirectionY = 0;
     }
  }
  
    void keyReleased()
  {
     
     if(keyCode== '=')
     {
        pWidth += 0;
        pHeight += 0;
     }
     
     if(keyCode== '-')
     {
       pWidth += 0;
       pHeight += 0;
     }
  }
  
  
  
  
  //

