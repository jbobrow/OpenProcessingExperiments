
// Code blocks, Arrays, and color palettes
//Global Variables
 color darkBrown = #431A10;
 color [] palette = {#66D7FF, #0C52E8, #1A00FF, #8616E8, #F60DFF};
 float x;
// setup ()
void setup () {
 //size and background color
 size (800, 600);
 background (darkBrown);
}

// draw ()
void draw () {
  x+=32;
  float r = random (5); 
  //elements to be draw to the canvas
noFill ();
strokeWeight (5);
stroke (palette[int(r)]);
rect (x, random (height), random(250), random(250));
println (x);
x = constrain (x, 0, width+250);
}


