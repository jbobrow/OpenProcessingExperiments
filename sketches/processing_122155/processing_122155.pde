
int d;
int[] f;
void setup() {  //setup function called initially, only once
  size(256, 256);
  f = new int[256*258];
//  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  d = 0;
}

void draw() {  //draw function loops 
  d++;
 int i=0; 
loadPixels();  

for(i=0; i<512; i++) f[i + 256*256] = random(255);

// Loop through every pixel
for (int y = 0; y < 256; y++) {
for (int x = 0; x < 256; x++) {
  f[i] = (f[i+256] + f[i-1] + f[i+1] + f[i+512]) / 4;
  // Create a grayscale color based on random number
  float v1 = cos(0.7*f[i])*0.5 + 0.5;
  float v2 = sin(0.2*f[i])*0.5 + 0.6;
//  color c = color(sin(f[i])*120 + 120, sin(f[i]*0.3)*120 + 120,sin(f[i])*40 + 40);
//  color c = color(v1*250, v1*120 + v2*60, v2*60);
  color c = color(int(v1*255),f[i]+40,250);
  // Set pixel at that location to random color
  pixels[i] = c;
  i++;
}
}
// When we are finished dealing with pixels
updatePixels(); 

}
