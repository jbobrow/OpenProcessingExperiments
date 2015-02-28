
PImage Hintergrund;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img7;

void setup()
{
 size(500,500);
 Hintergrund = loadImage("IMG_4595.jpg");
 img1 = loadImage("IMG_4640.jpg");
 img2 = loadImage("IMG_4613.png");
 img3 = loadImage("IMG_4615.png");
 img4 = loadImage("IMG_4620.png");
 img5 = loadImage("IMG_4630.png");
 img7 = loadImage("IMG_4611.png");
}

void draw()
{
 background (0);
 image (img1, 0,0,500,500);
 image (img7, 0,130);

 

 if (mousePressed)
{ 
 image (img1, 0,0, 500,500);
 image (img5, 50,150);
}
 

 {
 if (mouseX < 100)
 {
   image (img2, 0,200);
 }
 
 if (mouseX >400)
 {
   image (img4, 360,290);
 }
 
 if (mouseY <100)
 {
   image (img3,380,140);
   } 
 }
 
}


