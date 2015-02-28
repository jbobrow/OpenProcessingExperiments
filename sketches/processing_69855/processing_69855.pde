
float x[] = new float[50000];
float y[] = new float[x.length];
float xv[] = new float[x.length];
float yv[] = new float[x.length];
 
float mrx;
float mry;
 
float r = random(2);
float g = random(2);
float b = random(2);
 
void setup() {
  size(400, 300, P2D);
  stroke(219+50, 129+50, 11+50, 20);
  background(0, 0, 0);
  for(int i = 0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
  mrx = random(-1000, 1000);
  mry = random(-1000, 1000);
}
 
void draw() {
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  for(int i = 0; i < x.length; i++) {
  xv[i] += 5*(noise(x[i]/20+mrx, y[i]/20+mry)-0.5);
  yv[i] += 5*(noise(y[i]/20+mry, x[i]/20+mrx)-0.5);
  xv[i] /= 1.1;
  yv[i] /= 1.1;
  x[i] += xv[i];
  y[i] += yv[i];
  float d = 255*dist(0, 0, xv[i], yv[i]);
  stroke(d*r-g, d*g-b, d*b-r, 30);
  point(x[i], y[i]);
  if(x[i] > width)
  x[i] = 0;
  if(y[i] > height)
  y[i] = 0;
  if(x[i] < 0)
  x[i] = width;
  if(y[i] < 0)
  y[i] = height;
  }
  filter(BLUR, 1);
  mrx += -(float(mouseX)-width/2)/800;
  mry += -(float(mouseY)-height/2)/800;
}
 
void keyPressed() {
  if(key=='c'||key=='C') {
    r = random(1);
    g = random(1);
    b = random(1);
  } else {
    saveFrame("output.png");
  }
}

