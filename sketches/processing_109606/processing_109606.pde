
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 rectMode(RADIUS);  // Set rectMode to RADIUS
fill(255);  // Set fill to white
rect(width/2, height/2, 100, 100);  // Draw white rect using RADIUS mode
rectMode(CENTER);  // Set rectMode to CENTER
fill(100);  // Set fill to gray
rect(width/2, height/2, 100, 100);  // Draw white rect using CENTER mode
}
