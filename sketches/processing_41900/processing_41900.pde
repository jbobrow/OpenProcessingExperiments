
int n = 0;
int sInitial = second();
int startingSeconds = second();
float shiftValue = 0;
int firstSecond = 0;
float mX = 0;
float mY = 0;
float sX = 0;
float sY = 0;
float hX = 0;
float hY = 0;
int hHandLen = 60;
int mHandLen = 90;
int sHandLen = 70;

void setup()
{
  size(500,500);
   background(255);
  
}

void draw()
{

  PFont myFont;
  myFont = loadFont("ACaslonPro-Bold-14.vlw");
  textAlign(CENTER);
 int s = second();
 if (frameCount < 100 && ((s - sInitial) == 1 || (s - sInitial) == 59))
 {
  firstSecond = millis();
 }
 if(firstSecond > 0)
 {
  firstSecond = -1;
  startingSeconds = ((startingSeconds*1000) - firstSecond)/1000;
 }
 int m = minute();
 int h = hour() % 12;
 float milli = (millis() + startingSeconds*1000) % 60000;
 smooth();
// background(255);
 
 fill(0);
 //text(((h%12) + " : " + m + " : " + s),50,50);
 //text(milli,80,100);

   if(milli < 1000)
   {
   fill(255);
   rect(0,0,width,height);
   }
 
 pushMatrix();
   translate(250,250);
   fill(0);
   ellipse(0,0,16,16);
   rotateHours(1);
   rect(-5,-5,10,hHandLen);
   ellipse(0,hHandLen-14,20,20);
   fill(255);
   pushMatrix();
     translate(0,72);
     rotateHours(-1);
     //text(h,-8,0);
     
   popMatrix(); 
 pushMatrix();
   translate(0,hHandLen-14);
   fill(0);
   rotateHours(-1);
   rotateMinutes(1);
   rect(-3,-3,6,mHandLen);
   ellipse(0,mHandLen-12,19,19);
   fill(255);
   pushMatrix();
     translate(0,106);
     rotateMinutes(-1);
     //text(m,0,0);
   popMatrix();
 pushMatrix();
   translate(0,mHandLen-12);
   fill(0);
   rotateMinutes(-1);
   rotateSeconds(1,startingSeconds);
   rect(-2,-2,4,sHandLen);
   ellipse(0,sHandLen-10,17,17);
   fill(255);
   pushMatrix();
     translate(0,76);
     //rotateSeconds(-1,startingSeconds);
     //text(s,-2,0);
   
   //*
   pushMatrix();
     //rotateMinutes(-1);
     //rotateSeconds(-1,startingSeconds);
     //rotateHours(-1);
     sX = 0;//-5*sin(((2 * PI * (milli/60000.0)) - PI));
     sY = 0;//-5*cos(((2 * PI * (milli/60000.0)) - PI));
     translate(sX,sY);
     fill(255);
     textFont(myFont, 14);
     sX = 0;//-5*sin(((2 * PI * (milli/60000.0)) - PI));
     sY = 0;//-5*cos(((2 * PI * (milli/60000.0)) - PI));
     //text(s,0,0);
   popMatrix();
   
   popMatrix();
   
   pushMatrix();
     //rotateMinutes(-1);
     //rotateSeconds(-1,startingSeconds);
     translate(0,0);
     
     //rotateHours(-1);
     
     fill(255);
     textFont(myFont, 18);
     
     //text(m,0,7);
   popMatrix();
   //*/
   
 popMatrix();
 
 pushMatrix();
     //rotateMinutes(-1); 
     translate(0,0);
     fill(255);
     textFont(myFont, 22);
     //text(h,0,0);
 popMatrix();
 
 popMatrix();
 
 popMatrix();
 
 if(milli % 1000 < 200)
 {
   fill(255,255,255,10);
   rect(0,0,width,height);
 }


}


void rotateSeconds(int sign, int startingSeconds)
{
  float milli = (millis() + startingSeconds*1000)%60000;
  int s = second();
  // rotate(sign*(2*PI*((s - 15 + (n/24.0))/(60.0)) - PI));
  //rotate(sign*(2*PI*((milli + (n/24.0))/(1000.0)) - PI));
  rotate(sign*((2 * PI * (milli/60000.0)) - PI));
}

void rotateMinutes(int sign)
{
  int s = second();
  int m = minute();
  rotate(sign*(2*PI*((((m)*60)+s)/3600.0) - PI));
}

void rotateHours(int sign)
{
  int s = second();
  int m = minute();
  int h = hour() % 12;
  //rotate(sign*(2*PI*(h)/12 - PI));
  rotate(sign*(2*PI*( h + (m/60.0) + (s/3600.0))/(12) - PI));
  //rotate(sign*(2*PI*((((m*60)+(h*60)+s)/(60*60.0*12.0)) - PI)));
}

