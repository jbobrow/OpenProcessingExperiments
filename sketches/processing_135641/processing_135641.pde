
float i = 0;
void setup() {
  size(600, 600);
}
void draw() {
  background(255);
i=i+0.05;
float posicionX = 200*sin(i);
float posicionY = 300*cos(i);
fill(50,40,245);

  ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/3+posicionX, height/3+posicionY, 20, 20);
  ellipse(width/5+posicionX, height/7+posicionY, 20, 20); ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/10+posicionX, height/11+posicionY, 20, 20); ellipse(width/78+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/30+posicionX, height/50+posicionY, 20, 20); ellipse(width/9+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/3+posicionX, height/3+posicionY, 20, 20); ellipse(width/56+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/68+posicionX, height/3+posicionY, 20, 20); ellipse(width/2+posicionX, height/90+posicionY, 20, 20);
  ellipse(width/3+posicionX, height/3+posicionY, 20, 20); ellipse(width/60+posicionX, height/79+posicionY, 20, 20);
  ellipse(width/100+posicionX, height/350+posicionY, 20, 20);
}
