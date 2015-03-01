
int fps = 24;
int copies = 100;
int objectWidth = 100;
int objectHeight = 100;
float rate = 1; 
float amplitude = 1;

void setup() {
  size(500, 500);
  background (0);
  rectMode(CENTER);
  frameRate(fps);
  colorMode(HSB);
}

void draw() {
  
  background(255);
  int m = millis();
  float Hz = rate  * 1000;
  float lfoSaw = map((m % Hz), 0, 1000, 0, amplitude); //Sawtooth LFO
  float lfoSine = map(sin(radians(360) * m % Hz), -1, 1, 0, amplitude); //Sinewave LFO

  
  for(float i = 0; i < 500; i = i + objectWidth + (lfoSine * 20)) { //try changing to lfoSine
    for(float j = 0; j < 500; j = j + objectHeight + (lfoSaw * 20)) { //try changing to lfoSine
    
    float objWidth = objectWidth;
    float objHeight = objectHeight;
    float tx = 0 + ((objWidth / 2) + i);
    float ty = (objHeight / 2) + j;
    float h = /*lfoSaw * */255;
    float s = 200;
    float b = /*lfoSine * */255;
    float a = /*lfoSaw * */50;
    
    movingObj(tx, ty, objWidth, objHeight, h, s, b, a);
    
  }
  }
 println("Sine LFO: " + lfoSine);
 println("Divide by milliseconds: " + Hz);
}

void movingObj(float x, float y, float objW, float objH, float hue, float sat, float bri, float alpha) {
  
  fill(hue, sat, bri, alpha);
  stroke(255, 20);
    rect(x,y, objW, objH);
}


