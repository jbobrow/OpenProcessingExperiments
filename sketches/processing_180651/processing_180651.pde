
/*
  Horizontal and vertical lines 
  space stays the same
  line weight increases
  
 */

int a=0;
float strokew=10; 
int colour=25;
int opacity = 0;


void setup() {
  size(400,400);
  background(255);
}

void draw() {
  //   Horizontal lines    //  
  stroke(colour, 0, colour, opacity);
  strokeWeight(strokew);
  //line(0, a, width, a);

  //   Vertical lines  1 //  
  line(a, 0, a-400, height);
  //   Vertical lines 2  //  
  stroke(0, colour, colour, opacity*2);
  strokeWeight(strokew*2);
  line(a*2-400, 0, a*2, height);
  
  //   Variable handling    //
  // Increase space
  a=a+strokew+8;
  // Increase weight
  //strokew=strokew+0.6;
  // Change colour
  colour=colour+5;
  //change opacity
  opacity = opacity + 6;
  if(frameCount>44) {
      noLoop();
  }
}
