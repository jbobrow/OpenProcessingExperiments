
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
 //(do not make it interactive, since people won't be able to usemouse/keyboard on a bus stop----
 for(int i=height;i++<=width*height;){
   stroke(255*tan(frameCount*sin(cos(sqrt(i%width)/((i/width)/5)+cos(sin(sqrt(i%width)))))),0,0);
   point(i%width,height-(i/width));
 }
}                               
