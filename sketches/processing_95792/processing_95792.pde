
// total number of possible points
int numpoints = 200;
float[] x = new float[numpoints];
float[] y = new float[numpoints];
float[] a = new float[numpoints];
float[] b = new float[numpoints];

/// number of points to draw
int drawpoints = 0;

// background stars shining
int starsize;
int stargrowthrate;
int speed;

void setup() {
  size(500, 500);
  
  // for little background cells
  for (int i = 0; i < numpoints; i++) {
    a[i] = random(width);
    b[i] = random(height);
  }
  starsize = 1;
  speed = 2;
  stargrowthrate = speed;
  
}

void mousePressed() {
  drawpoints = 0;
}

void mouseDragged() {
  if (drawpoints < numpoints) {
  // add a new point to the end of the list of points
  x[drawpoints] = mouseX+4000;
  y[drawpoints] = mouseY+4000;

  drawpoints += 1;
  }
}

int frame = 0;

void draw() {
  frame++;
  background(0);
  translate(-4000, -4000);
  noStroke();
  for (int i = 3; i < numpoints; i++) {
    float size = ((frame + i) * 0.3) % 20;
    
    //cell that makes blue cell shrink 1
    //fill(random(0, 255), random(0, 255), random(0, 255));
    fill(255, 228, 0);
    ellipse(x[i], y[i], size, size);
    //cell that makes blue cell shrink 2
    fill(206, 242, 121);
    ellipse(x[i-1], y[i-1], size, size);
    //line between cells
    fill(255, 0, 0);
    curve(x[i], y[i], x[i-1], y[i-1], x[i-2], y[i-2], x[i-3], y[i-3]); 
    //cell that makes blue cell shrink 3
    fill(0, 130, 153);
    ellipse(x[i-2], y[i-2], size, size);
    //main blue cells
    fill(0, 0, 255);
    ellipse(x[i-3], y[i-3], size, size);
  
    if (! mousePressed) {
    //float phase = frame / random(0, 20);
    float phase = frame/ i;
    x[i] = x[i] + sin(phase);
    y[i] = y[i] + cos(phase);
    }
  }
    //background cells
    translate(4000, 4000);
    fill(255, random(10, 80));
    for (int i = 0; i < numpoints; i++) {
      ellipse(a[i], b[i], 2, 2);
    }
    
    if(starsize >= width/30) {
      stargrowthrate = -speed;
    } else if(starsize <= 0) {
      stargrowthrate = speed;
    }
    
    starsize = starsize + stargrowthrate;
}
