
float timer = 0.0;
PImage[] photos= new PImage[10];
int backgroundIndex= 0;

//spriteObject mySprite = new spriteObject;

void setup()
{
  size(500,500);
  //mySprite= new spriteObject();
  //println(mySprite.index);
  photos[0] = requestImage("1.jpg");
  photos[1] = requestImage("2.jpg");
  photos[2] = requestImage("3.jpg");
  photos[3] = requestImage("4.jpg");
  photos[4] = requestImage("5.jpg");
  photos[5] = requestImage("6.jpg");
  photos[6] = requestImage("7.jpg");
  photos[7] = requestImage("8.JPG");
  photos[8] = requestImage("9.jpg");
  photos[9] = requestImage("10.jpg");
}

void draw()
{
  background(255);
  timer= timer + 1.0/30.0;
  if (timer > 8)
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
  for (int i = 0; i < photos.length; i = i + 1)
  {
    printImage(photos[i], i * 50, 0, 50, 50);
  }

}

void printImage(PImage photo, float X, float Y, float W, float H)
{
  if (photo.width > 0)
  {
    image(photo,X,Y,W,H);
  }
}
  
void keyReleased()
{
  if (key == '2')
  {
    backgroundIndex = backgroundIndex + 1;
    timer= 0;
  }
  if (key == '1')
  {
    backgroundIndex = backgroundIndex - 1;
    timer= 0;
  }
  if (key == '3')
  {
    //backgroundIndex = int(random(backgroundIndex));
    backgroundIndex= (int)random(0,10);
    timer= 0;
  }
  if (key == '4')
  {
   timer= 6;
  }
}

/*class spriteObject
{
  int index;
  spriteObject()
  {
    timer= 0;
    index= 3;
  }
}*/



