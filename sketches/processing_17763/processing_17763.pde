
// Script by bejoscha, June 2010
 
BirdObject Birdy;
int maxBirds=150;
ArrayList Birds;
boolean drawSight=false;
boolean lineMode=true;
boolean fade=true;
float count=0;
float update=5;
 
void setup()
{
  size(800,600,JAVA2D);
  background(0);
  colorMode(RGB);
  smooth();
  Birds = new ArrayList();
  for (int i=0;i<maxBirds;i++)
    {
       Birdy = new BirdObject(random(width-30)+15,random(height-30)+15,200,random(4)+0.2,random(TWO_PI));
       Birds.add(Birdy);
    }
   
  fill(200);
  noFill();
}
 
void draw()
{
  count++;
  if (!lineMode) background(0);
  else if ((count%update)==0)
    {
      if (fade)
      {
        noStroke();
        fill(color(0,0,0,20));
        rect(0,0,width,height);
      }
      noFill();
      stroke(255);
      strokeWeight(2);
    }
  if ((count%update)==0)
    {
    for (int i=0;i<maxBirds;i++)
      {
         Birdy = ( BirdObject ) Birds.get(i);
          Birdy.CheckGroup(Birds);
       }
    for (int i=0;i<maxBirds;i++)
      {
         Birdy = ( BirdObject ) Birds.get(i);
         Birdy.Adjust();
       }
    }
  if (lineMode) colorMode(HSB,TWO_PI,3,1);
  for (int i=0;i<maxBirds;i++)
    {
       Birdy = ( BirdObject ) Birds.get(i);
       Birdy.Move();
       if (!lineMode)
         {
           Birdy.Draw(true,drawSight);
         }
       else
         {
           stroke(color(Birdy.dirAngle,Birdy.speed,1));
           point(Birdy.pos.x,Birdy.pos.y);
         }
     }
      
    if (keyPressed)  Birdy.Draw(true,true);
 }
 
 
 
void keyPressed()
  {
    if (key==' ') setup();
    if (key=='f') fade=!fade;
    if (key=='l')
     {
       lineMode=!lineMode;
       if (!lineMode) colorMode(RGB,255,255,255);
       else background(0);
     }
    if (key=='q')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.offsetAngle = constrain(Birdy.offsetAngle+radians(1),-PI,PI);
      }
    }
    if (key=='i')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.dampDir *= -1;
      }
    }
    if (key=='w')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.offsetAngle = constrain(Birdy.offsetAngle-radians(1),-PI,PI);
      }
    }
    if (key=='1')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.adjustmentMode = 1;
      }
    }
    if (key=='2')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.adjustmentMode = 2;
      }
    }
    if (key=='3')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.adjustmentMode = 3;
      }
    }
    if (key=='b')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.bounce = !Birdy.bounce;
      }
    }
    if (key=='q')
    {
      for (int i=0;i<maxBirds;i++)
      {
        Birdy = ( BirdObject ) Birds.get(i);
        Birdy.offsetAngle = constrain(Birdy.offsetAngle+radians(1),-PI,PI);
      }
    }
    if (key=='s') drawSight=!drawSight;
    if (key==CODED)
    {
      if (keyCode==LEFT)
        {
          for (int i=0;i<maxBirds;i++)
          {
            Birdy = ( BirdObject ) Birds.get(i);
            Birdy.viewAngle = constrain(Birdy.viewAngle-1,1,180);
          }
        }
      if (keyCode==RIGHT)
        {
          for (int i=0;i<maxBirds;i++)
          {
            Birdy = ( BirdObject ) Birds.get(i);
            Birdy.viewAngle = constrain(Birdy.viewAngle+1,1,180);
          }
        }
      if (keyCode==UP)
        {
          for (int i=0;i<maxBirds;i++)
          {
            Birdy = ( BirdObject ) Birds.get(i);
            Birdy.viewDistance = constrain(Birdy.viewDistance+1,0,1000);
          }
        }
      if (keyCode==DOWN)
        {
          for (int i=0;i<maxBirds;i++)
          {
            Birdy = ( BirdObject ) Birds.get(i);
            Birdy.viewDistance = constrain(Birdy.viewDistance-1,0,1000);
          }
        }
         
    }
  }

