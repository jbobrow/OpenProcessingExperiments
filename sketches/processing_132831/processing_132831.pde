
float timer = 0.0;
float backTimer= 0.0;
PImage[] photos= new PImage[16];
int backgroundIndex= 0;
PImage back;

void setup()
{
  size(500,500);
  photos[0] = requestImage("7.png");
  photos[1] = requestImage("8.png");
  photos[2] = requestImage("9.png");
  photos[3] = requestImage("10.png");
  photos[4] = requestImage("11.png");
  photos[5] = requestImage("12.png");
  photos[6] = requestImage("13.png");
  photos[7] = requestImage("14.png");
  photos[8] = requestImage("15.png");
  photos[9] = requestImage("16.png");
  photos[10] = requestImage("1.png");
  photos[11] = requestImage("2.png");
  photos[12] = requestImage("3.png");
  photos[13] = requestImage("4.png");
  photos[14] = requestImage("5.png");
  photos[15] = requestImage("6.png");
  back = requestImage("a3a67bdeea68e1b190447d14baa1f8371b59e859dc6fee0acb33a9f1818d1c7f.jpg");
}

void draw()
{
  //image(back,0,0,width,height);
  background(255);
  timer= timer + 1.0/30.0;
  backTimer= backTimer + 1.0/30.0;
  for(int j = 0; j < 500; j = j + 1)
  {
    if (backTimer <= 10)
    {
      stroke(1,133,12);
      line(0,j,250,j);
      stroke(255,184,4);
      line(250,j,500,j);
    }
    else
    {
      noStroke();
    }
  }
  for(int j = 350; j < 500; j = j + 1)
    {
      if ((backTimer >= 16) && (backTimer <= 45));
      {
        stroke(158,61,1);
        line(0,j,500,j);
      }
      //else
      //{
        //noStroke();
      //}
    }
 for (int diameter = 0; diameter < width; diameter += 4)
  {
   if ((backTimer > 10) && (backTimer <= 15));
   {
     stroke(255,15,2);
     noFill();
     ellipse(250,250,diameter,diameter);
    }
    //else
    //{
      //noStroke();
    //}
  }

  if (timer > 5)
  {
    backgroundIndex= backgroundIndex + 1;
    timer= 0;
  }
  if (backgroundIndex >= photos.length)
  {
    backgroundIndex= 0;
  }
  if (photos[backgroundIndex].width > 0)
  {
    printImage(photos[backgroundIndex],0,0,width,height);
  }
}

void printImage(PImage photo, float X, float Y, float W, float H)
{
  if (photo.width > 0)
  {
    image(photo,X,Y,W,H);
  }
}




