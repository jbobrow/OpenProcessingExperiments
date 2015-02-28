
void setup() {
  size(1024,768);
  textSize(30);
}

int slices = 1;
void draw() {
  background(0);
  translate(width/2, height/2);
  float r = min(width,height) / 2.3;
  scale(r, r);
  stroke(255);
  fill(255);
  ellipse(0, 0, 2, 2);
  stroke(255,0,0);
  strokeWeight(0);
  double x = -1, dx = 2.0/slices;
  double sum = 0;
  for (int i = 1; i <= slices; i++, x += dx) {
    double y = Math.sqrt(1-x*x);
    sum += 2*y;
    fill(255,0,0);
    rect ((float)x, (float)-y, (float)dx, (float)y);
    //println (i,dx,(float)x, (float)-y, (float)x, (float)+y);
    double area = sum * dx;
    fill(0);
    stroke(0);
    text(String.valueOf(area), -0.3, .3);
  }
  slices *= 2;
  if (slices > 256)
    slices = 1;
  delay(1000);
}
  
  
  
  
  
  
  
  
  
  


