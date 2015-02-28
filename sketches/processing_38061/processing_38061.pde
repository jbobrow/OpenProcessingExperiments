
float xPos= 50;
float yPos= 50;
float shiftVal = 0;
int topColor = 0;
int i = 1;
void setup()
{
  size(500,500);
  background(255);
  
}

void draw()
{
  strokeWeight(1);
  for(int yPos=-3; yPos<504; yPos+=8)
  {
    for(int xPos=0; (xPos-(yPos*1.7))<500; xPos +=1)
    {
     stroke((84+((yPos)*20)%(255/2)),132+(yPos%(255/2)),232+(yPos%(255/2)));
     topColor = int(random(3));

        if (topColor == 0)
        {
          stroke(84,132,232);
        }
        else
         {
                if (topColor == 1)
     {
       stroke(34,160,26);
     }
     else
     {
       stroke(203,51,176);
     }
         }

     point(xPos-1.7*yPos,yPos+5*sin(PI*xPos/100));
     stroke(84,132,232); //203,51,176)
     point(xPos-1.7*yPos-1,yPos+5*sin(PI*xPos/100)-1);
    }
  }
  /*
  for(int xPos=1; xPos<(width+50); xPos+=100)
  {
  if ((xPos+shiftVal)%50 == 0)
  {
   i = -1;
  }
  else
  {
   i = 1;
  }
  arc(xPos, yPos, 100, 10, i*PI, (i*PI)+PI);
  }
  */
}

