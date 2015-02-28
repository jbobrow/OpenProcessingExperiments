

PImage img;
PImage img2;
PImage img3;
float x = 1;
float y = 1;
float prevx = 1;
float prevy = 1;
void setup()
{
  size (500, 500);
  img = loadImage("allseeingeye.jpg");
  img.filter(BLUR);
  img2 = loadImage("triangle.jpg");
  img3 = loadImage("trisolution.jpg");

 
}

void draw()
{

  image(img, 0, 0, width, height);
  for (int count = 0; count < width; count += 50)
  {
    line(count, 0, count, width);
  }
  for (int count2 = 0; count2 < height; count2 += 50)
  {
    line(0, count2, height, count2);
  }

  image(img2, 100, 100, 100, 100);
  image(img3, 300, 100, 100, 100);
  
  x += 5;
  y += noise(y*0.5) * 10;
  prevx = x;
  prevy = y;
  line(prevx, prevy, x, y);

}



