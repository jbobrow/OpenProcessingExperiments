

int lex=400; 
int ley=400; 

int distancesec=150;
int distancemin=100;
int distancehr=50; 


int xsec, ysec;
int xmin,ymin;
int xhr,yhr;
int xst,yst;

int sec;
int mini;
int hr;
int twentyfour; 



void setup()
{
  size(400,400);
  smooth();

  xst=lex/2;
  yst=(ley/2);

  sec=second();
  mini=minute();
  hr=hour();

  if (hr>11)
  {
    hr=hr-12;
  }
  thehand(); 
} 

void draw()

{

  background(0);


  fill(190);
  strokeWeight(5);
  stroke(0,0,0);
  ellipse(xst,yst,(distancesec+10)*2,(distancesec+10)*2);


  strokeWeight(4);

  stroke(70,0,180);

  line(xst,yst,xmin,ymin);

  strokeWeight(6);

  stroke(0,140,140);

  line(xst,yst,xhr,yhr);

  strokeWeight(2);

  stroke(0,0,0);

  line(xst,yst,xsec,ysec);

  // a centre dot

  fill(0);

  noStroke();

  ellipse(xst,yst,10,10);

  sec++;

  if (sec==60)

  {

    sec=0;
    mini++;
    if (mini==60)
    {
      mini=0;
      hr++;
      if (hr==12)
      {
        hr=0; 
      }  
    }
  }

  thehand();
  delay(1000);  
}  

void thehand()
{

   float xtemp, ytemp;
   int anglesec,anglemin,anglehr;

   anglesec=(sec*6)+270;
   anglemin=(mini*6)+270;
   anglehr=(hr*30)+270;


   xtemp=distancesec*cos(radians(anglesec));
   ytemp=distancesec*sin(radians(anglesec));

   xsec=(int)(xst+xtemp);
   ysec=(int)(yst+ytemp);

   xtemp=distancemin*cos(radians(anglemin));
   ytemp=distancemin*sin(radians(anglemin));

   xmin=(int)(xst+xtemp);
   ymin=(int)(yst+ytemp);

   xtemp=distancehr*cos(radians(anglehr));
   ytemp=distancehr*sin(radians(anglehr));

   xhr=(int)(xst+xtemp);
   yhr=(int)(yst+ytemp);   

}       


