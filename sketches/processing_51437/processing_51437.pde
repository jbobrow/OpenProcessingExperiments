
/* This is a template for bus-tops contest on OpenProcessing.org. 
*  Bus-Tops (http://bus-tops.com) is a public art project 
*  in London where we have placed 30 monochromatic red LED screens
*  on the roofs of bus shelters across the city. Sketches from 
*  OpenProcessing Collections will be selected to be exhibited
*  on these screens.
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/


public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160);  
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);    
}

void draw() {
  background(0); //keep background black (LEDs are brightness based)
  stroke(255,0,0); //LEDs are on the scale of red
  fill(255,0,0);   //LEDs are on the scale of red
  
  //----DO WHATEVER YOU LIKE BELOW-----
  //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----
  
    float rand = random(100); //example
    ellipse(width/2, height/2, 80*sin(rand), 80*sin(rand)); //example
    
  
 
 
 
 
}               
