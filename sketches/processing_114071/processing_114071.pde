
float xoff = 300;
float yoff= 1;

float xoff2 = 1;
float yoff2= 300;

float xoff3 = 1;
float yoff3= 0.0;

float xoff4 = 0.0;
float yoff4= 1;

void setup() {
  size(750, 750);
  background(255);
}

void draw() {
  
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  yoff = yoff + .01;
  float h = noise(yoff) * height;
  ellipse(n, h, 20, 20);

  xoff2 = xoff2 + .01;
  float n2 = noise(xoff2) * width;
  yoff2 = yoff2 + .01;
  float h2 = noise(yoff2) * height;
  ellipse(n2, h2, 20, 20);

  xoff3 = xoff3 + .01;
  float n3 = noise(xoff3) * width;
  yoff3 = yoff3 + .01;
  float h3 = noise(yoff3) * height;
  ellipse(n3, h3, 20, 20);

  xoff4 = xoff4 + .01;
  float n4 = noise(xoff4) * width;
  yoff4 = yoff4 + .01;
  float h4 = noise(yoff4) * height;
  ellipse(n4, h4, 20, 20);
  
   int frame = frameCount % 3000;
  
  if(frame == 2999){
    background(255);
  }
}
