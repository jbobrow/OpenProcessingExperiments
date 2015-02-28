
class Curl
{
  float x, y;
  float mx, my;
  float a, spin;
  
  Curl()
  {
    x = 0;
    y = 0;
    a = random(TWO_PI);
    spin = 0;
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    spin += random(0.001, 0.01)*(random(2)<1?-1:1);
    a += spin;
    mx = cos(a);
    my = sin(a);
    x += mx;
    y += my;
    a=a%TWO_PI;
   }
  
  void render()
  {
    stroke(64, map(a, 0, TWO_PI, 0, 192), map(a, 0, TWO_PI, 32, 128), 64);
    point(x, y);
  }
}

