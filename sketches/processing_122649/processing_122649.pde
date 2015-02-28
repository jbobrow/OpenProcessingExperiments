
void setup()
{
size(500,500);
}

void draw()
{
  float x=map(hour(),0,24,0,PI);
  
  float Hintergrund=map (sin(x),0,1,0,255);
  background(Hintergrund);
  
  float sonnenPosX=map(hour(),0,24,0,500);
  float sonnenPosY=map(sin(x),0,+1,520,150);
  fill(244,252,8);
  ellipse(sonnenPosX,sonnenPosY,40,40);
   
  float autoPos=map(minute(),0,60,0,600);
  fill(0);
  ellipse(autoPos-80,450,20,20);
  ellipse(autoPos-20,450,20,20);
  rect(autoPos-30,400,30,20);
  rect(autoPos-100,380,70,40);


}
