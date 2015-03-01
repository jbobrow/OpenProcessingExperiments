
class star {
  float x, y;
  int z, r, theta;
  color c;
  float size;
  star() { // constructor
    init(true);
   
  }
  void init(boolean isFirst){
    if(isFirst){
    r = (int)random(0, width);
    }
    else
    {
     r = (int)random(width*0.6, width);  
    }
    theta = (int) random(0, 360);
    calculate();
    z = (int)random(0, -10);
    c = color(random(0, 80), 100, 100);
    size = random(1, 3);
  }

  void render() {
    stroke(c);
    strokeWeight(size);
    point(x, y, z);
  }

  void move() {
    if(r == 0) {
      init(false);
    }
    else{
    theta++;
    r--;
    calculate();
    }
  }

  void calculate() {
    x = width/2 + r*cos(radians(theta));
    y = height/2 + r*sin(radians(theta));
  }

}
star[] stars;
int MAX_STARS = 10000;
void setup() {
  size(600, 600, P3D);
  stars = new star[MAX_STARS];
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i] = new star();
    frameRate(15);
  }
  colorMode(HSB,360,100,100);
}
void draw() {
  background(#200031);
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i].render();
    stars[i].move();
  }
}
