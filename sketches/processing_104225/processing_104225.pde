
void setup()
{
background(0);
size(1200,400);
}
void draw()
{
background(0);
  int count=0;
  translate(width/2,0);
  for (int i=4;i<30;i++)
    {
      count=i*i/44;
      for (int j=0;j<=count;j++)
          {  
            fill(255,random(100,200));
            //ellipse(j*30,i*10+10,5,5);
            //ellipse(-j*30,i*10+10,5,5);
            //fill(ms.get(0),ms.get(1),ms.get(2),ms.get(3)+random(0,75));
            ellipse(j*30+15,i*10,5,5);
            ellipse(-j*30-15,i*10,5,5);
          }
    }
 }
