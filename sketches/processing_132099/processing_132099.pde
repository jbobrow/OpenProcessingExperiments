
int numFrames =10;
float timer=0.0;
PImage[] images = new PImage[numFrames];
int backgroundIndex = 0;
 
 
void setup(){
  size(400,400);
  background(255);
  frameRate(30);
 
  images[0] = requestImage("image1.jpg");
  images[1] = requestImage("image2.jpg");
  images[2] = requestImage("image3.jpg");
  images[3] = requestImage("image4.jpg");
  images[4] = requestImage("image5.jpg");
  images[5] = requestImage("image6.jpg");
  images[6] = requestImage("image7.png");
  images[7] = requestImage("image8.jpg");
  images[8] = requestImage("image9.jpg");
  images[9] = requestImage("image10.jpg");
}
 
void draw(){
  timer= timer+(1.0/30.0);
  println(timer);
  if (timer > 3)
  {
    backgroundIndex += 1;
    timer = 0;
  }
  if (backgroundIndex < 0 || backgroundIndex >= images.length)
  {
    backgroundIndex = 0;
  }
  image(images[backgroundIndex],0,0,width,height);
}
 
void mouseReleased()
{
  if(mouseButton == LEFT)
  {
    backgroundIndex = (int)random(0, 9);
    timer = 0;
  }
}
 
void keyReleased()
{
  if(key == 'n')
  {
    backgroundIndex += 1;
    timer = 0;
  }
  if(key == 'b')
  {
    backgroundIndex += -1;
    timer = 0;
  }
  if(key == 'r')
  {
    backgroundIndex =(int) random(1,9);
    timer = 0;
  }
}



