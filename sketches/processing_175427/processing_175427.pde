
//http://processing.org/discourse/beta/num_1266309685.html
//http://forum.processing.org/one/topic/the-opposite-of-a-color.html
//http://www.processing.org/reference/libraries/video/Capture.html
// In each time the user click mouse left button, color will be changed.

//import processing.video.*;

float distance = 0.0;

float Cx = width/2;
float Cy = height/2;

// Initial Color Value
float r = 128;
float g = 128;
float b = 128;

float Rvalue, Gvalue, Bvalue;
float minRGB, maxRGB, minPlusMax;

//Capture cam;

void setup()
{
  size(720, 480, P3D);
  noStroke();
  
//  String[] cameras = Capture.list();
  
/*
  color original = color(r, g, b);
  
  Rvalue = red(original);
  Gvalue = green(original);
  Bvalue = blue(original);
  minRGB = min(Rvalue,min(Gvalue,Bvalue));
  maxRGB = max(Rvalue,max(Gvalue,Bvalue));
  minPlusMax = minRGB + maxRGB;
  
  color complement = color(minPlusMax-Rvalue, minPlusMax-Gvalue, minPlusMax-Bvalue);
*/

/*
  if (cameras.length == 0)
  {
    println("There are no cameras available for capture.");
    exit();
  } else
  {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++)
    {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }
*/
}

void draw()
{
  
// Complementary Color Generator

  color original = color(r, g, b);
  
  Rvalue = red(original);
  Gvalue = green(original);
  Bvalue = blue(original);
  minRGB = min(Rvalue,min(Gvalue,Bvalue));
  maxRGB = max(Rvalue,max(Gvalue,Bvalue));
  minPlusMax = minRGB + maxRGB;
  
  color complement = color(minPlusMax-Rvalue, minPlusMax-Gvalue, minPlusMax-Bvalue);

// Background

  background(original);
  
  for (int i = 0; i <= 5000; i += 50)
  {
    
  if(distance < 1.0)
  {
    distance = distance + 0.0003;
  }else if(distance >= 1.0)
  {
    distance = 0.0;
  }

  ellipse(Cx, Cy, i * distance, i * distance);
  noFill();
  stroke(complement);
  strokeWeight(4);
  }

/*
  if (cam.available() == true)
  {
    cam.read();
  }
  blendMode(SCREEN);
  image(cam, 0, 0, width, height);
*/
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

// Move the circle as well as change its color randomly

void mousePressed()
{
  Randomizer();
  
  Cx = mouseX;
  Cy = mouseY;
}

//Reset the position of the circle

void keyPressed()
{
  if (key == ' ')
  {
    Randomizer();
    
    Cx = width/2;
    Cy = height/2;
  }
}

// Random Generator

void Randomizer()
{
  float r1 = random(255);
  float r2 = random(255);
  float r3 = random(255);
  r = r1;
  g = r2;
  b = r3;
}


