
/* This is a template for bus-tops contest on OpenProcessing.org.
*  Bus-Tops (http://bus-tops.com) is a public art project
*  in London where we have placed 30 monochromatic red LED screens
*  on the roofs of bus shelters across the city. Sketches from
*  OpenProcessing Collections will be selected to be exhibited
*  on these screens.
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/

int x, y, s;
color c;
Cell[][] grid;
int cols = 64;
int rows = 20;
float intAngle;

public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);
  c = color(255,0,0);
  s = 8;
  grid = new Cell[cols][rows];
  for(int i = 0;i< cols;i++){
    for(int k = 0;k<rows;k++){
      intAngle = random(0,255);
      grid[i][k] = new Cell(i*8,k*8,s,c,intAngle);
    }
  }
}
 
void draw() {
  background(0); //keep background black (LEDs are brightness based)
  //stroke(255,0,0); //LEDs are on the scale of red
  //fill(255,0,0);   //LEDs are on the scale of red
   
  //----DO WHATEVER YOU LIKE BELOW-----
  //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----
  for(int i = 0;i< cols;i++){
    for(int k = 0;k<rows;k++){
      grid[i][k].oscillate();
      grid[i][k].display();
    }
  }
}

class Cell{
  
  int x,y,s;
  color c;
  float angle;
  
  Cell(int tempX, int tempY, int tempS, color tempC, float tempAngle){
    
    x = tempX;
    y = tempY;
    s = tempS;
    c = tempC;
    angle = tempAngle;
  }
  
  void oscillate(){
    angle += 0.15; 
  }
  
  void display(){
    fill(127+127*(sin(angle)),0,0);
    rect(x,y,s,s);
  }
}
                
