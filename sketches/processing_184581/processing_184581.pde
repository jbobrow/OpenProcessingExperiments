
/*Created by Terry Moore
Contact: terryjuku@yahoo.com
Art 3001
Last Modified: 2.5.15 */

void setup () {
  size (600, 600); //canvas size
  smooth (8); //smoothing pixels
}


void draw (){
  background (235, 248, 244); //background color

  for (int i = 5; i < width; i = i + 20 ){ //establishing the square pattern for the x-axis
    for (int m = 5; m < height; m = m + 20) { //establishing the square pattern for the y-axis
   
   fill (166, 249, 225); // square fill color
   noStroke(); //line removal around square
   rect (i, m, 10, 10); //establishing rectangle
    }
}
}
