
int numFrames =10;
float timer=0.0;
PImage[] images = new PImage[numFrames];
int backgroundIndex = 0;


void setup(){
  size(400,400);
  background(255);
  frameRate(30);

  images[0] = requestImage("fakedinos.jpg");
  images[1] = requestImage("fakewrex.jpg");
  images[2] = requestImage("trex.jpg");
  images[3] = requestImage("trex2.jpg");
  images[4] = requestImage("trex3.jpeg");
  images[5] = requestImage("trex4.jpg");
  images[6] = requestImage("notwrex.jpg");
  images[7] = requestImage("dino.jpg");
  images[8] = requestImage("jurassic park.jpg");
  images[9] = requestImage("monsterhunter.jpg");
}

void draw(){
  timer= timer+(1.0/30.0);
  println(timer);
  if (timer > 2)
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
  if(mouseButton== RIGHT)
  {
    backgroundIndex = (int)random(0, 9);
  }
}

void keyReleased()
{
  if(keyCode== RIGHT)
  {
    backgroundIndex += 1;
  }
  if(keyCode==LEFT)
  {
    backgroundIndex += -1;
  }
  if(keyCode == CENTER)
  {
    backgroundIndex =(int) random(1,9);
  }
}


