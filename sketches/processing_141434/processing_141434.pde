
float len, maxlen, ballrad, halfx, halfy;
float theta = 0;
float sz = 80;                      
int num = 16;                       // number of circles per color
float hu1, hu2, hu3, hu4;           
int ahi = 140, alow = 60;           // alpha transparency values for first set & second set
int alph = alow;
int ballzlow = 480, ballzhi = 540;  // winding values for first set and second set
int ballz = ballzlow;

void setup() {
  size(480, 480);
  halfx = width/2;
  halfy = width/2;
  ballrad = sz/2;
  maxlen = halfx - ballrad;
  colorMode(HSB);
  strokeWeight(3);
  hu1 = 25;                         // four hue values per set
  hu2 = 76;
  hu3 = 44;
  hu4 = 214;
}

void draw() {
  background(0, 0, 255);
  len = maxlen * sin(radians(theta)); 
  for (int i = 0; i < num; i++) {
    float temp = len*(i+1)/num;
    balls(ballz/num * i, temp);
  }
  
  theta+=4;                         // controls animation speed (lower = slower)

  if (theta % 180 == 0) {           // every 180 degrees, switch sets (try 360 also)
    if (ballz == ballzlow) {
      ballz = ballzhi;
    } 
    else {
      ballz = ballzlow;
    }
    if (alph == alow) {
      alph = ahi;
    } 
    else {
      alph = alow;
    }
  }
}


void balls(float angle, float dist) {
  sz = map(dist, 0, maxlen, 40, 80);  
  float inner1 = sz/8;
  float inner2 = sz/2;
  pushMatrix();
  stroke(0, 0, 0, 125);
  translate(halfx, halfy);
  rotate(radians(angle));
  fill(hu1, 255, 255, alph);
  ellipse(dist, 0, sz, sz);
  ellipse(dist, 0, inner1, inner1);
  ellipse(dist, 0, inner2, inner2);
  fill(hu2, 255, 255, alph);
  ellipse(0, dist, sz, sz);
  ellipse(0, dist, inner1, inner1);
  ellipse(0, dist, inner2, inner2);
  fill(hu3, 255, 255, alph);
  ellipse(-dist, 0, sz, sz);
  ellipse(-dist, 0, inner1, inner1);
  ellipse(-dist, 0, inner2, inner2);
  fill(hu4, 255, 255, alph);
  ellipse(0, -dist, sz, sz);
  ellipse(0, -dist, inner1, inner1);
  ellipse(0, -dist, inner2, inner2);
  popMatrix();
}

