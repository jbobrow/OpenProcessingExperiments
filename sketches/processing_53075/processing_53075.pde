
/* This is a template for bus-tops contest on OpenProcessing.org.
*  Bus-Tops (http://bus-tops.com) is a public art project
*  in London where we have placed 30 monochromatic red LED screens
*  on the roofs of bus shelters across the city. Sketches from
*  OpenProcessing Collections will be selected to be exhibited
*  on these screens.
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/

int x1 = 0;
int x2 = 0;
int maxCircleDiameter = 720;

 
public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);
  x2 = width;
  smooth();
  background(0);
}
 
void draw() {
   strokeWeight(4);
   noFill();
  
   if (x1%16 == 0) {
     background(0);
   }
   
    for (int i = 0; i<maxCircleDiameter; i+=40)
    {
      ellipse(x1, height/2 + int(random(-12,12)), i, i);
      stroke(random(255),0,0);
    }
    x1++;
    if (x1 == width + (maxCircleDiameter/2)) {
      x1 = maxCircleDiameter/-2 + int(random(-50,0));
    }
    
    
    for (int j = 0; j<maxCircleDiameter; j+=40)
    {
      ellipse(x2, height/2 + int(random(-12,12)), j, j);
      stroke(random(255),0,0);
    }
    x2--;
    if (x2 == 0-(maxCircleDiameter/2)) {
      x2 = width + maxCircleDiameter/2 + int(random(0,20));
    }
    
    for (int k = 0; k<maxCircleDiameter; k+=40)
    {
      ellipse(int(random(-12,12))+(width/2), height/2 + int(random(-12,12)), k, k);
      stroke(random(255),0,0);
    }

    
}

