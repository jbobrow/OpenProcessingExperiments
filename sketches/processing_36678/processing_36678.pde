
// the composition doesnt represent architecture as such but a part of it.
//the whole idea was to generate the void and solid effect which can be used in elevation
//as facade or maybe in plan to link a cluster of solid to another

void setup () {
  size (300, 300);
  colorMode(RGB);
  background(50);
}

float count=3000; //variable to play with the number of rectangles
float num=3050; 
float rectCenter;

void draw () {
  rectCenter=random(30, 290);        //  to randomize the centre of rectangle
  if (count < num) {
    if (count%10 ==0) { // centre of the rectangle to be spaced at an interval of 10
      fill (16, 64, random(0, 150), random(90, 100));
      rectMode (CENTER);
      rect(count*width/num, rectCenter, random(5, 15), 10); 
      // high variation in the width and height is not what i was aiming at. 
      // simple geometry to be read in architecture
    }
    else {
    }
    count--;
  }
}


