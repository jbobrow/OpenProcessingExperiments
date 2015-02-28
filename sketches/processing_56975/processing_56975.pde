
int n = 0;
boolean toggle = false;

void setup() {
  size(200, 150);
  background(255);
  smooth();
  frameRate(30);
}

// sine distortion
float g(float u, float v) {
  //n = 5;
  return (height/4)*sin(PI*v/height)*sin(TWO_PI*(u-1)*(n/2f)/width)+v;
}

void mouseMoved(){
  n = (int)map((float)mouseX/width,0,1,0,15);
}
void keyReleased(){
  toggle = !toggle;
}

void draw() {
  background(255);
  
  for (int v=0; v<height; v++) {
    for (int u=0; u<width; u++) {
      float x = u;
      float y = g(u, v);

      if(toggle) {
          float d = dist(x, y, u, v);
          int c = (int)map(d, 0, height/4, 255, 0);
          stroke(color(c));
          point(u, v);
          point(x,y);
      }
      else{
          if ((v % 20 <10)&&(u>0)) {
            float x0 = u-1;
            float y0 = g(u, v);
            stroke(255, 0, 0);
            line(x0, y0, x, y);
          }
      }
    }
  }

}

