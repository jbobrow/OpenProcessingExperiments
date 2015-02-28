
// Math 3: Trigonometry
// Generate a series of spirals and organize them into a composition

void setup() {
  size(800,800);
  background(255);
}

void draw() {
  float a = mouseX;
  float b = mouseY;
  float radius = a*0.1;
  float cx = width/2;
  float cy = height/2;
  float px = cx;
  float py = cy;
  for (int deg = 0; deg < 360*7; deg += 12) {
    float angle = radians(deg);
    float x = cx + (sin(angle) * radius);
    float y = cy + (cos(angle) * radius);
    stroke(a/4,50,b/4,50);
    noFill();
    ellipse(x,y/2,x/3,x/3);
    ellipse(x/2,y,x/3,x/3);
    ellipse(x,y,x/3,x/3);
    //line(px,py,x,y);
    radius = radius * 1.045;
    px = x;
    py = y;
  }
}


