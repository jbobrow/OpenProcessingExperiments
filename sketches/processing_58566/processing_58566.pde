
//import processing.opengl.*;

// dx/dt = s(y-x)
// dy/dt = x(r -z) -y
// dz/dt = xy - bz


float s = 10.0;
float b = 8.0/3.0;
float r = 28.0;
float x, y, z;
float zoom = 10;
float dt = 0.005;

float kx1, kx2, kx3, kx4;
float ky1, ky2, ky3, ky4;
float kz1, kz2, kz3, kz4;

int i = 0;
int max_i = 1000;

float[] array_x = new float[max_i];
float[] array_y = new float[max_i];
float[] array_z = new float[max_i];

//float med_x, med_y, med_z;

///PGraphics pg;

void setup() 
{
  //size(screen.width, screen.height, OPENGL);
  size(800, 600, P3D);
  noCursor();
  //pg = createGraphics(screen.width, screen.height, OPENGL);
  strokeWeight(5);
  smooth();
  array_x[0] = array_y[0] = 0.1;
  array_z[0] = 0.1;
  print("Calculating...");
  for (int i = 1; i< max_i; i++) {
    if (i % 100 == 0) print(".");
    calculatePoint(i);
  }
  println(""); 
  println("Finished");
  colorMode(HSB, 360, 100, 100);
  /*
   med_x = (max(array_x) - min(array_x)) / 2;
   med_y = (max(array_y) - min(array_y)) / 2;
   med_z = (max(array_z) - min(array_z)) / 2;
   */
}
float rot_y = 0; 
float rot_x = 0;
float colour_i;
int index = max_i;
void draw()
{
  rot_y += .1;
  rot_x += .015;
  colour_i += 1;
  index++;
  if (index >= max_i) {
    index = 1;
    array_x[0] = array_x[max_i-1];
    array_y[0] = array_y[max_i-1];
    array_z[0] = array_z[max_i-1];
  }
  calculatePoint(index);

  background(0, 0, 0);
  translate(width/2, height/2, 0);
  rotateX(rot_x);
  rotateY(rot_y);
  scale(zoom);  
  //translate(-array_x[index], -array_y[index], -array_z[index]); // center on the bit being drawn.
  translate(-array_x[1], -array_y[1], -array_z[1]); // center on far end of the line.
  
  float min_x = min(array_x);
  float max_x =  max(array_x);
  for (int i = 1; i < max_i; i++) {
    float colour = map(array_x[i], min_x, max_x, 0, 50);
    colour += colour_i;
    colour = colour % 360;
    stroke(colour, 60, 100, 70);
    if (i-1 != index) line(array_x[i-1], array_y[i-1], array_z[i-1], array_x[i], array_y[i], array_z[i]);
  }
  // Draw a huge ball at the new point being drawn
  //translate(array_x[index], array_y[index], array_z[index]);
  //sphere(1);
  
  
  /*
  pg.loadPixels();
   loadPixels();
   for (int y = 5; y < height-1; y++) {
   for(int x = 0; x < width; x++) {
   float h = hue(pg.pixels[x+y*width]);
   float s = saturation(pg.pixels[x+y*width]);
   float b = brightness(pg.pixels[x+y*width]);
   //pixels[x+y*width] = pg.pixels[x+y*width];
   if (h != 0 ) {
   pixels[x+(y+1)*width] = color(h,s,b-10);
   }
   }
   }
   updatePixels();
   pg.updatePixels();
   */
}

void calculatePoint(int i)
{
  x = array_x[i-1]; 
  y = array_y[i-1]; 
  z = array_z[i-1];
  kx1 = fx(x, y, z);
  kx2 = fx(x + dt/2 * kx1, y, z);
  kx3 = fx(x + dt/2 * kx2, y, z);
  kx4 = fx(x + dt * kx3, y, z);

  ky1 = fy(x, y, z);
  ky2 = fy(x, y + dt/2 * ky1, z);
  ky3 = fy(x, y + dt/2 * ky2, z);
  ky4 = fy(x, y + dt * ky3, z);

  kz1 = fz(x, y, z);
  kz2 = fz(x, y, z + dt/2 * kz1);
  kz3 = fz(x, y, z + dt/2 * kz2);
  kz4 = fz(x, y, z + dt * kz3);

  array_x[i] = array_x[i-1] + (dt/6) *  (kx1 + 2 * kx2 + 2 * kx3 + kx4);
  array_y[i] = array_y[i-1] + (dt/6) *  (ky1 + 2 * ky2 + 2 * ky3 + ky4);
  array_z[i] = array_z[i-1] + (dt/6) *  (kz1 + 2 * kz2 + 2 * kz3 + kz4);
}

void keyPressed() {
  if (key == '+' || key == '=') zoom+=1;
  if (key == '-' || key == '_') zoom-=1;
  exit();
}

void mouseMoved() {
  exit();
}

float fx(float x, float y, float z) {
  return (s * (y - x));
}

float fy(float x, float y, float z) {
  return ((x *(r - z)) - y);
}

float fz(float x, float y, float z) {
  return ((x*y) - (b*z));
}


