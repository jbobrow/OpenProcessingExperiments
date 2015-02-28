
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79566*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Modified from Brian Abbot's Code
PFont font;
PImage img;
PImage Win;
PImage Lose;
PImage Metaknight;
float pmoveX = 150;
float pmoveY = 150;
float pDirectionX = .5;
float pDirectionY = .5;
float pWidth = 40;
float pHeight = 40;
float SpeedX = 0;
float SpeedY = 0;
int GOVER =1;
int score = 0;
boolean Tscore = false;

float maxSpeed2 =2.0;
float maxSpeed = 5.0;

String a = "^";
String b = "u";
String c = "o";
float ObjectiveX = 50;
float ObjectiveX2 = 50;
float ObjectiveX3 = 50;
float ObjectiveX4 = 150;
float ObjectiveX5 = 150;
float ObjectiveX6 = 150;
float ObjectiveX7 = 250;
float ObjectiveX8 = 250;
float ObjectiveX9 = 250;
float ObjectiveX10 = 350;
float ObjectiveX11 = 350;
float ObjectiveX12 = 350;
float ObjectiveX13  = 450;
float ObjectiveX14 = 450;
float ObjectiveX15 = 450;
float ObjectiveX16 = 550;
float ObjectiveX17 = 550;
float ObjectiveX18 = 550;
float ObjectiveX19= 350;
float ObjectiveX20 =350;

float ObjectiveY  = 100;
float ObjectiveY2  = 300;
float ObjectiveY3  = 500;
float ObjectiveY4  = 100;
float ObjectiveY5  = 300;
float ObjectiveY6  = 500;
float ObjectiveY7   = 100;
float ObjectiveY8  = 300;
float ObjectiveY9  = 500;
float ObjectiveY10  = 100;
float ObjectiveY11  = 300;
float ObjectiveY12  = 500;
float ObjectiveY13  = 100;
float ObjectiveY14  = 300;
float ObjectiveY15  = 500;
float ObjectiveY16 = 100;
float ObjectiveY17 = 300;
float ObjectiveY18 = 500;
float ObjectiveY19  = 560;
float ObjectiveY20  = 560;

float enemyx = 200;
float enemyx2 = 550;
float enemyx3 = 580;
float enemyx4 = 400;
float enemyx5 = 300;
float enemyx6 = 220;
float enemyx7 = 110;
float enemyx8 = 505;
float enemyx9 = 10;

float enemyY = 500;
float enemyY2 = 350;
float enemyY3 = 570;
float enemyY4 = 400;
float enemyY5 = 300;
float enemyY6 = 560;
float enemyY7 = 510;
float enemyY8 = 205;
float enemyY9 = 10;

float enemyMoveX =0;
float enemyMoveX2 =0;
float enemyMoveX3 =0;
float enemyMoveX4 =0;
float enemyMoveX5 =0;
float enemyMoveX6 =0;
float enemyMoveX7 =0;
float enemyMoveX8 =0;
float enemyMoveX9 =0;

float enemyMoveY =0;
float enemyMoveY2 =0;
float enemyMoveY3 =0;
float enemyMoveY4 =0;
float enemyMoveY5 =0;
float enemyMoveY6 =0;
float enemyMoveY7 =0;
float enemyMoveY8 =0;
float enemyMoveY9 =0;

float ObjectiveMX = 0;        
    float  ObjectiveMX2 = 0;
float ObjectiveMX3 = 0;
float ObjectiveMX4 = 0;
float ObjectiveMX5 = 0; 
float ObjectiveMX6 = 0;
float ObjectiveMX7 = 0; 
float ObjectiveMX8 = 0;
float ObjectiveMX9 = 0;
float ObjectiveMX10 = 0;
float ObjectiveMX11 = 0;
float ObjectiveMX12 = 0;
float ObjectiveMX13 = 0;
float ObjectiveMX14 = 0; 
float ObjectiveMX15 = 0;
float ObjectiveMX16 = 0; 
float ObjectiveMX17 = 0;
float ObjectiveMX18 = 0;
float ObjectiveMX19 = 0;
float ObjectiveMX20 = 0;

