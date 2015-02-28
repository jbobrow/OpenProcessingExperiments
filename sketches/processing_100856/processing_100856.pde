
int mousexpoint;
int mouseypoint;
float randompointx, randompointy;
float totalclicks;
int newpoint=0;
float time=0, good=0, bad=0;
void setup()
{
  size(800,800);
  background(255);
  frameRate(100);
  randompointx=500;
  randompointy=500;
}

void draw()
{
  time=time+0.01;
  background(255);
  fill(0);
  if(time<=1.0)
  {
    fill(196,0,0);
    textSize(150);
    text("3",350,350);
  }
  else
  {
    if(time<=2.0)
    {
      fill(240,240,0);
       text("2",350,350);
     }
     else
     {
       if(time<=3.0)
       {
         fill(0,240,139);
          text("1",350,350);
       }
       else
       {
         if(time<=4.0)
         {
             fill(0,240,0);
             text("GO!",350,350);
         }
       }
     } 
    }
  
  
  
  if(time>=4.0){
  background(255);
  fill(0);
  mousexpoint=mouseX;
  mouseypoint=mouseY;
  textSize(20);
  text("Time = "+time,10,755);
  text("Good Clicks = "+good,10,775);
  text("You Suck = "+bad,10,795);
  text("Clicks per Second = "+good/time,250,775);
  text("Total Clicks = "+totalclicks,250,755);
  fill(0);
  rect(randompointx,randompointy,50,50);
  fill(255);
  rect(randompointx+12.5,randompointy+12.5,25,25);
  
  if(newpoint == 1)
  {
    randompointx=0;
    randompointy=0;
    randompointx=random(750);
    randompointy=random(750);
    newpoint=0;
  }
  }
}
void mousePressed()
{
  totalclicks=totalclicks+1;
  if(mousexpoint<=randompointx+35)
  {
    if(mouseypoint<=randompointy+35)
    {
      if(mousexpoint>=randompointx+12.5)
      {
        if(mouseypoint>=randompointy+12.5)
        {
          newpoint=1;
          good=good+1;
        }
        //
        else
        {
          bad=bad+1;
        }
        //
      }
      //
      else
      {
        bad=bad+1;
      }
      //
    }
    //
    else
    {
      bad=bad+1;
    }
    //
  }
  //
  else
  {
    bad=bad+1;
  }
  //
}

