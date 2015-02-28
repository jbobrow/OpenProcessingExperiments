

//First things first create 3 types
//PREDATOR
//ATTRACTION
//NORMAL PLAYER
float a = 30;
float q= 0; //Time Attraction stays with ghost
float neutralX = 0;
float neutralY = 0;
float AttractionX = 0;
float AttractionY = 0;
float PredatorX = 0;
float PredatorY = 0; //These are variables that control x and y coordiantes

float neutralMoveX;
float neutralMoveY;
float PredatorMoveX;
float PredatorMoveY;
float AttractionMoveX;
float AttractionMoveY; // X and Y Coordinates to move objects

float maxSpeed = 3; //highest speed objects move
float radius1 = 25;
float Pradius1 = 25; //player Radius

boolean GrossedOut = false; // If this is false, makes player grossed out

void setup()
{
  size(400,400);
  background(0);
  
  neutralMoveX = random(-maxSpeed, maxSpeed);
   neutralMoveY = random(-maxSpeed, maxSpeed);
    PredatorMoveX = random(-maxSpeed, maxSpeed);
     PredatorMoveY = random(-maxSpeed, maxSpeed);
     AttractionMoveX = random(-maxSpeed, maxSpeed);
     AttractionMoveY = random(-maxSpeed, maxSpeed); //These set speed for objects
     
 neutralX = random(Pradius1*3, width-Pradius1*3); //width = x position of entire program screen
  neutralY = random(Pradius1*3,height-Pradius1*3); //height = y position of entire program screen
   AttractionX = random(width-radius1);
    AttractionY = random(width-radius1);
     PredatorX = random(width-radius1);
      PredatorY = random(width-radius1);
      
      smooth();
      noStroke();
}

void draw()
{     
  //PREDATOR ELLIPSE
     PredatorX += PredatorMoveX;
   PredatorY += PredatorMoveY;
      if(PredatorX >width-radius1 || PredatorX< 10) //These 2 "if" statements make syure they stay on screen
   {
     PredatorMoveX = -PredatorMoveX;
   }
   
      if(PredatorY >width-radius1 || PredatorY< radius1)
   {
     PredatorMoveY = -PredatorMoveY;
   }
   fill(0,255,0);
   ellipse(PredatorX, PredatorY, radius1,radius1);
   
      //Attraction ELLIPSE
  
  AttractionX += AttractionMoveX;
   AttractionY += AttractionMoveY;
   
   if(AttractionX >width-radius1 || AttractionX< radius1) //These 2 "if" statements make syure they stay on screen
   {
     AttractionMoveX = -AttractionMoveX;
   }
   
      if(AttractionY >width-radius1 || AttractionY< radius1)
   {
     AttractionMoveY = -AttractionMoveY;
   }
     a= dist(AttractionX, AttractionY, neutralX, neutralY);
     if(a< 50)
     {
       AttractionX = neutralX;
       AttractionY = neutralY;
       for(float q=0; q<2000; q+=500)
       {
         if( q== 2000)
         {
              AttractionMoveX+=200;
              AttractionMoveY+=200;
         }
       }
     }
      fill(250,180,0);
   ellipse(AttractionX, AttractionY, radius1*2, radius1*2);
   
    //NEUTRAL ELLIPSE PLAYER ACTIONS
  
  neutralX += neutralMoveX;
   neutralY += neutralMoveY;
   
   if(neutralX >width-radius1 || neutralX< radius1) //These 2 "if" statements make syure they stay on screen
   {
     neutralMoveX = -neutralMoveX;
   }
   
      if(neutralY >width-radius1 || neutralY< radius1)
   {
     neutralMoveY = -neutralMoveY;
   }
   
   if(dist(PredatorX, PredatorY, neutralX, neutralY)< Pradius1*5)
   {
     if(GrossedOut == false)
     {
       neutralMoveX =-neutralMoveX;
       neutralMoveY = -neutralMoveY;
       GrossedOut= true;
     }
   }
   else 
   {
     GrossedOut=false;
   }
   if(GrossedOut==true)
   {
     fill(255,255,0);

   }
   else
   {
      fill(255);
   }
    if(dist(AttractionX, AttractionY, neutralX, neutralY)< radius1*2)
   {
     fill(220,50,200);
   
   }
   ellipse(neutralX, neutralY, Pradius1*3, Pradius1*3);
   fill(125);
   ellipse(neutralX+40, neutralY-5, 20,20);//arms
   ellipse(neutralX-40, neutralY-5, 20,20);
   fill(0);
   ellipse(neutralX-10, neutralY,10,30); //eyes
   ellipse(neutralX+10, neutralY,10,30);
   fill(255);
    ellipse(neutralX-12, neutralY-10,10,10); //eyes glares
   ellipse(neutralX+9, neutralY-10,10,10);
   
   
   fill(0,20);
   rect(0,0,width,height);
}

