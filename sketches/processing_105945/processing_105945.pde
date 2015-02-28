
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7539*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* See also https://forum.processing.org/topic/can-anyone-provide-tips-guidelines-of-optimizing-this-code */

float startScale=0.005;
float octaveScaleFactor=0.2;
float scaleFactorPerOctave = 1.6;
float erosionStrength = 0.1;
int octaves = 5;
float[] octaveScaleFactors = new float[octaves];
 
void setup(){
  size(500, 250);
  colorMode(HSB);
  updateOctaveScaleFactors();
  PFont myFont = createFont("Arial", 11);
  textFont(myFont);
//  loadPixels();
  render();
}

void draw(){
}

boolean keyUI, toggleHUD;
boolean toggleGrayscale = true;
float hueOffset, saturationOffset, brightnessOffset;
void keyTyped() {

  if(key == 'f') {startScale -= 0.001; keyUI = true;}
  if(key == 'F') {startScale += 0.001; keyUI = true;}
  if(key == 'v') {octaveScaleFactor -= 0.05; keyUI = true;}
  if(key == 'V') {octaveScaleFactor += 0.05; keyUI = true;}
  if(key == 'n') {octaves--; keyUI = true;}
  if(key == 'N') {octaves++; keyUI = true;}    // FIX OUT OF BOUNDS HERE!!!
  if(key == 'o') {scaleFactorPerOctave -= 0.02; keyUI = true;}
  if(key == 'O') {scaleFactorPerOctave += 0.02; keyUI = true;}
  if(key == 'e') {erosionStrength -= 0.25; keyUI = true;}
  if(key == 'E') {erosionStrength += 0.25; keyUI = true;}

  if(key == 'g' || key == 'G') {toggleGrayscale = !toggleGrayscale; keyUI = true;}  
  if(key == 'h') {hueOffset -= 5; keyUI = true;}
  if(key == 'H') {hueOffset += 5; keyUI = true;}
  if(key == 's') {saturationOffset -= 5; keyUI = true;}
  if(key == 'S') {saturationOffset += 5; keyUI = true;}  
  if(key == 'b') {brightnessOffset -= 5; keyUI = true;}
  if(key == 'B') {brightnessOffset += 5; keyUI = true;}
  
  if(key == '`' || key == '~') {toggleHUD = !toggleHUD;}
  if(toggleHUD) renderHUD();
  if (toggleHUD == false && keyUI == false) render();  // Refresh scene.
  
  if(key == 'r' || key == 'R') {noiseSeed(int(random(100))); keyUI = true;}
  
  if(keyUI == true){
    // print("Render... ");
    octaves = constrain(octaves, 1, octaves);  // Keep array in bounds.
    octaveScaleFactors = new float[octaves];
    updateOctaveScaleFactors();
    render();
    if(toggleHUD) renderHUD();
    // print(" done\n");
    // println(key);
  }
   keyUI = false;
}

void renderHUD(){
  fill(40, 255, 255);
  textMode(MODEL);
  text("[ `, ~ ] HUD Toggle", 10, 20);
  
  text("[ n, N ] Number of Octaves:    " + octaves, 10, 40);
  text("[ o, O ] Octave Scales:           " + scaleFactorPerOctave, 10, 50);
  text("[ f,  F ] Scale of Features:       " + startScale, 10, 60);
  text("[ v, V ] Vertical Scale:              " + octaveScaleFactor, 10, 70);
  text("[ e, E ] Erosion:                        " + erosionStrength, 10, 80);
  
  text("[ g, G ] HSB Toggle:                " + toggleGrayscale, 10, 100);
  text("[ h, H ] Hue Offset:                  " + hueOffset, 10, 110);
  text("[ s, S ] Saturation Offset:         " + saturationOffset, 10, 120);
  text("[ b, B ] Brightness Offset:        " + brightnessOffset, 10, 130);
  
  text("[ r, R ] New Render        ", 10, 150);  

}

float xf, yf, altitude, ocs, f, slope_x, slope_y, val, greyval;
void render(){

  for(int x=0; x < width; x++) {
    int row = x*width;
    for(int y=0; y < height; y++) {
      xf = x;
      yf = y;
      altitude = myNoise(xf, yf, startScale, 0);
      for(int oc = 1; oc < octaves; oc++) {
        ocs = octaveScaleFactors[oc];
        
        // Erosion
        f = erosionStrength / ocs;
        slope_x = myNoise(xf, yf, ocs, oc) - myNoise(xf + f, yf, ocs, oc);
        slope_y = myNoise(xf, yf, ocs, oc) - myNoise(xf, yf + f, ocs, oc);

        xf += slope_x / ocs;
        yf += slope_y / ocs;
        val = myNoise(xf, yf, ocs, oc);
        altitude += (val - 0.5) * octaveScaleFactor;
      }
      
      greyval = altitude*255;
      color grey = color(greyval, 0, greyval + brightnessOffset);
      if (toggleGrayscale) {
        grey = color(greyval + hueOffset, 
                     greyval + saturationOffset,
                     greyval + brightnessOffset);
      }
//      pixels[row + y] = grey;
      set(x, y, int(grey));
    }
  }
//  updatePixels();
}
 
float myNoise(float x, float y, float ocs, int octave) {
  return noise(x * ocs + octave * width, y * ocs);
}

void updateOctaveScaleFactors() {
  for (int oc = 1; oc < octaves; oc++) {
    octaveScaleFactors[oc] = startScale * pow(scaleFactorPerOctave, oc);
  }
}
