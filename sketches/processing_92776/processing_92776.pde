
// Modified from Brian Abbott's code

PImage img;
float pmoveX = 150;
float pmoveY = 150;
float pDirectionX = .5;
float pDirectionY = .5;
float pWidth = 40;
float pHeight = 40;
float SpeedX = 0;
float SpeedY = 0;
 
String a = "o";
String b = "w";
String c = "o";
 
 
boolean sizeChangeX = false;
boolean sizeChangeY =false;
 
void setup()
{
  size(600,600);
  img = loadImage( "Kirbyball.png");
}
 
void draw()
{
  noStroke();
  smooth();
  fill(0,40);
  rect(0,0,600,600);
  //fill(255,255,140);
  ellipse(pmoveX, pmoveY, pWidth, pHeight);
  fill(0);
  rect(pmoveX-7, pmoveY, 10,15);
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
    image(img, pmoveX - 21, pmoveY - 20, pWidth, pHeight);
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
   
 

   



