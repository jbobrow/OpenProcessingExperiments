
float startScale=0.005;
float octaveScaleFactor=0.2;
int octaves = 5;
float[] octaveScaleFactors = new float[octaves];
float scaleFactorPerOctave = 1.6;
float erosionStrength = 0.1;

void setup(){
  size(400, 400);
  render();
}

void draw(){
}

void keyTyped() {
  if(int(key) == 49) startScale -= 0.001;
  if(int(key) == 50) startScale += 0.001;
  if(int(key) == 51) octaveScaleFactor -= 0.05;
  if(int(key) == 52) octaveScaleFactor += 0.05;
  if(int(key) == 53) octaves--;
  if(int(key) == 54) octaves++;
  if(int(key) == 55) scaleFactorPerOctave -= 0.02;
  if(int(key) == 56) scaleFactorPerOctave += 0.02;
  if(int(key) == 57) erosionStrength -= 0.02;
  if(int(key) == 48) erosionStrength += 0.02;
  if(int(key) >= 48 && int(key) <= 57){
    print("Render... ");
    octaveScaleFactors = new float[octaves];
    render();
    print(" done\n");
  }
  println(int(key));
}

void renderHUD(){
  PFont myFont = createFont("Arial", 11);
  textFont(myFont);
  fill(255, 255, 0);
  text("(1/2) Scale of Features: " + startScale, 10, 20);
  text("(3/4) Verical Scale: " + octaveScaleFactor, 10, 30);
  text("(5/6) Octaves: " + octaves, 10, 40);
  text("(7/8) Octave Scales: " + scaleFactorPerOctave, 10, 50);
  text("(9/0) Erosion: " + erosionStrength, 10, 60);
}

void render(){
  background(0);
  
  float xf, yf, altitude;
  for(float x=0; x < width; x++) {
    for(float y=0; y < height; y++) {
      xf = x;
      yf = y;
      altitude = myNoise(xf, yf, 0);
      for(int oc = 1; oc < octaves; oc++){
        float[] off = getSlope(xf, yf, oc);
        xf += off[0] / scaleFactor(oc);
        yf += off[1] / scaleFactor(oc);
        float val = myNoise(xf, yf, oc);
        altitude += (val - 0.5) * octaveScaleFactor;
      }
      stroke(altitude*255);
      point(x, y);
    }
  }
  
  renderHUD();
}

float[] getSlope(float x, float y, int oc){
  float f = erosionStrength / scaleFactor(oc);
  float[] result = new float[2];
  result[0] = myNoise(x, y, oc) - myNoise(x + f, y, oc);
  result[1] = myNoise(x, y, oc) - myNoise(x, y + f, oc);
  return result;
}

float scaleFactor(int octave){
  if(octaveScaleFactors[octave] == 0){
    octaveScaleFactors[octave] = startScale * pow(scaleFactorPerOctave, octave);
  }
  return octaveScaleFactors[octave];
}

float myNoise(float x, float y, int octave){
  return noise(x * scaleFactor(octave) + octave * width, y * scaleFactor(octave));
}