float ObjectiveMY = 0;
     float ObjectiveMY2 = 0;
float ObjectiveMY3 = 0;
float ObjectiveMY4 = 0;
float ObjectiveMY5 = 0;
float ObjectiveMY6 = 0;
float ObjectiveMY7 = 0;
float ObjectiveMY8 = 0;
float ObjectiveMY9 = 0; 
float ObjectiveMY10 = 0;
float ObjectiveMY11 = 0;
float ObjectiveMY12 = 0; 
float ObjectiveMY13 = 0; 
float ObjectiveMY14 = 0; 
float ObjectiveMY15 = 0;
float ObjectiveMY16 = 0; 
float ObjectiveMY17 = 0;
float ObjectiveMY18 = 0;
float ObjectiveMY19 = 0;
float ObjectiveMY20 = 0;


boolean sizeChangeX = false;
boolean sizeChangeY =false;

void setup()
{
  size(600, 600);
  font = loadFont("MVBoli-20.vlw");
  img = loadImage( "Kirbyball.png");
  Win = loadImage( " Win.png");
  Lose = loadImage( " Lose.png");
  Metaknight = loadImage( "Meta.png");
  textFont(font);
  enemyMoveX = random(-maxSpeed, maxSpeed);
    enemyMoveX2 = random(-maxSpeed, maxSpeed);
      enemyMoveX3 = random(-maxSpeed, maxSpeed);
        enemyMoveX4 = random(-maxSpeed, maxSpeed);
          enemyMoveX5 = random(-maxSpeed, maxSpeed);
            enemyMoveX6 = random(-maxSpeed, maxSpeed);
              enemyMoveX7 = random(-maxSpeed, maxSpeed);
                enemyMoveX8 = random(-maxSpeed, maxSpeed);
                  enemyMoveX9 = random(-maxSpeed, maxSpeed);
  enemyMoveY = random(-maxSpeed, maxSpeed);
    enemyMoveY2 = random(-maxSpeed, maxSpeed);
      enemyMoveY3 = random(-maxSpeed, maxSpeed);
        enemyMoveY4 = random(-maxSpeed, maxSpeed);
          enemyMoveY5 = random(-maxSpeed, maxSpeed);
            enemyMoveY6 = random(-maxSpeed, maxSpeed);
              enemyMoveY7 = random(-maxSpeed, maxSpeed);
                enemyMoveY8 = random(-maxSpeed, maxSpeed);
                  enemyMoveY9 = random(-maxSpeed, maxSpeed);
                  
   ObjectiveMX = random(-maxSpeed2, maxSpeed2);               
     ObjectiveMX2 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX3 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX4 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX5 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX6 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX7 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX8 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX9 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX10 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX11 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX12 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX13 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX14 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX15 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX16 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX17 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX18 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX19 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMX20 = random(-maxSpeed2, maxSpeed2); 

   ObjectiveMY = random(-maxSpeed2, maxSpeed2);               
     ObjectiveMY2 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY3 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY4 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY5 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY6 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY7 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY8 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY9 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY10 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY11 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY12 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY13 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY14 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY15 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY16 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY17 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY18 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY19 = random(-maxSpeed2, maxSpeed2); 
ObjectiveMY20 = random(-maxSpeed2, maxSpeed2);
}

