
int resolution = 25;
int color_mode = 1;
int escape_velocity;
float power_of_z = 2;
//This sets the size that defines the Mandelbrot set. 
//Any points, after iteration, that stay with a size under 2 are in the
//Mandelbrot set.
float escape_radius = 2;

int experimental_mode = 2;

//These variables keep track of the width and height of the virtual windows
float minwindowx = -2;
float maxwindowx = 2;
float minwindowy = -2;
float maxwindowy = 2;
float centerx = 0;
float centery = 0;

void setup()
{
  colorMode(HSB,100);
  size(700,750);
  background(0,0,100);
  drawfractal();
}

void draw()
{
  drawUI();
}

float calculate_mandelbrot(float c_a, float c_b)
{

  
  escape_velocity = 0;
  //start with 0+0i
  float a = 0;
  float b = 0;
  //This code uses polar form and DeMoivre's Theorem to raise (z_n) to different powers. 
  //r is the radius, theta is the angle
  float r = 0;
  float theta = 0;
  
  float next_a;
  float next_b;
  
  float size_of_number = 0;
  
  while ((escape_velocity < resolution) && (size_of_number < escape_radius))
  {
      if (experimental_mode == 0)
      {
        //notice that r is just the distance from the origin
        r = sqrt(a*a + b*b);
        //DeMoivre's Theorem says that (r cis theta)^p = r^p cis (p*theta)
        r = pow(r,power_of_z);
        
        //Since arctan doesn't know what quadrant the angle is in, we need to set it up in the correct quad
        if (a > 0)
        {
          theta = atan(b/a);
        }
        else if (a < 0)
        {
          theta = atan(b/a);
          theta = theta + PI;
        }
        else
        {
          theta = 0;
        }
        
        theta = power_of_z * theta;
        
        //Note r*cos(theta) = x and r*sin(theta) = y
        a = r * cos(theta) + c_a;
        b = r * sin(theta) + c_b;
      }
      
      else if (experimental_mode == 1)
      {
        //This is z_n^2+1/c
        
        float newc_a = c_a / (c_a*c_a + c_b*c_b);
        float newc_b = (-1.0 * c_b)/(c_a*c_a + c_b*c_b);
        c_a = newc_a;
        c_b = newc_b;
        r = sqrt(a*a + b*b);
        //DeMoivre's Theorem says that (r cis theta)^p = r^p cis (p*theta)
        r = pow(r,power_of_z);
        
        //Since arctan doesn't know what quadrant the angle is in, we need to set it up in the correct quad
        if (a > 0)
        {
          theta = atan(b/a);
        }
        else if (a < 0)
        {
          theta = atan(b/a);
          theta = theta + PI;
        }
        else
        {
          theta = 0;
        }
        
        theta = power_of_z * theta;
        
        //Note r*cos(theta) = x and r*sin(theta) = y
        a = r * cos(theta) + c_a;
        b = r * sin(theta) + c_b;
        
      }
      else if (experimental_mode == 2)
      {
        
        //this is e^(z)+c with a larger escape radius
        //e^(a+bi) = e^a * cos(b) + i * e^b * sin(b)
        escape_radius = 50;
        

        next_a = exp(a)*cos(b)+c_a;
        next_b = exp(a)*sin(b)+c_b;
        a = next_a;
        b = next_b;
        
      }

      escape_velocity++;
      size_of_number = sqrt(a*a + b*b);
  }
  return size_of_number;
}

void drawfractal()
{
  loadPixels();
  color c = color(0,100,0);
  for (int i = 0; i < pixels.length; i++)
  {
    //these 4 lines of code map the 1 dimensional pixel array to a start cx and cy
    float c_a = float(i % width) / width;
    float c_b = float(floor(float(i) / width)) / (height-50);
    c_a = map(c_a,0.0,1.0,minwindowx,maxwindowx);
    c_b = map(c_b,0.0,1.0,minwindowy,maxwindowy);

    float size_of_number = calculate_mandelbrot(c_a,c_b);

    if (size_of_number < escape_radius)
    {
      c = color(0,100,0);
    }
    else
    {
      //Each of these is a different coloring mode... try them out!
      if (color_mode == 0)
      {
        c = color(0,0,100);
      }
      else if (color_mode == 1)
      {
        c = color(100-10*log(escape_velocity),100-20*log(escape_velocity),100);
      }
      else if (color_mode == 2)
      {
        c = color(100-50*log(size_of_number),100-20*log(size_of_number),100);
      }
      else if (color_mode == 3)
      {
        c = color(100-100*float(escape_velocity)/resolution,100,100);
      }
      else if (color_mode == 4)
      {
        c = color(100-(2*escape_velocity)%100,random(30)+70,100);
      }
      else if (color_mode == 5)
      {
        c = color(50*sin(0.1*escape_velocity)+50,5*sin(escape_velocity)+65,100);
      }
    }
    pixels[i] = c;
  }
  updatePixels();
}



