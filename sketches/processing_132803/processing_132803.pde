
int numFrames = 10;
float timer=0.0;
PImage[] images = new PImage[numFrames];
int bIndex =0;
float stoptimer =-5000.0;
void setup()
{
  size(400,400);
  background(255);
  frameRate(30);
  
  images[0] = requestImage("sad dog.jpg");
  images[1] = requestImage("sad dog2.jpg");
  images[2] = requestImage("sad dog3.jpg");
  images[3] = requestImage("sad dog 4.jpg");
  images[4] = requestImage("saddestdog.jpg");
  images[5] = requestImage("saveanimal.jpg");
  images[6] = requestImage("saddcat.jpg");
  images[7] = requestImage("sad cat2.jpg");
  images[8] = requestImage("sadcat3.jpg");
  images[9] = requestImage("animal message.jpg");
}

void draw(){
  timer = timer + (1.0/30.0);

 println(timer);
 
   
  
  if(timer >4)
  {
    bIndex += 1;
    timer=0;
  }
  
  if (bIndex <0 || bIndex >= images.length)
  {
    bIndex =0;
  }
  if(bIndex>8 && bIndex <9)
  {
    filter(GRAY);
  }
 
  
  
  image(images[bIndex],0,0,width,height);
  
 
}

void mouseReleased()
{
  if(mouseButton==RIGHT)
  {
    timer= stoptimer;
  }
  if(mouseButton==LEFT)
  {
    timer=0.0;
  }
}


