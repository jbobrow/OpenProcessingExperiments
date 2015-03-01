
//Tutor how to manipulate pixels
//https://processing.org/tutorials/pixels/
//https://www.processing.org/reference/pixels.html
//https://www.processing.org/reference/set_.html

PVector v0, v1;

void setup()
{
  size(320,200);//window dimensions
  
  //init vectors
  int low=0;
  int high=200;
  int x0 = (int)random(low, high);
  int y0 = (int)random(low, high);
  int x1 = (int)random(low, high);
  int y1 = (int)random(low, high);
  v0 = new PVector(x0, y0);
  v1 = new PVector(x1, y1);
  
  //noLoop();// no animation (run only once)
}

void update()
{
  //init vectors
  int low=0;
  int high=200;
  int x0 = (int)random(low, high);
  int y0 = (int)random(low, high);
  int x1 = (int)random(low, high);
  int y1 = (int)random(low, high);
  v0 = new PVector(x0, y0);
  v1 = new PVector(x1, y1);
}

void draw() 
{
  update();
  //size(200, 200); //working area dimensions, if not specified size of window?
  //loadPixels();  
  ////img.loadPixels();
//  //using pixels
//  // Loop through every pixel column
//  for (int x = 0; x < width; x++) 
//  {
//    // Loop through every pixel row
//    for (int y = 0; y < height; y++) 
//    {
//      // Use the formula to find the 1D location
//      int loc = x + y * width;
//      if (x % 2 == 0) 
//      { // If we are an even column
//        //pixels[loc] = color(255);
//        pixels[loc] = color(255,255,255);
//      } 
//      else 
//      { // If we are an odd column
//        //pixels[loc] = color(0);
//        pixels[loc] = color(0,0,0);
//      }
//    }
//  }
  //updatePixels(); 
  
  //using set method
  color red= color(255,0,0);
  line_bresenham(v0, v1, red);
  
  //background(0);
  // Draw the image to the screen at coordinate (0,0)
  //image(img,0,0);
}

//void swap(PVector v1, PVector v2)
//{
//  PVector temp= v1;
//  v1= v2;
//  v2= temp;
//}

//do not work in java
//void swap(int i0, int i1)
//{
//  int temp= i0;
//  i0= i1;
//  i1= temp;
//}

void line_bresenham(PVector v0, PVector v1, color c)
{
  int x0= (int)v0.x;
  int y0= (int)v0.y;
  int x1= (int)v1.x;
  int y1= (int)v1.y;
  boolean steep = false;
  if (abs(x0-x1)<abs(y0-y1))
  {
      int temp= x0;
      x0= y0;
      y0= temp;

      temp= x1;
      x1= y1;
      y1= temp;
      
      steep = true;
  }
  if (x0>x1)
  {
      int temp= x0;
      x0= x1;
      x1= temp;
      
      temp= y0;
      y0= y1;
      y1= temp;
  }
  int dx = x1-x0;
  int dy = y1-y0;
  int derror2 = abs(dy)*2;
  int error2 = 0;
  int y = y0;
  for (int x=x0; x<=x1; x++)
  {
      if (steep) 
      {
          set(y, x, c);
      } 
      else 
      {
          set(x, y, c);
      }
      error2 += derror2;

      if (error2 > dx) 
      {
          y += (y1>y0?1:-1);
          error2 -= dx*2;
      }
  }
}


