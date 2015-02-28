
void setup() {
  size(1920, 1080);
  colorMode(HSB);
}
void draw() {
  float x = 0;
  while(x < width/2) {
    float y = 0;
    while(y < height/2) {
      float f = float(frameCount);
      //float n = 20 * sin(f/50 + sin(y/99)*x/161 - y/323) *sin(-f/70 - x/249 + sin(x/79)*y/118);
      float n = 20 * cos(f/50 + cos(y/99)*x/161 - y/323) *cos(-f/70 - x/249 + sin(x/79)*y/118);
      float nx = cos(f/50 + cos(y/99)*x/161 - y/323);
      float ny = cos(-f/70 - x/249 + sin(x/79)*y/118);
      //stroke(128 + 128 * sin(ny), 255, 255 );
      stroke(128+128*sin(n), 128+128*sin(ny), 255 );
      strokeWeight(9);//толщина линии
      point(x, y);
      y = y + 10;
    }
    x = x + 10;
  }
}    
