
/*Rachel Moeller
EMS2 Clock
Hours change the noise level.
Minutes change the color.
Seconds draw stars.
 */
float increment = 0.006;


void setup() 
{
  size(600, 200);
}

void draw()
{
  
  loadPixels();

  //time variables
  int hour=hour();
  int minute=minute();
  int second=second();
  
  //change by the hour
  increment=map(sin(hour),-1,1,0.006,.01);

  int p=0;
  //array of star positions
  int o=10;
  int r1=(int)random(o*-1,o);
  int[] starPositions= new int[120];
  //populate array
  for (int arrayCount=0;arrayCount<starPositions.length;arrayCount+=2)
  {
   starPositions[arrayCount]=o;
   starPositions[arrayCount+1]=height/2;
   o+=20;
   p+=20;
  }
  

  //Color calculations
  int red=0;
  int green=0;
  int blue=0;
  int r=0;
  int g=0;
  int b=0;

  float yoff = 0.0; // Start xoff at 0
  float detail = .6;
  noiseDetail(8, detail);

  red=100;
  green=100;
  blue=100;
  int redDif =(int) map( sin(minute), -1,1,  0,200);
  int grnDif = 10;
  int bluDif = (int) map( sin(minute), -1,1,  0,220);
  int redLo = red-redDif/2;
  int redHi = red+redDif/2; 
  int grnLo = green-grnDif/2;
  int grnHi = green+grnDif/2;
  int bluLo = blue-bluDif/2;
  int bluHi = blue+bluDif/2;
  
 
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int y = 0; y < height; y++) {
    yoff += increment;   // Increment xoff 
    float xoff = 0.0;//xStart;   // For every xoff, start yoff at 0
    int row = y*width;
    for (int x = 0; x < width; x++) {
      xoff += increment; // Increment yoff

      // Calculate noise and scale by 255
      float bright = noise(xoff, yoff); 
      //set to a color, not a gray


      r = redLo + (int)(redDif*bright);
      g = grnLo + (int)(grnDif*bright);
      b = bluLo + (int)(bluDif*bright);
      
      color newColor = (r << 16) + (g << 8) + b;
     
      pixels[row+x] = newColor;
    }
  }

  updatePixels();

  noStroke();
  
  for(int star=0;star<second;star+=2)
  {
    fill(255,200);
    ellipse(starPositions[star],starPositions[star+1],10,10);
    
  }
  }





