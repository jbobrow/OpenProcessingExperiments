
int w = 700;//screen.height;
int h = 400;//screen.height;
int d = w;


void setup() {

  size(w, h, P3D);
  frameRate(10); // too fast so changed frame rate 
}

void draw() {
  camera(w*3, h*3, d/2, 0, 0, 0, 0, 0,-1);
  
  rect (0,0,700,400);
}

