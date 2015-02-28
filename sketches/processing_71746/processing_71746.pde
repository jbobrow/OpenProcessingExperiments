
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/71746*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img;
PImage img2;

int revealx1a = 0;
int revealx1b = 0;
int revealy1a = 0;
int revealy1b = 0;

int revealx2a = 0;
int revealx2b = 0;
int revealy2a = 0;
int revealy2b = 0;

boolean test;
int x = 0;
int y = 0;
int i = 0;
int l = 0;
int t = 0;
int[] xpos = new int[75]; 
int[] ypos = new int[75];
int[] xposop = new int[75];
int[] yposop = new int[75];

void setup() 
{
  size(450,317);
  img = loadImage("1.jpg");
  img2 = loadImage("17785860.jpg");
 

  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) 
  {
    xpos[i] = 0; 
    ypos[i] = 0;
    xposop[i] = 0;
    yposop[i] = 0;
  }
  
}

void draw() 
{
  
  loadPixels();
  int x = mouseX;
  int y = mouseY;
  boolean test = back();
  
  background(155);
  image (img, 0, 0);
  
  if(test)
  {
    background(255);
    image(img2, 0, 0);
  }
  
  for (int t = 0; t < xpos.length-1; t ++ ) 
  {
    xpos[t] = xpos[t+1];
    ypos[t] = ypos[t+1];
    xposop[t] = xposop[t+1];
    yposop[t] = yposop[t+1];
   
  }
  
  // New location
  xpos[xpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  xposop[xposop.length-1] = img.width - mouseX;
  yposop[yposop.length-1] = img.height - mouseX;
  
  int loc = x + y*img.width;
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  // Draw everything
  for (int l = 0; l < xpos.length; l ++ ) 
  {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(r-l,g-l,b-l,125);
    ellipse(xpos[l],ypos[l],l/2,l/2);
    ellipse(xposop[l],yposop[l], l/2, l/2);
    ellipse(xpos[l], yposop[l], l/2, l/2);
    ellipse(xposop[l], ypos[l], l/2, l/2);
  }
}

boolean back()
{
  int revealx1a = int(random(width - 100));
  int revealy1a = int(random(height - 100));
  int revealx1b = (revealx1a + 100);
  int revealy1b = (revealy1a + 100);
  
  int revealx2a = int(random(width - 10));
  int revealy2a = int(random(height - 10));
  int revealx2b = (revealx2a + 10);
  int revealy2b = (revealy2a + 10);
  
  while( mouseX >=revealx1a && mouseX <= revealx1b)
  {
    while(mouseY >= revealy1a && mouseY <= revealy1b)
    {
      return true;
    }
    return false;
  }
  return false;
}


