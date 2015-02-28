
int flowerNum = 5;
float [] flower = new float [flowerNum];
float [] flowerX = new float [flowerNum];
float [] flowerY = new float [flowerNum];
float [] xPos = new float [flowerNum];
float [] zPos= new float [flowerNum];
int [] ang = new int [flowerNum];

void setup()
{
  size(500, 500);

  for (int i=0;i<flowerNum;i++)
  {
    flower[i]=0;
    // 꽃들의 값 랜덤으로 초기화
    flowerX[i]=random(width);
    flowerY[i]=random(height);

    // 팝콘 터지는 위치가 꽃들의 위치로 초기화
    xPos[i] = flowerX[i];
    zPos[i] = flowerX[i];

    ang[i]=250;
  }
}

void draw()
{
  background(0);

  for (int i=0;i<flowerNum;i++)
  {
    if (flower[i]==0)
    {
      fill(255);

      roseDraw(flowerX[i], flowerY[i], 150); 

      if (mousePressed)
      {
        if (dist(flowerX[i], flowerY[i], mouseX, mouseY)<150/2)
        {
          flower[i]=1;
        }
      }
    } 
    if (flower[i]==1)
    {
      xPos[i]+=2;
      zPos[i]-=2;

      ang[i]+=2;

      roseDraw(xPos[i], flowerY[i]+sin(radians(ang[i]*0.8))*110, 20);
      roseDraw(xPos[i], flowerY[i]+sin(radians(ang[i]*0.8))*200, 20);
      roseDraw(zPos[i], flowerY[i]+sin(radians(ang[i]*0.8))*110, 20);
      roseDraw(zPos[i], flowerY[i]+sin(radians(ang[i]*0.8))*200, 20);
    }
    if (xPos[i]>flowerX[i]+150 || xPos[i]<flowerY[i]-150)
    {
      xPos[i]*=50;
      zPos[i]*=-50;

      ang[i]*=50;
    }
  }
}


