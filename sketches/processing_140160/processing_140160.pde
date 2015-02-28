
// Math 3: Trigonometry
// Explore drawing circles and arcs with sin() and cos(). Develop a composition from the results of the exploration.

void setup() {
  size(800,800);
}

void draw() {
  background(255);
  float a = mouseX;
  float b = mouseY;
  int radius = 100;
  for (int deg = 0; deg < 360; deg += 2) {
    float angle = radians(deg);
    float x = 400 + (sin(angle) * (radius + a/2));
    float y = 400 + (cos(angle) * (radius + b/2));
    noFill();
    //line(400,400,x,y);
    arc(width/2,height/2,x,y,x,y);
    arc(0,0,x,y,x,y);
    arc(width,0,x,y,x,y);
    arc(0,height,x,y,x,y);
    arc(width,height,x,y,x,y);
  }
}


