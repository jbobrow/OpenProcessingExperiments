
int speed=10;

void setup() {
  size(600, 600);
  background(0);
}

void draw()
{
   
  speed+=5;
  
  for (int i=1; i<25;i++)
  {
    drawSnow(30+30*i+speed, 30+30*i,5+i,5+i,255-i*10,13+i*5,100+i*3);
//drawRect(i*0.3);
    for (int o=1; o<25;o++)
    {
      drawSnow(30+30*o, 30+30*o-speed,5+o,5+o,255-o*34,12+i*10,11);
      
    }
    
   
    }
    
  }
  


void drawRect(float trans)
{  
  fill(0,trans);
  rect(0,0,width,height);
}
void drawSnow(int snowX, int snowY, int snowW, int snowH, int colorA, int colorB,int colorC)
{

  fill(colorA,colorB,colorC);
  noStroke();
  ellipse(snowX, snowY, snowW, snowH);
} 



