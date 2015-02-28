
int w = 700;//screen.height;
int h = 400;//screen.height;
int d = w;


void setup() {

  size(w, h, P3D);
  //frameRate(10); // too fast so changed frame rate 
}

void draw() {
 
 
  background(0, 10);
  camera(w*3, h*2, d/2, 0, 0, 0, 0, 0,-1);
  
    rotateZ(TWO_PI-mouseX*PI/360);
    rotateX(mouseY*PI/360);
  
  //rect (0,0,700,400);
    box(mouseX,mouseX,mouseY);
  
}

