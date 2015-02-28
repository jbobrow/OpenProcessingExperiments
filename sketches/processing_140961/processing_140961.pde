
PImage[] myimages = new PImage[10];
 
int backgroundIndex = 0;
float timer = 0;
 
void setup()
{
  size(1080, 720);
  frameRate(30);
   
  myimages[0] = loadImage("zangiefalpha.jpg");
  myimages[1] = loadImage("akuma.png");
  myimages[2] = loadImage("armorking.jpg");
  myimages[3] = loadImage("balrog.jpg");
  myimages[4] = loadImage("Dudley.jpg");
  myimages[5] = loadImage("feilong.jpg");
  myimages[6] = loadImage("jurihan.jpg");
  myimages[7] = loadImage("mishima.jpg");
  myimages[8] = loadImage("tekken.jpeg");
  myimages[9] = loadImage("yoshimitsu.jpg");
}
 
void draw()
{
  background(255);
  timer = timer + 1.0 / 30.0;
   
  if (timer > 1)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
     
  }
  if (backgroundIndex >= myimages.length)
  {
    backgroundIndex = 0;
  }
    image(myimages[backgroundIndex], 0, 0);
}
 
void keyReleased()
{
 if (key == 'r')
 {
  backgroundIndex = (int)random(0,9);
 }
 if (keyCode == LEFT)
 {
   backgroundIndex = backgroundIndex - 1;
 }
 if (keyCode == RIGHT)
 {
   backgroundIndex = backgroundIndex + 1;
 }
}


