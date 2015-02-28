
PImage[] images = new PImage[5];
PImage img;
int r;
 
void setup()
{
  size(640,480);

   images[0] = loadImage("http://www.kidsmathgamesonline.com/images/pictures/numbers600/number1.jpg");
   images[1] = loadImage("http://www.allkidsnetwork.com/coloring-pages/images/Numbers/small/numbers-2.jpg");
   images[2] = loadImage("http://www.allkidsnetwork.com/coloring-pages/images/Numbers/small/numbers-3.jpg");
   images[3] = loadImage("http://1.bp.blogspot.com/_wlYDdZEKUec/TPcbULSXl7I/AAAAAAAAA0Y/6ZMP308NMw0/s1600/number4.jpg");
   images[4] = loadImage("http://www.kidsmathgamesonline.com/images/pictures/numbers600/number5.jpg");
   
   for(int i=0; i  < images.length; i ++)
   {
       images[i].resize(0,0);
   }
   
   r=0;
   img = images[r];
}

void draw()
{

  // Draw the image to the screen at coordinate (0,0)
     image(img,0,0);
}

void keyPressed() 
{
   img = images[r];
   r++;
       image(img,0,0);
}
