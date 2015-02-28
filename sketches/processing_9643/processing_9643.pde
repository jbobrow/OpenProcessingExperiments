
//Magdalene San Millan
//CMSC 117
//Final Project
/* The inspiration for this project came from the animations of James Patterson (presstube.com).
 The line drawing used for the background image is by John W. Johnston (jwjarts.com).*/

PImage img;
int numFrames = 46;
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup()
{
  img = loadImage("town.jpg");
  image(img, 0, 0);
  size (714,560);
  frameRate(6);
  images[0] = loadImage("Picture 1.png");
  images[1] = loadImage("Picture 2.png");
  images[2] = loadImage("Picture 3.png");
  images[3] = loadImage("Picture 4.png");
  images[4] = loadImage("Picture 5.png");
  images[5] = loadImage("Picture 6.png");
  images[6] = loadImage("Picture 7.png");
  images[7] = loadImage("Picture 8.png");
  images[8] = loadImage("Picture 9.png");
  images[9] = loadImage("Picture 10.png");
  images[10] = loadImage("Picture 11.png");
  images[11] = loadImage("Picture 12.png");
  images[12] = loadImage("Picture 13.png");
  images[13] = loadImage("Picture 14.png");
  images[14] = loadImage("Picture 15.png");
  images[15] = loadImage("Picture 16.png");
  images[16] = loadImage("Picture 17.png");
  images[17] = loadImage("Picture 18.png");
  images[18] = loadImage("Picture 19.png");
  images[19] = loadImage("Picture 20.png");
  images[20] = loadImage("somer 1.png");
  images[21] = loadImage("somer 2.png");
  images[22] = loadImage("somer 3.png");
  images[23] = loadImage("somer 4.png");
  images[24] = loadImage("somer 5.png");
  images[25] = loadImage("somer 6.png");
  images[26] = loadImage("somer 7.png");
  images[27] = loadImage("somer 8.png");
  images[28] = loadImage("somer 9.png");
  images[29] = loadImage("somer 10.png");
  images[30] = loadImage("somer 11.png");
  images[31] = loadImage("cork 1.png");
  images[32] = loadImage("cork 2.png");
  images[33] = loadImage("cork 3.png");
  images[34] = loadImage("cork 4.png");
  images[35] = loadImage("cork 5.png");
  images[36] = loadImage("cork 6.png");
  images[37] = loadImage("cork 7.png");
  images[38] = loadImage("cork 4.png");
  images[39] = loadImage("cork 5.png");
  images[40] = loadImage("cork 6.png");
  images[41] = loadImage("cork 7.png");
  images[42] = loadImage("cork 8.png");
  images[43] = loadImage("cork 9.png");
  images[44] = loadImage("cork 10.png");
  images[45] = loadImage("cork 11.png");
}

int somer = 0;

void draw()
{
  background(img);  //the Matrix controls the somersault rotation
  if (frame == 25)
  {
    if (somer < 10)
    {
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(somer*PI/2);
      drawImage(mouseX, mouseY);
      popMatrix();
      somer = somer + 1;

    }
    else
    {
      frame ++;
      somer = 0;
    }
  }
  else
  {
    drawImage(mouseX, mouseY);
    frame ++;
  }
  if (frame == numFrames)  // blend makes the figure see-through by only displaying the DARKEST pixel values  
  {
    frame = 0;
    drawImage(mouseX, mouseY);
  }
}
void drawImage(int x, int y)
{
  blend(images[frame], 0, 0, images[frame].width, images[frame].height,
  mouseX, mouseY, images[frame].width, images[frame].height, DARKEST);
}





