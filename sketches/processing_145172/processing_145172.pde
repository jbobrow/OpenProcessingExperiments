
//Mandelbrot fractal viewer with zoom
//Dan Anderson
//blog.recursiveprocess.com
//All this code was written by me, but feel free to use in any way that you'd like.

//fx and fy keep track of the fx + fy*i vector between functions. It was clearer to 
//write the code with these as global variables instead of returning a two num array
float fx = 0;
float fy = 0;

//count keeps track of how many iterations a number goes through in the sequence
int count = 0;

//resolution is the maximum size of count. A higher resolution will render the fractal
//with more detail. Try starting with a resolution of 1 and then increasing it by hitting the "w" key
int resolution = 1;

//These variables keep track of the width and height of the virtual window.
//Default x values between -2 and 2, and y values between -2 and 2.
float minwindowx = -2;
float maxwindowx = 2;
float minwindowy = -2;
float maxwindowy = 2;

float centerx = 0;
float centery = 0;

//Change this variable to change the type of mandelbrot fractal. 
int power = 2;
 
void setup() 
{ 
  colorMode(HSB, 100);
  background(0,100,0);
  size(500, 500);
  drawfractal();
}

void drawfractal()
{
  loadPixels();
  color c;
  float windowwidth = maxwindowx - minwindowx;
  float windowheight = maxwindowy - minwindowy;
  for (int i = 0; i < pixels.length; i++)
  {
    //this code maps the one dimensional pixel array to a cx and cy in the complex plane.
    //nasty but it works ;-)
    float startcx = windowwidth * (float(i % width) / width) - (windowwidth/2) + centerx; 
    float startcy = windowheight * (float(floor(float(i)/width))/height) - (windowheight/2) + centery;

    //the mandelvalue is either greater than 2 and then the count matters to find out
    //how far the complex number went before it got out of the range
    //if the mandelvalue is < 2, then the pixel is black
    float size_of_num_after_mandel = mandel(startcx,startcy);
    if  (size_of_num_after_mandel < 2)
    {
        c = color(0,100,0); //black pixel
    }
    else
    {
        //the color of the pixel depends on how far the iteration got before it was out of bounds
        float ratio = 1.0*count/resolution;
        
        c = color(10+ratio*140,100,ratio*200);
        
        //Fun other color styles
        //c = color(90-ratio*140,100,ratio*200);
        //c = color(90-ratio*140,random(100),ratio*200);
    }    
    pixels[i] = c;
  }
  updatePixels();
}

void draw()
{
}
 
void mouseClicked()
{
  float windowwidth = maxwindowx - minwindowx;
  float windowheight = abs(maxwindowy - minwindowy);
  
  centerx = float(mouseX)/width * windowwidth - windowwidth/2 + centerx; 
  centery = float(height-mouseY)/height * windowheight - windowheight/2 + centery;
  
  //zoom in
  if (mouseButton == LEFT)
  {
    windowwidth = windowwidth * 0.7;
    windowheight = windowheight * 0.7;  
  }
  //zoom out
  else if (mouseButton == RIGHT)
  {
    windowwidth = windowwidth * 1.42;
    windowheight = windowheight * 1.42;
  }
  minwindowx = centerx - windowwidth/2;
  maxwindowx = centerx + windowwidth/2;
  minwindowy = centery + windowheight/2;
  maxwindowy = centery - windowheight/2;

  //adjust resolution
  //This natural log regression provides higher and higher resolutions as it zooms in 
  //UNCOMMENT OUT THE NEXT LINE TO GET DYNAMIC RESOLUTION
  //resolution = int(154.71-0.156*log(windowwidth));

  drawfractal();
}

void keyPressed()
{
  if (key == '2')
  {
    power = 2;
  }
  else if (key == '3')
  {
    power = 3;
  }
  else if (key == '4')
  {
    power = 4;
  }
  else if (key == '5')
  {
    power = 5;
  }
  else if (key == '6')
  {
    power = 6;
  }
  else if (key == '7')
  {
    power = 7;
  }
  else if (key == '8')
  {
    power = 8;
  }
  else if (key == '9')
  {
    power = 9;
  }
  else if (key == '0')
  {
    power = 10;
  }
  else if (key == 'w')
  {
    resolution += 1;
  }
  else if (key == 's')
  {
    resolution -= 1;
  }
  else if (key == 't')
  {
    //this code will render the fractal at a large size and resolution and save the image.
    int res = resolution;
    size(4000, 4000);
    if (resolution < 100)
    {
      resolution = 100;
    }
    drawfractal();
    save("savedPicture.png");
    size(700, 700);
    resolution = res;
  }
  else if (key == 'y')
  {
    //this code will bump up the resolution by a factor of 2
    resolution *= 2;
  }
  drawfractal();
}
 
float mandel(float starta, float startb)
{
  float xm = 0;
  float ym = 0;
  count = 0;
  fx = 0;
  fy = 0;
  while ( (count < resolution) && (fx*fx+fy*fy < 4))
  {
      func(xm,ym,starta,startb);
      xm = fx;
      ym = fy;
      count++;
  }
  return sqrt(fx*fx + fy*fy);
}

//this function is for z_n+1 = z_n^2 + c, where z_n and c are complex numbers
//exercise left to the reader to see why (a+bi)^2 = (a^2-b^2)+(2ab)i
void func(float a, float b, float starta, float startb)
{
  if (power == 2)
  {
    //(a+bi)^2 + (starta + startb*i) = (a^2-b^2 + starta) + (2*a*b + startb)i
    fx = a*a - b*b + starta;
    fy = 2*a*b + startb;
  }
  else if (power == 3)
  {
    //Enter (a+bi)^3 code here
  }
  else if (power == 4) 
  {
    //Enter (a+bi)^4 code here
    
  }
}

