
int alfa, v0, d, h, t, g, y, x;

void setup() {  
  size(250, 250);
  background(255);  
  g = 9.81;
  v0 = 14;
  alfa = radians(45);
  }

x = v0*cos(alfa)*t;
y = v0*sin(alfa)*t-((1/2)g)*(t*t);

