
// Scaling
// Extract from:
// http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-05.pdf

void setup() {  //setup function called initially, only once
  size(90, 90);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 // Scaling
 // To keep the same stroke weight and scale a shape, divide the
 // parameter of the strokeWeight() function by the scale value.
 
 
  float s = 1.8;
  smooth();
  ellipse(32, 32, 30, 30);
  scale(s);
  strokeWeight(1.0 / s);
  ellipse(32, 32, 30, 30);
 
 
}

                
                
