
int rings = 20;
int t = 0;
int seed = floor(random(1000));

void setup() {

  size(500,500);
  background(0);
}

void draw() {
  background(0);
  t+= mouseX;
  for (int i = 0; i < rings; i++) {
    
    int ntris = ceil(noise(seed+i, mouseX/500.0)*10);
    ntris = 10;
    float rad = 250*noise(seed+(t/20000.0)+1000, seed+i);
    float width = mouseX * noise(seed+i, t/10000.0);
    float height = mouseX * noise(seed+i+500, t/10000.0);
    
    if (i > rings-5) {
      width /= 5.0;
      height /= 5.0;
      rad /= 2.0;
    }
    
    pushMatrix();
    translate(250,250);
    
    noStroke();
    
    float rcolor = 4 * noise(seed+(mouseX + 1000 + t/100.0)/500, seed+i);

    if (rcolor > 2) {
      if (i > rings-5) {
        fill(0,160,255);
      }
      else {
        fill(230,0,100);
      }
    }
    else {
      fill(0);
    }
    
    //rotate(t/10000.0);
    rotate(i);
    
    for (int j = 0; j < ntris; j++) {
      rotate(PI*2 / ntris);
      triangle(-width, rad, width, rad, 0, rad+height);
    }
    popMatrix();
  }
}
