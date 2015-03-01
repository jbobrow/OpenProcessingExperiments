
lPoints[] P = new Points[45];
int len = 5;
PImage butterfly;


void setup() {
  size(600,600);
  for (int i=0;i<P.length;i++) {
    P[i] = new Points();
    butterfly = loadImage("face.png");
     
  }
}
 float timer = 0;
 
 
void draw() {
  
  background(-2, 20);
  P[0].move(mouseX, mouseY);
  P[0].display(#F20055);
  for (int i=1;i<P.length;i++) {
    float t = atan2(P[i].y-P[i-1].y, P[i].x-P[i-1].x);
    float sx = P[i-1].x + len*cos(t);
    float sy = P[i-1].y + len*sin(t);
    sx+=0.2; // for fluidic motion
    sy+=0.5; // for fluidic motion
    P[i].move(sx, sy);
    P[i].display(#C5F200);
    //stroke(0);
    //line(P[i].x, P[i].y, P[i-1].x, P[i-1].y);
    
    image(butterfly,mouseX-50, mouseY-50,150,150);

  }
}

 
 
class Points {
  float x=0, y=0;
  void display(color c) {
    fill(255,142,28);
    noStroke();
    ellipse(x, y, 20, 20);
  }
  void move(float x, float y) {
    this.x = x;
    this.y = y;
  }
}


