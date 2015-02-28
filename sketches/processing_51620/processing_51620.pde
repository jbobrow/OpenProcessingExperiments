
/* This is my first, quick stab at an entry for Bus Top
* Ruairi Murphy
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/

int s = 8;
int c;
public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);
}
 
void draw() {
  background(0); //keep background black (LEDs are brightness based)
  //stroke(255,0,0); //LEDs are on the scale of red
  //fill(255,0,0);   //LEDs are on the scale of red
   
  //----DO WHATEVER YOU LIKE BELOW-----
  //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----
  for(int i = 0; i<64;i++){
    for(int j=0;j<20;j++){
      c = round(random(0,255));
      fill(c,0,0);
      rect(i*8,j*8,8,8);
    }
  }
}               
