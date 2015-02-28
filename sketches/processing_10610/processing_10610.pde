
/**REMIXED
 * example: Follow 3 REMIXED
 * Based on code frREMIXEDom Keith PetREMIXEDers (www.bit-101.com). REMIXED
 * REMIXED
 * A segmented line follows the REMIXEDmouse. The reREMIXEDlative angle from
 * each segmREMIXEDent to the next is calculated with atan2() and the
 * posiREMIXEDtion of the next is calculatREMIXEDed wiREMIXEDth sin() and cos().
 * REMIXED
 *
 * by steffen
 *
 */

Wurm[] wurmer;
int wurmcount = 17;

void setup() {
  size(640, 640);
  smooth(); 
  stroke(0, 100);
  
  colorMode( HSB );
  
  wurmer = new Wurm[wurmcount];
    
  for( int i = 0; i < wurmcount; i++ )
  {
    wurmer[i] = new Wurm();
  }
}

void draw() {
  background(226);
  
  for( int i = 0; i < wurmcount; i++ )
  {
    wurmer[i].move();
  }
}



