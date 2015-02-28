
tube t1 = new tube(10, 0.0, 0.01);
tube t2 = new tube(20, 10.0, 0.01);
tube t3 = new tube(30, 5.0, 0.01);
tube t4 = new tube(40, 2.5, 0.01);
tube t5 = new tube(10, 7.5, 0.01);
tube t6 = new tube(20, 1.0, 0.01);

PImage img;// image var
int ix;// x location of image pixel, used for color data
int iy;// y location of image pixel, used for color data
//color c;// color data at point(ix,iy) of img
int border = 50;

void setup()
{
  size(500,500);
  background(0);
  smooth();
  
  img = loadImage("desert.gif");
  ix = int(random(img.width));
  iy = int(random(img.height));
  t1.xCenter = width/2;
  t1.yCenter = height/2;
  t1.c = img.get(ix, iy); 
  t2.xCenter = width/2;
  t2.yCenter = height/2;
  t2.c = img.get(ix, iy);
  t3.xCenter = width/2;
  t3.yCenter = height/2;
  t3.c = img.get(ix, iy); 
  t4.xCenter = width/2;
  t4.yCenter = height/2;
  t4.c = img.get(ix, iy);
  t5.xCenter = width/2;
  t5.yCenter = height/2;
  t5.c = img.get(ix, iy); 
  t6.xCenter = width/2;
  t6.yCenter = height/2;
  t6.c = img.get(ix, iy);
}

void draw()
{
  // functions
  t1.update();
  t2.update();
  t3.update();
  t4.update();
  t5.update();
  t6.update();
}

