
int d;

void setup() {  //setup function called initially, only once
  size(255, 255);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  d = 0;
}

void draw() {  //draw function loops 
  d++;
  noStroke();
  fill(random(255),100,255,50);
 int i=0; 
loadPixels();  
// Loop through every pixel
for (int y = 0; y < 255; y++) {
for (int x = 0; x < 255; x++) {
  // Pick a random number, 0 to 255
  float r= (
   (sin(0.062*d + 0.021*x)*cos(0.071*d + 0.037*y)) +
   (sin(0.041*d + 0.052*x)*cos(0.032*d + 0.042*y)) +
   (sin(0.013*d + 0.032*x)*cos(0.042*d + 0.061*y)) + 0
  )*0.33*127 + 128;
  // Create a grayscale color based on random number
  color c = color(sin(r*0.04)*127+127, cos(r*0.05)*127+127, sin(r*r*0.002)*127+128);
  // Set pixel at that location to random color
  pixels[i] = c;
  i++;
}
}
// When we are finished dealing with pixels
updatePixels(); 

}
