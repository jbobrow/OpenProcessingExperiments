
float[] x = new float[1000];
float[] y = new float[1000];
float[] speed = new float[1000];
int i, s, st;
float hu, v;
float a = 0;

void setup () {
  size (720, 480, OPENGL);
  background (0);
  frameRate(60);
  smooth();

  
 
  for (i = 0; i < 1000; i++) {
    x[i] = random (0, width);
    y[i] = random (0, height);
    speed [i] = random (1, 5);
    
  }
}
// Changes color and size
void draw () {
  s = int(random(4));
  st = int(random(255));
  //background (0);
  for (hu = 0; hu < 75; hu +=.25) {
    colorMode(HSB, st);
    stroke(hu, st, hu);
    strokeWeight(s);
  }
  
  
//Controls the number of beads and direction: x, y or both for diagnols 
  for (i = 0; i < 1000; i++) {
    float v = map(sin(i),-1, 1, 0, width);
    
    point(x[i], y[i], v);
  
    y[i] = y[i] + speed[i];
    x[i] = x[i] - speed[i];
  
    if (y[i] < 0) {
      y[i] = height;
    }
    if (x[i] < 0) {
      x[i] = width;
    }
  }
  
}



