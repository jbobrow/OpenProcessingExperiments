

float xr = random(100);
float xg = random(100);
float xb = random(100);
float xoff = random(100);
float xon = random(100);
float xr1 = random(100);
float xr2 = random(100);

int x1;
int y1;
int dx1;
int dy1;

int x2;
int y2;
int dx2;
int dy2;

float r1;
float r2;

void setup() {

  size(1000, 1000);
  background(255);
  smooth();
  x1 = round(random(width-2*r1));
  y1 = round(random(height-2*r1));
  dx1 = 10;
  dy1 = 10;
  x2 = round(random(width-2*r1));
  y2 = round(random(height-2*r1));
  dx2 = 10;
  dy2 = 10;

  r1 = width/4*noise(xr1);
}

void draw() {
  frameRate(15);

  x1 += dx1;
  y1 += dy1;
  if(x1 > width-r1 || x1 < 0) {
    x1 -= 2*dx1;
    dx1 *= -1;
  } 
  if(y1 > height-r1 || y1 < 0) {
    y1 -= 2*dy1;
    dy1 *= -1; 
  }


  x2 += dx2;
  y2 += dy2;
  if(x2 > width-r1 || x2 < 0) {
    x2 -= 2*dx2;
    dx2 *= -1;
  } 
  if(y2 > height-r1 || y2 < 0) {
    y2 -= 2*dy2;
    dy2 *= -1; 
  }
  
  


  //frameRate(1);
  float r1 = width/4*noise(xr1);
  xr1 += 0;
  background(255);
  //background(255*noise(xr), 255*noise(xg), 255*noise(xb));
  pushMatrix();
  translate(x1, y1);
  for(int i = 0; i < 100; i++) {
    line(r1*sin(3*noise(xg)*i), 
    r1*cos(3*noise(xg)*i), 
    r1*sin(3*noise(xg)*(i+5*noise(xb))), 
    r1*cos(3*noise(xg)*(i+5*noise(xb)))); 
  }
  popMatrix();
  xr += 0.01;
  xg += 0.01;
  xb += 0.01;
  strokeWeight(1);
  stroke(0, 0, 0, 100);

  float r2 = width/4*noise(xr2);
  xr2 += 0.01;
  float f = 3*noise(xoff);
  xoff += 0.01;
  float q = 5*noise(xon);
  xon += 0.01;
  pushMatrix();
  translate(x2, y2);
  beginShape();
  for(int i = 0; i < 100; i++) {
    vertex(r1*sin(f*i), r1*cos(f*i)); 
    vertex(r1*sin(f*(i+q)), r1*cos(f*(i+q)));
  }

  endShape();
  popMatrix();
}



