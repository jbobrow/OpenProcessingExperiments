
//Blech, these images are a few frames from an over-ambitious stop-motion project I did in junior year.
//Looking at them now, they could use some work. Anyway, all of it was done frame by frame by me on Photoshop
//This is before I figured out how to tween shit, so it's really jerky XD
//Use the left arrow key to go back a frame, use the right to jump forward a frame/speed it up. Space bar takes you to a random image. 
//Coded by Mia Rosado

/*@pjs preload="Ready-go1.jpg, Ready-go2.jpg, Ready-go3.jpg,Ready-go4.jpg, Ready-go5.jpg, Ready-go6.jpg, Ready-go7.jpg, Ready-go8.jpg,Ready-go9.jpg,Ready-go10.jpg,Ready-go11.jpg,Ready-go12.jpg,Ready-go13.jpg,Ready-go14.jpg"; */
int Frames =14;
int backgroundIndex = 0;
PImage[] images = new PImage[Frames];
float timer=0.0;

 
void setup(){
  size(400,400);
  background(255);
  frameRate(25);
 
  images[0] = requestImage("Ready-go1.jpg");
  images[1] = requestImage("Ready-go2.jpg");
  images[2] = requestImage("Ready-go3.jpg");
  images[3] = requestImage("Ready-go4.jpg");
  images[4] = requestImage("Ready-go5.jpg");
  images[5] = requestImage("Ready-go6.jpg");
  images[6] = requestImage("Ready-go7.jpg");
  images[7] = requestImage("Ready-go8.jpg");
  images[8] = requestImage("Ready-go9.jpg");
  images[9] = requestImage("Ready-go10.jpg");
  images[10] = requestImage("Ready-go11.jpg");
  images[11] = requestImage("Ready-go12.jpg"); 
  images[12] = requestImage("Ready-go13.jpg"); 
  images[13] = requestImage("Ready-go14.jpg"); 
}
 
void draw(){
  timer= timer+(1.0/30.0);
  if (timer >= 5);
  {
    backgroundIndex += 1;
    timer=0;
  }
    if (backgroundIndex < 0 || backgroundIndex >= images.length)
  {
    backgroundIndex = 0;
  }
  image(images[backgroundIndex],0,0,width,height);
}

 

void keyReleased()
{
  if(keyCode== RIGHT)
  {
    backgroundIndex += 1;
  }
  if(keyCode== LEFT)
  {
    backgroundIndex += -1;
  }
  if(keyCode == ' ')
  {
    backgroundIndex =(int) random(1,14);
  }
}





