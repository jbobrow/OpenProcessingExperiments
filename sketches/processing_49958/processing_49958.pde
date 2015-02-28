
import controlP5.*;

public int RANDOM_STEPS = 2;
public int SAMPLES = 100000;
int EFFECTIVE_SAMPLES = 0;
int EFFECTIVE_RANDOM_STEPS = 0;

int CONTROL_WIDTH = 100;
int CONTROL_HEIGHT = 10;
int CONTROL_SPACING = 2;
ControlP5 controls;

void setup() {
  size(600, 300);

  int y = CONTROL_SPACING;
  controls = new ControlP5(this);
  controls.addSlider("SAMPLES", 0, 500000, SAMPLES, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
  controls.addSlider("RANDOM_STEPS", 0, 20, RANDOM_STEPS, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
}

void draw() {
  // Only draw if the parameters are new or updated
  if (EFFECTIVE_SAMPLES != SAMPLES || EFFECTIVE_RANDOM_STEPS != RANDOM_STEPS) {
    EFFECTIVE_SAMPLES = SAMPLES;
    EFFECTIVE_RANDOM_STEPS = RANDOM_STEPS;
    background(0);
    stroke(120);
    int highest = 0;
    int[] vals = new int[width];
  
    for (int i=0; i<SAMPLES; i++) {
      int new_number = (int)(rand()*20+width/2);
      if (new_number >= 0 && new_number < width) {
        int new_SAMPLES = vals[new_number]++;
        if (new_SAMPLES > highest) highest++;
      }
    }
  
    for (int x=0; x<width; x++) {
      line(x, height, x, height-((float)vals[x]/(float)highest)*height);
    }
  }
}

float rand() {
  float total = 0.0;
  for (int i=0; i<RANDOM_STEPS; i++) {
    total += random(1.0);
  }
  
  // The square root is unnecessary if you set RANDOM_STEPS to 12
  return (total - (float)RANDOM_STEPS/2) * (sqrt(12.0/(float)RANDOM_STEPS));
}

