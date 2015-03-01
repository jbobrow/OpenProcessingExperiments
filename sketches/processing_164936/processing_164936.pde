
//DDDDDD NOT GOOD BUT AVAILABLE
float ballx1=300,bally1=500, ballx4=100,bally4=700,ballx2=350,bally2=225,ballx3=200,bally3=150;
float vectorx1=1,vectory1=1,vectorx2=1,vectory2=1;
boolean crash = false;
boolean success = false;
boolean collide = false;
float angle = -6;
float cos = 0;
float sin = 0;

void setup()
{
size(600,800);
frameRate(500);
noStroke();
}

void keyPressed()
 {
 if(key == '1')
 {
   angle = 2;
   crash = true;
 }
 if(key == '2')
 {
   angle = 0;
   crash = true;
 }
 if(key == '3')
 {
   angle = -2;
   crash = true;
 }
 if(key == '4')
 {
   angle = -4;
   crash = true;
 }
 if(key == '5')
 {
   angle = -6;
   crash = true;
 }
 if(key == '6')
 {
   angle = -8;
   crash = true;
 }
 if(key == '7')
 {
   angle = -10;
   crash = true;
 }
 if(key == '8')
 {
   angle = -12;
   crash = true;
 }
 if(key == '9')
 {
   angle = -14;
   crash = true;
 }
 if(key == '0')
 {//reset
  float ballx1=300,bally1=500, ballx4=100,bally4=700,ballx2=350,bally2=225,ballx3=200,bally3=150;
float vetorx1=1,vectory1=1,vectorx2=1,vectory2=1;
boolean crash = false;
boolean collide = false;
boolean success = false;
 }
 
 }


void draw()
{
background(0,150,0);
fill(255,255,0);
ellipse(ballx4,bally4,30,30);

 fill(255);
  ellipse(ballx1,bally1,30,30);
  fill(255,0,0);
  ellipse(ballx2,bally2,30,30); 
  fill(255,0,0);
  ellipse(ballx3,bally3,30,30); 
  fill(0);
  
 if(crash == false)
 {
  text("press 1~9 to shoot the red ball.",50,50 ); 
 }
 
 if(crash == true)
 {
   vectorx1=-sin(radians(angle));
   vectory1=-cos(radians(angle));
   ballx1=ballx1+vectorx1*1;
   bally1=bally1+vectory1*1;
   
   
 
 }
 if ( ballx1*ballx1-2*ballx1*ballx2+ballx2*ballx2+bally1*bally1-2*bally1*bally2+bally2*bally2 <900)
   {
     crash = false;
     collide = true;
     vectorx1=-sin(radians(angle));
     vectory1=cos(radians(angle));
     vectorx2=(ballx2-ballx1)/30;
     vectory2=(bally1-bally2)/30;
     cos=vectorx1*vectorx2+vectory1*vectory2;
     sin=sqrt(1-cos*cos);
     
     ballx2=370;
     bally2=200;
   }
   
 if(collide == true)
{
      
     vectorx1=-sin;
     vectory1=-cos;
       ballx1=ballx1+vectorx1*1;
   bally1=bally1+vectory1*1;
}  



 
   if ( ballx1*ballx1-2*ballx1*ballx3+ballx3*ballx3+bally1*bally1-2*bally1*bally3+bally3*bally3 <900)
   {
     vectorx1=0;
     vectory1=0;
     success = true;
     crash = false;
     ballx3=150;
     bally3=100;
     
   }
 
   if (success==true)
   {
     crash=true;
   text("success!",50,50);
   }
}

