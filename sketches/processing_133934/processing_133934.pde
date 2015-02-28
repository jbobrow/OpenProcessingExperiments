
float aumenta = 0;
void setup() {
  size(600, 600);
}
void draw() {
  background(116,0,0);
  aumenta=aumenta+0.01;
  float seno = 500*sin(aumenta);
  ellipse(width/2,height/2,seno,seno);
}

