
/*
Autor : Thomas Ramirez
Mail : rami.programmer[at]gmail.com
Licence : CC BY-NC-SA 2.0 (see informations on http://creativecommons.org/licenses/by-nc-sa/2.0/)
Date of publication : 09/09/2011 (DD/MM/YYYY)
Description : Your computer draws a long curve on your screen randomly
*/

ArrayList positions;
int windowMargin=50;
int pointsMax=15;

void setup()
{
  size(600,600);
  smooth();
  frameRate(15);
  
  positions=new ArrayList();
}

void draw()
{
  background(0);
  
  PVector newPosition=new PVector(random(windowMargin,width-windowMargin),random(windowMargin,height-windowMargin));
  positions.add(newPosition);
  
  if(positions.size()>=4)
  {
    // if we have too much points (more than "pointsMax"), we have to deleting the olders :
    for(int i=0;i<positions.size()-pointsMax;i++)
      positions.remove(i);
    
    // showing lines :
    for(int i=3;i<positions.size();i++)
    {
      stroke(i*((float)255/(positions.size()-1)));noFill();
      strokeWeight(i);
      
      PVector dataM3=(PVector)positions.get(i-3);
      PVector dataM2=(PVector)positions.get(i-2);
      PVector dataM1=(PVector)positions.get(i-1);
      PVector data=(PVector)positions.get(i);
      
      curve(dataM3.x,dataM3.y,dataM2.x,dataM2.y,dataM1.x,dataM1.y,data.x,data.y);
    }
  }
}                               