void draw()
{
  textSize(12);
  text("Score "+score, 450,40);
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

  pmoveX += pDirectionX;
  pmoveY += pDirectionY;

  //OBJECTIVE Of THE GAME
  fill(255, 0, 0);
  ellipse(ObjectiveX, ObjectiveY, 10, 10);
  ellipse(ObjectiveX2, ObjectiveY2, 10, 10);
  ellipse(ObjectiveX3, ObjectiveY3, 10, 10);
  ellipse(ObjectiveX4, ObjectiveY4, 10, 10);
  ellipse(ObjectiveX5, ObjectiveY5, 10, 10);
  ellipse(ObjectiveX6, ObjectiveY6, 10, 10);
  ellipse(ObjectiveX7, ObjectiveY7, 10, 10);
  ellipse(ObjectiveX8, ObjectiveY8, 10, 10);
  ellipse(ObjectiveX9, ObjectiveY9, 10, 10);
  ellipse(ObjectiveX10, ObjectiveY10, 10, 10);
  ellipse(ObjectiveX11, ObjectiveY11, 10, 10);
  ellipse(ObjectiveX12, ObjectiveY12, 10, 10);
  ellipse(ObjectiveX13, ObjectiveY13, 10, 10);
  ellipse(ObjectiveX14, ObjectiveY14, 10, 10);
  rect(ObjectiveX15, ObjectiveY15, 10, 10);
  rect(ObjectiveX16, ObjectiveY16, 10, 10);
  rect(ObjectiveX17, ObjectiveY17, 10, 10);
  rect(ObjectiveX18, ObjectiveY18, 10, 10);
  rect(ObjectiveX19, ObjectiveY19, 10, 10);
  image(img, ObjectiveX20, ObjectiveY20);
  fill(255,255,255);
  
  enemyx += enemyMoveX;
  enemyx2 += enemyMoveX2;
  enemyx3 += enemyMoveX3;
  enemyx4 += enemyMoveX4;
  enemyx5 += enemyMoveX5;
  enemyx6 += enemyMoveX6;
  enemyx7 += enemyMoveX7;
  enemyx8 += enemyMoveX8;
  enemyx9 += enemyMoveX9;
  
  enemyY += enemyMoveY;
  enemyY2 += enemyMoveY2;
  enemyY3 += enemyMoveY3;
  enemyY4 += enemyMoveY4;
  enemyY5 += enemyMoveY5;
  enemyY6 += enemyMoveY6;
  enemyY7 += enemyMoveY7;
  enemyY8 += enemyMoveY8;
  enemyY9 += enemyMoveY9;
  
  ObjectiveX += ObjectiveMX;
  ObjectiveX2 += ObjectiveMX2;
  ObjectiveX3 += ObjectiveMX3;
  ObjectiveX4 += ObjectiveMX4;
  ObjectiveX5 += ObjectiveMX5;
  ObjectiveX6 += ObjectiveMX6;
  ObjectiveX7 += ObjectiveMX7;
  ObjectiveX8 += ObjectiveMX8;
  ObjectiveX9 += ObjectiveMX9;
  ObjectiveX10 += ObjectiveMX10;
  ObjectiveX11 += ObjectiveMX11;
  ObjectiveX12 += ObjectiveMX12;
  ObjectiveX13 += ObjectiveMX13;
  ObjectiveX14 += ObjectiveMX14;
  ObjectiveX15 += ObjectiveMX15;
  ObjectiveX16 += ObjectiveMX16;
  ObjectiveX17 += ObjectiveMX17;
  ObjectiveX18 += ObjectiveMX18;
  ObjectiveX19 += ObjectiveMX19;
  ObjectiveX20 += ObjectiveMX20;
  
  ObjectiveY += ObjectiveMY;
  ObjectiveY2 += ObjectiveMY2;
  ObjectiveY3 += ObjectiveMY3;
  ObjectiveY4 += ObjectiveMY4;
  ObjectiveY5 += ObjectiveMY5;
  ObjectiveY6 += ObjectiveMY6;
  ObjectiveY7 += ObjectiveMY7;
  ObjectiveY8 += ObjectiveMY8;
  ObjectiveY9 += ObjectiveMY9;
  ObjectiveY10 += ObjectiveMY10;
  ObjectiveY11 += ObjectiveMY11;
  ObjectiveY12 += ObjectiveMY12;
  ObjectiveY13 += ObjectiveMY13;
  ObjectiveY14 += ObjectiveMY14;
  ObjectiveY15 += ObjectiveMY15;
  ObjectiveY16 += ObjectiveMY16;
  ObjectiveY17 += ObjectiveMY17;
  ObjectiveY18 += ObjectiveMY18;
  ObjectiveY19 += ObjectiveMY19;
  ObjectiveY20 += ObjectiveMY20;
  rect(enemyx, enemyY, 20, 20);
  rect(enemyx2, enemyY2, 20, 20);
  rect(enemyx3, enemyY3, 20, 20);
  rect(enemyx4, enemyY4, 20, 20);
  rect(enemyx5, enemyY5, 20, 20);
  rect(enemyx6, enemyY6, 20, 20);
  rect(enemyx7, enemyY7, 20, 20);
  rect(enemyx8, enemyY8, 20, 20);
  image(Metaknight,enemyx9, enemyY9);


  if (pmoveX >= 598) //Reversals of Direction
  {
    pDirectionX = -pDirectionX;
  }

  if (pmoveY >= 598)
  {
    pDirectionY= -pDirectionY;
  }

  if (pmoveY <= 2)
  {
    pDirectionY= -pDirectionY;
  }

  if (pmoveX <= 2)
  {
    pDirectionX = -pDirectionX;
  }

  if (pWidth<=2) //size change
  {
    pWidth =40;
  }
  
  //COLLISIONS FOR OBJECTIVES OKAY?!?!?!
  if(ObjectiveX> 590 || ObjectiveX < 20)
  {
    ObjectiveMX = -ObjectiveMX;
  }
  
   if(ObjectiveX2> 590 || ObjectiveX2 < 20)
  {
    ObjectiveMX2 = -ObjectiveMX2;
  }
    
       if(ObjectiveX3> 590 || ObjectiveX3 < 20)
  {
    ObjectiveMX3 = -ObjectiveMX3;
  }
    
       if(ObjectiveX4> 590 || ObjectiveX4 < 20)
  {
    ObjectiveMX4 = -ObjectiveMX4;
  }
    
       if(ObjectiveX5> 590 || ObjectiveX5 < 20)
  {
    ObjectiveMX5 = -ObjectiveMX5;
  }
    
       if(ObjectiveX6> 590 || ObjectiveX6 < 20)
  {
    ObjectiveMX6 = -ObjectiveMX6;
  }
    
       if(ObjectiveX7> 590 || ObjectiveX7 < 20)
  {
    ObjectiveMX7 = -ObjectiveMX7;
  }
    
       if(ObjectiveX8> 590 || ObjectiveX8 < 20)
  {
    ObjectiveMX8 = -ObjectiveMX8;
  }
    
       if(ObjectiveX9> 590 || ObjectiveX9 < 20)
  {
    ObjectiveMX9 = -ObjectiveMX9;
  }
    
       if(ObjectiveX10> 590 || ObjectiveX10 < 20)
  {
    ObjectiveMX10 = -ObjectiveMX10;
  }
    
       if(ObjectiveX11> 590 || ObjectiveX11 < 20)
  {
    ObjectiveMX11 = -ObjectiveMX11;
  }
    
       if(ObjectiveX12> 590 || ObjectiveX12 < 20)
  {
    ObjectiveMX12 = -ObjectiveMX12;
  }
    
       if(ObjectiveX13> 590 || ObjectiveX13 < 20)
  {
    ObjectiveMX13 = -ObjectiveMX13;
  }
    
       if(ObjectiveX14> 590 || ObjectiveX14 < 20)
  {
    ObjectiveMX14 = -ObjectiveMX14;
  }
    
       if(ObjectiveX15> 590 || ObjectiveX15 < 20)
  {
    ObjectiveMX15 = -ObjectiveMX15;
  }
    
       if(ObjectiveX16> 590 || ObjectiveX16 < 20)
  {
    ObjectiveMX16 = -ObjectiveMX16;
  }
    
       if(ObjectiveX17> 590 || ObjectiveX17 < 20)
  {
    ObjectiveMX17 = -ObjectiveMX17;
  }
    
       if(ObjectiveX18> 590 || ObjectiveX18 < 20)
  {
    ObjectiveMX18 = -ObjectiveMX18;
  }
    
       if(ObjectiveX19> 590 || ObjectiveX19 < 20)
  {
    ObjectiveMX19 = -ObjectiveMX19;
  }
    
       if(ObjectiveX20> 590 || ObjectiveX20 < 20)
  {
    ObjectiveMX20 = -ObjectiveMX20;
  }
    
  if(ObjectiveY> 570)
  {
    ObjectiveMY = -ObjectiveMY;
  }
  
   if(ObjectiveY2> 570)
  {
    ObjectiveMY2 = -ObjectiveMY2;
  }
    
       if(ObjectiveY3> 570)
  {
    ObjectiveMY3 = -ObjectiveMY3;
  }
    
       if(ObjectiveY4> 570)
  {
    ObjectiveMY4 = -ObjectiveMY4;
  }
    
       if(ObjectiveY5> 570)
  {
    ObjectiveMY5 = -ObjectiveMY5;
  }
    
       if(ObjectiveY6> 570)
  {
    ObjectiveMY6 = -ObjectiveMY6;
  }
    
       if(ObjectiveY7> 570)
  {
    ObjectiveMY7 = -ObjectiveMY7;
  }
    
       if(ObjectiveY8> 570)
  {
    ObjectiveMY8 = -ObjectiveMY8;
  }
    
       if(ObjectiveY9> 570)
  {
    ObjectiveMY9 = -ObjectiveMY9;
  }
    
       if(ObjectiveY10> 570)
  {
    ObjectiveMY10 = -ObjectiveMY10;
  }
    
       if(ObjectiveY11> 570)
  {
    ObjectiveMY11 = -ObjectiveMY11;
  }
    
       if(ObjectiveY12> 570)
  {
    ObjectiveMY12 = -ObjectiveMY12;
  }
    
       if(ObjectiveY13> 570)
  {
    ObjectiveMY13 = -ObjectiveMY13;
  }
    
       if(ObjectiveY14> 570)
  {
    ObjectiveMY14 = -ObjectiveMY14;
  }
    
       if(ObjectiveY15> 570)
  {
    ObjectiveMY15 = -ObjectiveMY15;
  }
    
       if(ObjectiveY16> 570)
  {
    ObjectiveMY16 = -ObjectiveMY16;
  }
    
       if(ObjectiveY17> 570)
  {
    ObjectiveMY17 = -ObjectiveMY17;
  }
    
       if(ObjectiveY18> 570)
  {
    ObjectiveMY18 = -ObjectiveMY18;
  }
    
       if(ObjectiveY19> 570)
  {
    ObjectiveMY19 = -ObjectiveMY19;
  }
    
       if(ObjectiveY20> 570)
  {
    ObjectiveMY20 = -ObjectiveMY20;
  }    
  
  
      if(ObjectiveY < 20)
  {
    ObjectiveMY = -ObjectiveMY;
  }  
  
      if(ObjectiveY2 < 20)
  {
    ObjectiveMY2 = -ObjectiveMY2;
  }  
  
    if(ObjectiveY3 < 20)
  {
    ObjectiveMY3 = -ObjectiveMY3;
  }  
  
  if(ObjectiveY4 < 20)
  {
    ObjectiveMY4 = -ObjectiveMY4;
  }  
  
  if(ObjectiveY5 < 20)
  {
    ObjectiveMY5 = -ObjectiveMY5;
  } 
 
  if(ObjectiveY6 < 20)
  {
    ObjectiveMY6 = -ObjectiveMY6;
  }  
  
  if(ObjectiveY7 < 20)
  
  {
    ObjectiveMY7 = -ObjectiveMY7;
  }  
  
  if(ObjectiveY8 < 20)
  {
    ObjectiveMY8 = -ObjectiveMY8;
  }  
  
  if(ObjectiveY9 < 20)  
  {
    ObjectiveMY9 = -ObjectiveMY9;
  }  
  
  if(ObjectiveY10 < 20)
  {
    ObjectiveMY10 = -ObjectiveMY10;
  }  
  
  if(ObjectiveY11 < 20)
  {
    ObjectiveMY11 = -ObjectiveMY11;
  }  
  
  if(ObjectiveY12 < 20)
  {
    ObjectiveMY12 = -ObjectiveMY12;
  }  
  
  if(ObjectiveY13 < 20)
  {
    ObjectiveMY13 = -ObjectiveMY13;
  }  
  
  if(ObjectiveY14 < 20)
  {
    ObjectiveMY14 = -ObjectiveMY14;
  }  
  
  if(ObjectiveY15 < 20)
  {
    ObjectiveMY15 = -ObjectiveMY15;
  }  
  
  if(ObjectiveY16 < 20)
  {
    ObjectiveMY16 = -ObjectiveMY16;
  }  
  
  if(ObjectiveY17 < 20)
  {
    ObjectiveMY17 = -ObjectiveMY17;
  }  
  
  if(ObjectiveY18 < 20)
  {
    ObjectiveMY18 = -ObjectiveMY18;
  }  
  
  if(ObjectiveY19 < 20)
  {
    ObjectiveMY19 = -ObjectiveMY19;
  }  
  
  if(ObjectiveY20 < 20)
  {
    ObjectiveMY20 = -ObjectiveMY20;
  }
  
    
  //COLLISIONS OF X FOR ENEMIES ALRIGHT?!
    if(enemyx > 590)
  {
    enemyMoveX = -enemyMoveX;
  }
  
  if(enemyx2 > 590)
  {
    enemyMoveX2 = -enemyMoveX2;
  }
  
    if(enemyx3 > 590)
  {
    enemyMoveX3 = -enemyMoveX3;
  }
  
    if(enemyx4 > 590)
  {
    enemyMoveX4 = -enemyMoveX4;
  }
  
    if(enemyx5 > 590)
  {
    enemyMoveX5 = -enemyMoveX5;
  }
    if(enemyx6 > 590)
  {
    enemyMoveX6 = -enemyMoveX6;
  }
    if(enemyx7 > 590)
  {
    enemyMoveX7 = -enemyMoveX7;
  }
    if(enemyx8 > 590)
  {
    enemyMoveX8 = -enemyMoveX8;
  }
    if(enemyx9 > 590)
  {
    enemyMoveX9 = -enemyMoveX9;
  }
  
      if(enemyx < 10)
  {
    enemyMoveX = -enemyMoveX;
  }
  
  if(enemyx2 < 10)
  {
    enemyMoveX2 = -enemyMoveX2;
  }
  
    if(enemyx3 < 10)
  {
    enemyMoveX3 = -enemyMoveX3;
  }
  
    if(enemyx4 < 10)
  {
    enemyMoveX4 = -enemyMoveX4;
  }
  
    if(enemyx5 < 10)
  {
    enemyMoveX5 = -enemyMoveX5;
  }
    if(enemyx6 < 10)
  {
    enemyMoveX6 = -enemyMoveX6;
  }
    if(enemyx7 < 10)
  {
    enemyMoveX7 = -enemyMoveX7;
  }
    if(enemyx8 < 10)
  {
    enemyMoveX8 = -enemyMoveX8;
  }
    if(enemyx9 < 10)
  {
    enemyMoveX9 = -enemyMoveX9;
  }

//COLLISIONS OF Y for ENEMIES
    if(enemyY < 10)
  {
    enemyMoveY = -enemyMoveY;
  }
  
  if(enemyY2 < 10)
  {
    enemyMoveY2 = -enemyMoveY2;
  }
  
    if(enemyY3 < 10)
  {
    enemyMoveY3 = -enemyMoveY3;
  }
  
    if(enemyY4 < 10)
  {
    enemyMoveY4 = -enemyMoveY4;
  }
  
    if(enemyY5 < 10)
  {
    enemyMoveY5 = -enemyMoveX5;
  }
    if(enemyY6 < 10)
  {
    enemyMoveY6 = -enemyMoveX6;
  }
    if(enemyY7 < 10)
  {
    enemyMoveY7 = -enemyMoveY7;
  }
    if(enemyY8 < 10)
  {
    enemyMoveY8 = -enemyMoveY8;
  }
    if(enemyY9 < 10)
  {
    enemyMoveY9 = -enemyMoveY9;
  }
  
  
   if(enemyY > 580)
  {
    enemyMoveY = -enemyMoveY;
  }
  
  if(enemyY2 > 580)
  {
    enemyMoveY2 = -enemyMoveY2;
  }
  
    if(enemyY3 > 580)
  {
    enemyMoveY3 = -enemyMoveY3;
  }
  
    if(enemyY4 > 580)
  {
    enemyMoveY4 = -enemyMoveY4;
  }
  
    if(enemyY5 > 580)
  {
    enemyMoveY5 = -enemyMoveX5;
  }
    if(enemyY6 > 580)
  {
    enemyMoveY6 = -enemyMoveX6;
  }
    if(enemyY7 > 580)
  {
    enemyMoveY7 = -enemyMoveY7;
  }
    if(enemyY8 > 580)
  {
    enemyMoveY8 = -enemyMoveY8;
  }
    if(enemyY9 > 580)
  {
    enemyMoveY9 = -enemyMoveY9;
  }
  
  //COLLISIONS for FAILURE
  if(dist(pmoveX,pmoveY, enemyx, enemyY) <= 20)
  {
    GOVER++;
    if(GOVER ==2)
    {
    fill(255,0,0);
    rect(0,0,600,600);
    }
  }
    if(dist(pmoveX,pmoveY, enemyx2, enemyY2) <= 20)
  {
    GOVER++;
  }
    if(dist(pmoveX,pmoveY, enemyx3, enemyY3) <= 20)
  {
    GOVER++;
    fill(255,0,0);
    rect(0,0,600,600);
  }
    if(dist(pmoveX,pmoveY, enemyx4, enemyY4) <= 20)
  {
    GOVER++;
    fill(255,0,0);
    rect(0,0,600,600);
  }
    if(dist(pmoveX,pmoveY, enemyx5, enemyY5) <= 20)
  {
    GOVER++;
    fill(255,0,0);
    rect(0,0,600,600);
  }
    if(dist(pmoveX,pmoveY, enemyx6, enemyY6) <= 20)
  {
    GOVER++;
    fill(255,0,0);
    rect(0,0,600,600);
  }
    if(dist(pmoveX,pmoveY, enemyx7, enemyY7) <= 20)
  {
    GOVER++;
    fill(255,0,0);
    rect(0,0,600,600);
  }
    if(dist(pmoveX,pmoveY, enemyx8, enemyY8) <= 20)
  {
    GOVER++;
    fill(255,0,0);
    rect(0,0,600,600);
  }
    if(dist(pmoveX,pmoveY, enemyx9, enemyY9) <= 20)
  {
    GOVER = 100;
    fill(255,0,0);
    rect(0,0,600,600);
  }
  if(GOVER>=100)
  {
        fill(255,0,0);
    rect(0,0,600,600);
  }
  
  //OBJECTIVE BENEFITS
      if(dist(pmoveX,pmoveY, ObjectiveX, ObjectiveY) <= 20)
  {
    ObjectiveX = pmoveX;
    ObjectiveY = pmoveY;
    Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
        if(dist(pmoveX,pmoveY, ObjectiveX2, ObjectiveY2) <= 20)
  {
    ObjectiveX2 = pmoveX;
    ObjectiveY2 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX3, ObjectiveY3) <= 20)
  {
    ObjectiveX3 = pmoveX;
    ObjectiveY3 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX4, ObjectiveY4) <= 20)
  {
    ObjectiveX4 = pmoveX;
    ObjectiveY4 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX5, ObjectiveY5) <= 20)
  {
    ObjectiveX5 = pmoveX;
    ObjectiveY5 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX6, ObjectiveY6) <= 20)
  {
    ObjectiveX6 = pmoveX;
    ObjectiveY6 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX7, ObjectiveY7) <= 20)
  {
    ObjectiveX7 = pmoveX;
    ObjectiveY7 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX8, ObjectiveY8) <= 20)
  {
    ObjectiveX8 = pmoveX;
    ObjectiveY8 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX9, ObjectiveY9) <= 20)
  {
    ObjectiveX9 = pmoveX;
    ObjectiveY9 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX10, ObjectiveY10) <= 20)
  {
    ObjectiveX10 = pmoveX;
    ObjectiveY10 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX11, ObjectiveY11) <= 20)
  {
    ObjectiveX11 = pmoveX;
    ObjectiveY11 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX12, ObjectiveY12) <= 20)
  {
    ObjectiveX12 = pmoveX;
    ObjectiveY12 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX13, ObjectiveY13) <= 20)
  {
    ObjectiveX13 = pmoveX;
    ObjectiveY13 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX14, ObjectiveY14) <= 20)
  {
    ObjectiveX14 = pmoveX;
    ObjectiveY14 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX15, ObjectiveY15) <= 20)
  {
    ObjectiveX15 = pmoveX;
    ObjectiveY15 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX16, ObjectiveY16) <= 20)
  {
    ObjectiveX16 = pmoveX;
    ObjectiveY16 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX17, ObjectiveY17) <= 20)
  {
    ObjectiveX17 = pmoveX;
    ObjectiveY17 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX18, ObjectiveY18) <= 20)
  {
    ObjectiveX18 = pmoveX;
    ObjectiveY18 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX19, ObjectiveY19) <= 20)
  {
    ObjectiveX19 = pmoveX;
    ObjectiveY19 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    score+=10;
    }
        Tscore = false;
  }
  
          if(dist(pmoveX,pmoveY, ObjectiveX20, ObjectiveY20) <= 20)
  {
    ObjectiveX20 = pmoveX;
    ObjectiveY20 = pmoveY;
        Tscore =true;
    if(Tscore = true)
    {
    fill(0,255,0);
    rect(0,0,600,600);
    }
        Tscore = false;
  }
  
  
  
  if (pWidth>=50) //expression change
  {
    
    fill(255, 80, 140);
    ellipse(pmoveX, pmoveY, pWidth, pHeight);
    fill(0);
    ellipse(pmoveX-7, pmoveY, 10, 2);
    ellipse(pmoveX+7, pmoveY, 10, 2);
    fill(0);
    ellipse(pmoveX-1, pmoveY+12, 3, 13);
  }

  if (pWidth<=35) //expression change
  {
    fill(0, 40);
    rect(0, 0, 600, 600);
    fill(255, 80, 140);
    ellipse(pmoveX, pmoveY, pWidth, pHeight);
    fill(0);
    ellipse(pmoveX-5, pmoveY, 2, 10);
    ellipse(pmoveX+5, pmoveY, 2, 10); //width height
    fill(0);
    ellipse(pmoveX, pmoveY+8, 12, 2);
  }

  if (pWidth>=200)
  {
    pHeight =40;
    pWidth =40;
  }

  if (pHeight<=2)
  {
    pHeight =40;
    pWidth =40;
  }

  if (pHeight>=200)
  {
    pHeight =40;
    pWidth =40;
  }
  //OFF SCREENS

  //Relaxed face
  if (pDirectionX == 0 && pDirectionY == 0)
  {
    image(img, pmoveX - 21, pmoveY - 20, pWidth, pHeight);
  }
}
void keyPressed()
{

  if (keyCode== '=')
  {
    pWidth += 4;
    pHeight += 4;
  }

  if (keyCode =='-')
  {
    pWidth += -4;
    pHeight += -4;
  }

  if (keyCode == RIGHT)
  {
    pDirectionX = 4;
    pDirectionY = 0;
  }
  if (keyCode == LEFT)
  {
    pDirectionX = -4;
    pDirectionY = 0;
  }

  if (keyCode == DOWN)
  {
    pDirectionX = 0;
    pDirectionY = 4;
  }
  if (keyCode == UP)
  {
    pDirectionX = 0;
    pDirectionY = -4;
  }
  if (key == 'r')
  {
    pDirectionX = 0;
    pDirectionY = 0;
  }
}

void keyReleased()
{

  if (keyCode== '=')
  {
    pWidth += 0;
    pHeight += 0;
  }

  if (keyCode== '-')
  {
    pWidth += 0;
    pHeight += 0;
  }
}




//



