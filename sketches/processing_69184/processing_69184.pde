
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68426*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */




//this setup function sets the screen to 400 by 400 pixels
//it also sets the background color to black
//also it makes the lines white and gives them some slight thickness

void setup()
{
  size(400,400);
  background(0);
  stroke(255);
  strokeWeight(5);
  smooth();
}

//I used 8 int variables
int a=1;
int b=5;
int c=10;
int d=25;
int e=50;
int f=100;
int g=2;

//Makes three diagonal lines three times
void draw()
{
  //makes 5 diagonal lines from top left to bottom right
  diagonals(a-a,a-a);
  diagonals(d-b,d-b);
  diagonals(e-c, e-c);
  diagonals(e+d,e+d);
  diagonals(e+d,e+d);
  diagonals(d+g*c, d+g*c);
  
  // makes 5 lines of varying length with its own mirror image from left to right
  horizontals(b, b);
  horizontals(b, e+b);
  horizontals(b, f+b);
  horizontals(b, f+(f/g)+b);
  horizontals(b, f*g+b);
  horizontals(b, g*f+(f/g)+b);
  horizontals(b, f*g+f+b);
  horizontals(b, f*g+f+(f/g)+b);

//makes 5 lines of varying length with its own mirror image from Top to bottom
  verticles(b, b);
  verticles(b+e, b);
  verticles(b+f, b);
  verticles(f+(f/g)+b, b);
  verticles(f*g+b, b);
  verticles(g*f+(f/g)+b, b);
  verticles(f*g+f+b, b);
  verticles(f*g+f+(f/g)+b, b);
  
}



//This function sets up a contructor for a series of 5 diagonal lines

void diagonals(int x, int y)
{
  
  line (x, y, width, height);
  line (x+c, y, width-x, height-y-c);
  line (x+(g*c), y, width-x, height-y-(g*c));
  line (x-c, y, width-x, height-y+c);
  line (x-(g*c), y, width-x, height-y+(g*c)); 
  
  line (x-x, height, width, y-y);
  line (x-x+c, height, width+c*g, y-y-c);
  line (x-x+c*g, height, width+g*c+c, y-y-g*c+c);
  line (x-x-c, height, width, y-y-c);
  line (x-x-g*c, height, width, y-y-g*c); 
  
}

void horizontals(int x, int y)
{
 line (x, y, c*x, y);
 line (width-x, y, width-c*x, y);
 
 line (x, y+c, d*x, y+c);
 line (width-x, y+c, width-d*x, y+c);
 
 line (x, y+(g*c), e*x, y+(g*c));
 line (width-x, y+(g*c), width-e*x, y+(g*c));
 
 line (x, y+d+b, d*x, y+d+b);
 line (width-x, y+d+b, width-d*x, y+d+b);
 
 line (x, y+e-c, c*x, y+e-c);
 line (width-x, y+e-c, width-c*x, y+e-c);
 
}

void verticles(int x, int y)
{
 line (x, y, x, y*c);
 line (x, height-y, x, height-c*y);
 
 line (x+c, y, x+c, y*d);
 line (x+c, height-y, x+c, height-y*d);
 
 line (x+(g*c), y, x+(g*c), y*e);
 line (x+(g*c), height-y, x+(g*c), height/e);
 
 line (x+b+d, y, x+d+b, y*d);
 line (x+d+b, height-y, x+d+b, height-d*y);
 
 line (x+e-c, y, x+e-c, y*c);
 line (x+e-c, height-y, x+e-c, height-c*y);
 
}



