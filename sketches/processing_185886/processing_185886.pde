
/* @pjs preload="john_plane_gif/00.png,
john_plane_gif/01.png,
john_plane_gif/02.png,
john_plane_gif/03.png,
john_plane_gif/04.png,
john_plane_gif/05.png,
john_plane_gif/06.png,
john_plane_gif/07.png,
john_plane_gif/08.png,
john_plane_gif/09.png,
john_plane_gif/10.png,
john_plane_gif/11.png,
john_plane_gif/12.png,
john_plane_gif/13.png,
john_plane_gif/14.png,
john_plane_gif/15.png,
john_plane_gif/16.png,
bg.png";
*/

//background
PImage bg;
PImage bg2;
//character sprites
Animation plane;

//item to drop

//droppable item sprites 
PImage cashRegister; 
PImage moneyRoll; 

//movement control booleans
boolean wPressed, sPressed; //WASD


int charX = 400;
int charY = 160;
int bgX = 0;
int bgX2 = 1200; 

void setup()
{
  size(1200,600);
  frameRate(60);
  loadImages();
}

void draw()
{
  image(bg, bgX, -350);
  image(bg2, bgX2, -350);
  bgX -= 5;
  bgX2 -= 5;
  if(bgX < -1919){
    bgX = 1200;
  }
  if(bgX2 < -1919){
    bgX2 = 1200;
  }
  //user input parsing for character movement 
  if (wPressed && (charY > 0)){
   rotate(-0.05); 
   charY -= 10; 
  }
  if (sPressed && (charY + 150 < height)){
   rotate(0.05); 
   charY += 10;
  }
  plane.display(10, charY);
  //image(plane, 10,charY, plane.width/1.5, plane.height/1.5);
  //image(plane, 10,charY);
}

void keyPressed()
{
  if (key == 'w' || key == 'W' || keyCode == UP)
  {
    wPressed = true;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN)
  {
    sPressed = true;
  }
}


void keyReleased()
{

  if (key == 'w' || key == 'W' || keyCode == UP)
  {
    wPressed = false;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN)
  {
    sPressed = false;
  }
}
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

void loadImages()
{
  bg = loadImage("bg.png");
  bg2 = loadImage("bg.png");
  plane = new Animation("john_plane_gif/", 17);
}


