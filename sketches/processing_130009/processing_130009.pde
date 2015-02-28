
float mouseSpeed = 0;
float mapXToColor = 0;

void setup() {
  size (400, 400);
  fill(255,255,255);
}


void draw() {
  //The map function takes the first number you give it (here the mouse
  //position). It assumes that this value is relative to a range, which you
  //specify in the next two arguments. Here, we are saying that the number
  //coming in as mouseX is relative to the range of zero to the width of the
  //canvas, which actually is the range of all valid mouseX values.
  
  //Then map uses the next two arguments as a new range – here, the range of
  //possible color values, which run from 0 to 255 for 8-bit color. It then
  //applies logic that goes something like "mouseX is 100, and that's about
  //25% of the way from 0 to 400. What's about 25% of the way from zero to
  //255?" The result (for this example, about 64) is what's returned by the
  //function.
  mapXToColor = map(mouseX, 0, width, 0, 255);
  background(mapXToColor*0.6, mapXToColor*0.8, mapXToColor);
  
  
  println("mouseX is "+mouseX+". If it were a color, it would be "+mapXToColor+" (out of 255)");
}