void mouseClicked()
{
  int mx = mouseX;
  int my = mouseY;

  //Button Checker
  //Resolution Buttons
  if (mx >= 256 && mx <= 331 && my > (height - 54) && my < (height - 34))
  {
    resolution += 1;
  }
  if (mx >= 256 && mx <= 331 && my > (height - 34) && my < (height - 21))
  {
    if (resolution > 5)
    {
      resolution -= 5;
    }
    else if (resolution > 0)
    {
      resolution -= 1;
    }
  }
  if (mx >= 256 && mx <= 331 && my > (height - 21) && my < (height))
  {
    resolution += 10;
  }

  
  //Change power of x
  if (mx >= 441 & mx <= 516 && my > (height - 54) && my < (height - 34))
  {
    power_of_z += 1.0;
  }
  if (mx >= 441 & mx <= 516 && my > (height - 34) && my < (height - 17))
  {
    power_of_z += 0.125;
  }
  if (mx >= 441 & mx <= 516 && my > (height - 17) && my < height)
  {
    power_of_z -= 0.125;
  }
  
  
  //Reset all button
  if (mx >= 544 && mx <= 619 && my >= (height - 54) && my < height)
  {
    resolution = 25;
    power_of_z = 2;
    color_mode = 1;
    minwindowx = -2;
    maxwindowx = 2;
    minwindowy = -2;
    maxwindowy = 2;
    centerx = 0;
    centery = 0;
  }
  
  //Change color mode button
  if (mx >= 619 && mx <= 694 && my >= (height - 54) && my < height)
  {
    color_mode += 1;
    if (color_mode > 5)
    {
      color_mode = color_mode % 6;
    }
  }
  
  if (my < (height-50))
  {

    float windowwidth = maxwindowx - minwindowx;
    float windowheight = abs(maxwindowy - minwindowy);
    
    centerx = float(mx)/width * windowwidth - windowwidth/2 + centerx; 
    centery = float(height-my)/height * windowheight - windowheight/2 + centery;
    
    //zoom in
    if (mouseButton == LEFT)
    {
      windowwidth = windowwidth * 0.5;
      windowheight = windowheight * 0.5;  
    }
    //zoom out
    else if (my < (height-50))
    {
      windowwidth = windowwidth * 2.0;
      windowheight = windowheight * 2.0;
    }
    
    minwindowx = centerx - windowwidth/2;
    maxwindowx = centerx + windowwidth/2;
    minwindowy = centery + windowheight/2;
    maxwindowy = centery - windowheight/2;
  

  }
  drawfractal();
}

void keyPressed()
{
  if (key == 't')
  {
    PFont f;
    f = createFont("Arial",40,true);
    textFont(f,40);
    println("save picture");
    text("SAVE PICTURE",width/2,height/2);
    //this code will render the fractal at a large size and resolution and save the image.
    int res = resolution;
    int w = width;
    int h = height;
    size(4000, 4000);
    if (resolution < 100)
    {
      resolution = 100;
    }
    drawfractal();
    String name = "savedPicture" + String.valueOf(day()) + "-" + String.valueOf(month()) + "-" + String.valueOf(year()); 
    name +=  "-" + String.valueOf(hour()) + String.valueOf(minute()) + String.valueOf(second()) + ".png";
    save(name);
    size(w, h);
    resolution = res;
    println("done saving picture");
    drawfractal();
  }
}


void drawUI()
{
  PFont f;
  f = createFont("Arial",16,true);
  textFont(f,16);
  
  //Clear bottom UI
  fill(0,100,0);
  rect(0,height-55,width,55);
  
  //Info
  fill(0,0,100);
  text("Resolution " + str(resolution),3,height-40);
  text("Power of z " + str(power_of_z),3,height-22);
  text("Window width " + str(maxwindowx-minwindowx),3,height-2);

  //Resolution Tag
  fill(0,0,100);
  text("Resolution",179,height-21);
  
  //Resolution Buttons
  fill(0,100,0);
  stroke(0,0,100);
  rect(256,height-54,75,20);
  fill(0,0,100);
  text("+ 1",281,height-39);
  
  fill(0,100,0);
  stroke(0,0,100);
  rect(256,height-34,75,17);
  fill(0,0,100);
  text("- 5",285,height-20);
  
  fill(0,100,0);
  stroke(0,0,100);
  rect(256,height-17,75,16);
  fill(0,0,100);
  text("+ 10",281,height-3);
  
  //Power of x buttons
  fill(0,0,100);
  text("Power of x",357,height-20);
  
  fill(0,100,0);
  stroke(0,0,100);
  rect(441,height-54,75,20);
  fill(0,0,100);
  text("+ 1 ",458,height-39);
  
  fill(0,100,0);
  stroke(0,0,100);
  rect(441,height-34,75,17);
  fill(0,0,100);
  text("+ 0.125",458,height-20);
  
  fill(0,100,0);
  stroke(0,0,100);
  rect(441,height-17,75,16);
  fill(0,0,100);
  text("- 0.125",460,height-3);
  
  
  //Reset All
  fill(0,100,0);
  stroke(0,0,100);
  rect(544,height-54,75,53);
  fill(0,0,100);
  text("Reset All",550,height-21);
  
  //colormode
  fill(0,100,0);
  stroke(0,0,100);
  rect(619,height-54,75,53);
  fill(0,0,100);
  text("Change",627,height-37);
  text("color",637,height-22);
  text("mode",635,height-8);
   
}

