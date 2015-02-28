
int cnt;
float sz;

//================================================================

void setup() {
  size(200,500, P3D);
  smooth();
  stroke(180);
  
  cnt = 10; //number of "slices" 
  sz = 100; //width and depth of each slice
}

//================================================================

void draw() {
  background(255);
  translate(width/2, height, -sz); //translate to bottom of stack
  cnt = 10 + mouseY/6; //adjust number of slices by mouse position
  float sliceH = (float)height/cnt; //height of each slice
  
  pushMatrix();
    for (int i=0; i<cnt; i++) {
      translate(0, -sliceH, 0);
      float angle = newNoise((float)i/50, (float)frameCount/100, 0) * TWO_PI; //newNoise is smoother
      pushMatrix();
        rotateY(angle);
        box(sz, -sliceH, sz);
      popMatrix();
    }
  popMatrix();
}

//================================================================

float newNoise(float x, float y, float z) {
  if (newNoiseNotInitialized) initNewNoise();
  int X = (int)Math.floor(x) & 255;
  int Y = (int)Math.floor(y) & 255;
  int Z = (int)Math.floor(z) & 255;
  x -= Math.floor(x);
  y -= Math.floor(y);
  z -= Math.floor(z);
  float u = newNoise_fade(x);
  float v = newNoise_fade(y);
  float w = newNoise_fade(z);    
  int A = newNoise_p[X]+Y;
  int AA = newNoise_p[A]+Z;
  int AB = newNoise_p[A+1]+Z;
  int B = newNoise_p[X+1]+Y;
  int BA = newNoise_p[B]+Z;
  int BB = newNoise_p[B+1]+Z;
  return newNoise_lerp2(w, newNoise_lerp2(v, newNoise_lerp2(u, newNoise_grad(newNoise_p[AA], x, y, z), newNoise_grad(newNoise_p[BA], x-1, y, z)),
         newNoise_lerp2(u, newNoise_grad(newNoise_p[AB], x, y-1, z), newNoise_grad(newNoise_p[BB], x-1, y-1, z))),
         newNoise_lerp2(v, newNoise_lerp2(u, newNoise_grad(newNoise_p[AA+1], x, y, z-1), newNoise_grad(newNoise_p[BA+1], x-1, y, z-1)),
         newNoise_lerp2(u, newNoise_grad(newNoise_p[AB+1], x, y-1, z-1), newNoise_grad(newNoise_p[BB+1], x-1, y-1, z-1))));
 }

//================================================================

 float newNoise_fade(float t) { 
   return t * t * t * (t * (t * 6 - 15) + 10); 
 }

//================================================================

 float newNoise_lerp2(float t, float a, float b) { 
   return (b - a)*t + a;
 }

//================================================================

 float newNoise_grad(int hash, float x, float y, float z) {
   int h = hash & 15;
   float u = h<8 ? x : y;
   float v = h<4 ? y : h==12||h==14 ? x : z;
   return ((h&1) == 0 ? u : -u) + ((h&2) == 0 ? v : -v);
 }

//================================================================

void initNewNoise() {
  for (int i=0; i < 256 ; i++) {
    newNoise_permutation[i] = int(random(256));
    newNoise_p[256+i] = newNoise_p[i] = newNoise_permutation[i]; 
  }
  newNoiseNotInitialized = false;
}

//================================================================

int newNoise_p[] = new int[512];
int newNoise_permutation[] = new int[512];
boolean newNoiseNotInitialized = true;
