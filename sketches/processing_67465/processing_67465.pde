
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  
}

int hue = 0;

void draw() {  //draw function loops
    colorMode(HSB, 360, 100, 100);
    background(hue, 100, 100);
    
    hue++;
    if (hue > 360) {
        hue = 0;
    }
}
