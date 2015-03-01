
void setup() {  //setup function called initially, only once
    size(250, 250);
    colorMode(HSB, 360, 100, 100);
}

void draw() {  //draw function loops 
  fill(random(360), random(100), random(100));
  ellipse(random(250), random(250), random(100), random(200));
 }

