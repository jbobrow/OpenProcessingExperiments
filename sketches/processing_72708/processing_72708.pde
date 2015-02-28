
int numFrames = 6; 
int numtext = 0;
int frame = 0;
PImage[] images = new PImage[10];

PFont font;
String [] s = new String[4];

void setup()
{
  for (int x =0;x<100;x+=1) {
    for (int y=0;y<100;y+=1) {
      background(0, 0, x+y);
    }
  }

  size(725, 500);
  frameRate(2);
  images[0]  = loadImage("2.png");
  images[1]  = loadImage("1.png");
  images[2]  = loadImage("3.png");
  images[3]  = loadImage("4.png");
  images[4]  = loadImage("5.png");
  images[5]  = loadImage("6.png");
  images[6]  = loadImage("person1.png");
  images[7]  = loadImage("person2.png");
  images[8]  = loadImage("person3.png");
  images[9]  = loadImage("person4.png");
}
void draw() 
{ 
  for (int y = -10; y <= 1000; y += 10) {
    for (int x = -10; x <= 1000; x += 10) {

      ellipse(x + y / 8.0, y + x/ 8.0, 15 + x/2, 10);
    }
  }
  frame = frame + 1;
  if (frame == numFrames) {
    frame=1;
  }
  if (frame > 10) {
    frame=1;
  }
  if (keyPressed) {
    if (key == 'a' || key =='A')
    {
      frame = 6;
    }
  }
  if (mousePressed)
  {
    numtext++;
    
  }
  if(numtext == 1){
  text("A very nice day",500,10);
  }
     if(numtext == 2){
  text("We have a rock rolling peacefully",500,20);
  }
    if(numtext == 3){
  text("what's up? Too peacefully for you?",500,30);
  }
    if(numtext == 4){
  text("Fine, keep hitting A and you will be happy",500,40);
  }
    
  image(images[frame], 50, 50);
}


