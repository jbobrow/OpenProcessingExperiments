
int youX=350;
int youY=350;
int partX=300;
int partY=300;
int himX=200;
int himY=200;
int left = 0;
int right = 0;
int up = 0;
int down = 0;
int center =0;
int timer = 1150;

void setup()
{
  size(600, 600);
  noStroke();
  frameRate(60);
}

void draw()
{
  if (timer<1200)
  {
  background(0);
    //player rect
    fill(255, 0, 0);
    rect(youX, youY, 30, 30);
    //your crush's shyness
    fill(255, 0, 0);
    if (abs(partY-himY)<100)
    {
      fill(255, 0, 0, abs(partX-himX));
    }
    if (abs(partX-himX)<100)
    {
      fill(255, 0, 0, abs(partY-himY));
    }
    //your crush
    rect(partX, partY, 30, 30);
    fill(0, 0, 255);
    rect(himX, himY, 30, 30);
    //checks collision for left of box
    if (youX>himX-30&&youX<himX&&((youY+15>himY+2&&youY+15<himY+27)||(youY>himY+2&&youY<himY+27)||(youY+30>himY+2&&youY+30<himY+27)))
    {
      himX=youX+30;
    }
    //checks the collision for the right of box
    if (youX-30<himX&&youX-30>himX-30&&((youY+15>himY+2&&youY+15<himY+27)||(youY>himY+2&&youY<himY+27)||(youY+30>himY+2&&youY+30<himY+27)))
    {
      himX=youX-31;
    }

    if (youY+30>himY&&youY+30<himY+30&&((youX<himX&&youX>himX-28)||(youX-15<himX&&youX-15>himX-28)||youX-28<himX&&youX-28>himX-28))
    {
      himY=youY+30;
    }
    if (youY<himY+30&&youY>himY&&((youX<himX&&youX>himX-28)||(youX-15<himX&&youX-15>himX-28)||youX-28<himX&&youX-28>himX-28))
    {
      himY=youY-30;
    }


    //player control
    if (key=='s')
    {
      youY+=3;
    }
    if (key=='w')
    {
      youY-=3;
    }
    if (key=='a')
    {
      youX-=3;
    }
    if (key=='d')
    {
      youX+=3;
    }
    if (youX<0)
    {
      youX=0;
    }
    if (youX>570)
    {
      youX=570;
    }
    if (youY<0)
    {
      youY=0;
    }
    if (youY>570)
    {
      youY=570;
    }

    if (himX<partX)
    {
      himX++;
    }
    if (himX>partX)
    {
      himX--;
    }
    if (himY>partY)
    {
      himY--;
    }
    if (himY<partY)
    {
      himY++;
    }

    timer++;
  }
}

void keyReleased()
{
  //resets keys so that it stops when key is released
  key=' ';
}


