
//
// herring bones in the dryer
//

int g_rotation;  // in degrees
boolean g_increasing;
boolean g_paused;

int k_white = 100;
int k_rotation_step = 20;
int k_max_steps = 36;


void setup() { 
  size(512, 512); 
  colorMode(RGB, k_white);
  smooth();
  background(k_white);
  stroke(0);
  g_rotation = 0;
  g_increasing = true;
  g_paused = false;
}

void draw() { 
  filter(BLUR);
  go();
  
  if (g_increasing) {
    g_rotation += k_rotation_step;
    if (g_rotation >= k_rotation_step * k_max_steps) {
      g_increasing = false;
    }
  } else {
    g_rotation -= k_rotation_step;
    if (g_rotation <= k_rotation_step) {
      g_increasing = true;
    }
  }    
} 

void keyPressed() {
  togglePaused();
}

void mousePressed() {
  togglePaused();
}

void togglePaused() {
  if (g_paused) loop(); else noLoop();
  g_paused = !g_paused;
} 

void go() {
  strokeCap(SQUARE);
  strokeJoin(MITER);
  stroke(g_rotation / (k_rotation_step * k_max_steps / k_white));
  
  // herringbone
  strokeWeight(1);
  pushMatrix();
  translate(width/2, height/2);
  rotate(g_rotation / 180.0 * PI);
  beginShape(LINES);  
  for (int x = 0; x < width; x += 5) {
    vertex(x - width/2, -sin(x * TWO_PI / width) * 20);
    vertex(x - width/2 - sin(x * TWO_PI / width) * 20, 0);
    vertex(x - width/2 - sin(x * TWO_PI / width) * 20, 0);
    vertex(x - width/2, sin(x * TWO_PI / width) * 20);
  }
  popMatrix();
  endShape();
}

