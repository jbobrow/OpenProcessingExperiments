
// Final Project by Umesh Date

// Since childhood I always have fascination towards marine life,
// especially in the vibrant colours and beauty of natural 
// symmetry shown in their forms and shapes. So I chose this as 
// my topic for project. My final outcome of the project has not 
// come to what I desired, but this is my attempt to put my 
// imagination in program.
// I wanted to create a black background so that colours will 
// standout more on it. Then I chose two forms – shell and star.
// Shell form represents various shells found in marine life. 
// Star represents the forms like starfish, octopus, jelly fish
// who show high degree of radial symmetry.

// Usage: 
// Click of mouse in lower screen area draws either shell or
// star. 
// Key '1' : mode to draw shell
// Key '2' : mode to draw star
// key s or S : saves the screenshot in file
// key Del or Backspace : clears the screen

// Global Variables

// color palette
color[] mixedpalette = {#0BB230,#62FF85,#2DFF5C,#B20113,#FF5163};
// this mode is used to draw shells or small stars on mouse click
int mode = 1;

// this value divides screen in two areas, one below and other
// above this value
int areaboundary_y = 100;

// variables for images
PImage img1;

// variables to move image1
float speed1x = 1.0;
float speed1y = 0.5;
float offset1x = 0;
float offset1y = 0;
int size1x = 116;
int size1y = 113;


// -------------------------------
// setup function - size 800x600 black background
void setup()
{
  size(800,600);
  background(0);
  noFill();
  
  // load two images of star. One is in Red color palette
  // other image is in blue color palette
  img1 = loadImage("blue_star_116_113.jpg");
}

// function to move image1
// global variables speedx and speedy are initialized
// at the begining. Offsetx and offsety defines the new 
// position with respect to original starting position
// offsetx and offsety are computed by adding speedx 
// and speedy values to it during every iteration.
// once the image reaches canvas boundary then its speed is
// reversed. This is done by multiplying speed by -1.0
// Note - boundary of canvas is defined by 0 and width / height.
// Any value greater or less than this is considered as image
// going out of screen. Same logic is used to move image2
void moveimage1()
{
  int img1x, img1y;
  
  offset1x += speed1x;
  offset1y += speed1y;
  img1x = int((20) + offset1x);
  img1y = int((20) + offset1y);
  image(img1,img1x,img1y);

  if((img1x > width) || (img1x < 0))
  {
    speed1x = speed1x * -1.0;
  }
  if((img1y > areaboundary_y) || (img1y < 0))
  {
    speed1y = speed1y * -1.0;
  }
}



// this function draws shell's upon mouse click
// it draws circles on circular path with increasing 
// radiums every time. x and y values hold center of 
// circle. Variable curr_radius, start_radius and 
// end raidus decide radius of the circle.
// The variable radius defines the radius of the shell.
// no of circles drawn in the shell is determined by the variable
// resolution. If mouse is clicked near top end, ie less y then
// no of circles is less, if y is large then circles are more.
void drawshell()
{
  int curr_color = 0;

  if(mouseY > areaboundary_y + size1y + 70 + 10)
  {
    pushMatrix();
    translate(mouseX,mouseY);

    curr_color = mixedpalette[int(random(0,5))];
    
    // resolution decides density of the pattern
    int resolution = (int) map(mouseY,0,height,4,30);
    float angle = TWO_PI / resolution;
    float radius = 20;
    
    // initial radius in chosen randomly and then it increases
    // in steps slowly.
    float start_radius = random(10,20);
    float end_radius = start_radius + 50;
    for(int i = 0; i < resolution; i ++)
    {
      float x = 0 + cos(angle * i) * radius;
      float y = 0 + sin(angle * i) * radius;
      float curr_radius = map(i,0,resolution,start_radius,end_radius);
      stroke(curr_color);
      ellipse(x,y,curr_radius,curr_radius);
    }

    popMatrix();
  }
}

// this function draws star. This function is similar to 
// drawshell, only this function
// draws line instead of ellilpse
void drawstar()
{
  int curr_color = 0;

  if(mouseY > areaboundary_y + size1y + 70 + 10)
  {

    pushMatrix();
    translate(mouseX,mouseY);

    curr_color = mixedpalette[int(random(0,5))];
    
    // resolution decides density of the pattern
    int resolution = (int) map(mouseY,0,height,4,30);
    float angle = TWO_PI / resolution;
    float radius = 20;
    
    // initial radius in chosen randomly and then it increases
    // in steps slowly.
    float start_radius = random(10,20);
    float end_radius = start_radius + 50;
    for(int i = 0; i < resolution; i ++)
    {
      float x = 0 + cos(angle * i) * radius;
      float y = 0 + sin(angle * i) * radius;
      stroke(curr_color);
      line(0,0,x,y);
    }

    popMatrix();
  }
}


void draw()
{
  moveimage1();
  
  if(mousePressed)
  {
    if(mode == 1)
      drawshell();
    else if(mode == 2)
      drawstar();
  }
}

void keyPressed()
{
    if(key == '1')
      mode = 1;
    else if(key == '2')
      mode = 2;
    else if((key == DELETE) || (key == BACKSPACE))
      background(0);
    else if((key == 's') || (key == 'S'))
      saveFrame("screenshot.png");
}




