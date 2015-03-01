
// Scale, pixel size, color contrast
final float fsc = 256, fsz = 1;
float sc = fsc, sz = fsz, cont = 1;

// Lower and Upper x and y bounds
float fxl, fxu, fyl, fyu;
float xl, xu, yl, yu;

// Constant real, constant imaginary, increment
final float fincr = 1/fsc;
float cr, ci, incr = fincr;

// Draws per second
float draws;

final long RNGesus = (long)random(10000);

int fractal = 0;
// 0 = mandelbrot
// 1 = julia
// 2 = julia test

boolean mouseJul = true;

void setup() {
  switch(fractal) {
  case 0:
    smand();
    break;
  case 1:
    sjul();
    break;
  case 2:
    sjul2();
    break;
  }
  // sets size
  // size(int(sc*sz*(xu-xl)), int(sc*sz*(yu-yl))));
  size(1024, 768);
  colorMode(HSB);
  noStroke();
  println("1");
}

void draw() {
  switch(fractal) {
  case 0:
    dmand();
    break;
  case 1:
    djul();
    break;
  case 2:
    djul2();
    break;
  }
}

void mouseClicked() {
  if (incr > 0.0000002) {
    float sx = mouseX/(sc*fsz)+xl;
    float sy = mouseY/(sc*fsz)+yl;
    float qx = (xu-xl)/4, qy = (yu-yl)/4;
    float nxl = sx - qx, nyl = sy - qy;
    if (nxl < fxl)
      nxl -= 2.5 + nxl;
    if (nxl+2*qx > fxu)
      nxl -= 1 - (nxl+2*qx);
    if (nyl < fyl)
      nyl -= 1 + nyl;
    if (nyl+2*qy > fyu)
      nyl -= 1 - (nyl+2*qy);

    xl = nxl;
    xu = nxl+2*qx;
    yl = nyl;
    yu = nyl+2*qy;
    cr = xl;
    ci = yl;
    incr /= 2;
    sc *= 2;
    background(128);
    //println(sx+"|"+sy);
    if (fractal == 1)
      sz *= 2;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    xl = fxl;
    xu = fxu;
    yl = fyl;
    yu = fyu;
    cr = xl;
    ci = yl;
    incr = fincr;
    sc = fsc;
    sz = fsz;
  }

  if (key == ' ') {
    mouseJul = !mouseJul;
    jr = mouseX/(sc*fsz)+xl;
    ji = mouseY/(sc*fsz)+yl;
    cr = xl;
    ci = yl;
  }
}

void sjul() {
  fxl = -2; 
  fxu = 2;
  fyl = -1.5; 
  fyu = 1.5;

  xl = fxl; 
  xu = fxu;
  yl = fyl; 
  yu = fyu;
}
void djul() {
  translate(sc*fsz*-xl, sc*fsz*-yl);
  background(255);
  randomSeed(RNGesus);
  julia(random(-1, 1), random(-1, 1), 16);
}

void julia(float x, float y, int it) {
  fill(0);
  rect(int(x*sc*fsz/2), int(y*sc*fsz/2), sz, sz);
  if (it > 1) {
    if (mouseJul) {
      jr = mouseX/(sc*fsz)+xl;
      ji = mouseY/(sc*fsz)+yl;
    }
    x -= jr;
    y -= ji;
    float tx = rf1(x, y);
    float ty = if1(x, y);
    julia(tx, ty, it-1);
    julia(-tx, -ty, it-1);
  }
}

float rf1(float a, float b) {
  return log(sqrt(sq(a)+sq(b)));
}

float if1(float a, float b) {
  return atan2(b, a);
}

float rf2(float a, float b) {
  return sqrt((a+sqrt(sq(a)+sq(b)))/2);
}

float if2(float a, float b) {
  return sign(b)*sqrt((-a+sqrt(sq(a)+sq(b)))/2);
}

float sign(float b) {
  if (b >= 0)
    return 1;
  else return -1;
}

void smand() {
  fxl = -2.5; 
  fxu = 1;
  fyl = -1; 
  fyu = 1;
  
  xl = fxl; 
  xu = fxu;
  yl = fyl; 
  yu = fyu;
  
  cr = xl; 
  ci = yl;
  
  draws = sq(sc*sz)*(xu-xl)*(yu-yl)/16;
}
void dmand() {
  translate(sc*sz*-xl, sc*sz*-yl);
  for (int i = 0; i < draws; i++)
    if (ci <= yu) {
      int iter = int(cont)*mandelbrot(0, 0, int(255/cont), 0);
      fill(256-iter/*, 255, 192*/);
      rect(int(cr*sc*sz), int(ci*sc*sz), sz, sz);
      if (cr <= xu)
        cr += incr;
      else {
        cr = xl;
        ci += incr;
      }
    }
}
int mandelbrot( float x, float y, int max, int it) {
  float sqx = x*x, sqy = y*y;
  if (it <= max && sqx+sqy < 4)
    return mandelbrot(sqx-sqy+cr, 2*x*y+ci, max, it+1);
  else 
    return it;
}

float jr = -0.621;
float ji = 0;

void sjul2() {
  fxl = -2; 
  fxu = 2;
  fyl = -1.5; 
  fyu = 1.5;

  xl = fxl; 
  xu = fxu;
  yl = fyl; 
  yu = fyu;

  cr = xl;
  ci = yl;

  draws = sq(sc*sz)*(xu-xl)*(yu-yl)/16;
}
void djul2() {
  translate(sc*sz*-xl, sc*sz*-yl);
  for (int i = 0; i < draws; i++)
    if (ci <= yu) {
      int iter = jul2(cr, ci, 256, 0, 2/*max(dist(cr, ci, 0, 0), 2.0)*/);
      fill((iter*16)%256/*, 255, 192*/);
      rect(int(cr*sc*sz), int(ci*sc*sz), sz, sz);
      if (cr <= xu)
        cr += incr;
      else {
        cr = xl;
        ci += incr;
      }
    }
}

int jul2(float x, float y, int max, int it, float range) {
  float sqx = x*x, sqy = y*y;
  if (it < max && dist(x, y, 0, 0) < range) {
    
    // z^2
    //float nx = x*x-y*y+jr;
    //float ny = 2*x*y+ji;
    
    // z^3
    //float nx = x*sqx-3*x*sqy+jr;
    //float ny = 3*sqx*y-sqy*y+ji;

    // e^z
    //float ex = exp(x);
    //float nx = ex*cos(y)+jr;
    //float ny = ex*sin(y)+ji;
    
    //ln(z)
    //float nx = dist(x, y, 0, 0)+jr;
    //float ny = atan2(y, x)+ji;
    
    //exp(z) works
    float ex = exp(sqx*x-3*sqy*x);
    float theta = 3*sqx*y-sqy*y;
    float nx = ex*cos(theta)+jr;
    float ny = ex*sin(theta)+ji;

    //float denom = 1/sq(sq(y-x*y)+sq(x+(sqy-sqx)/2));
    /*float nx = denom(- pow(x, 7)/24 +
      pow(x, 6)/24 - pow(2, 1) * pow(x, 5)/24 - 
      pow(x, 5)/24 + pow(2, 1) * pow(x, 4)/24 +
      pow(x, 4)/24 - pow(4, 1) * pow(x, 3)/24 - 
      pow(y, 2) * pow(x, 3)/24 - pow(x, 3)/24 +
      pow(y, 4) * pow(x, 2)/24 - pow(y, 6) * pow(x, 2)/24 + 
      pow(x, 2)/24 - pow(y, 1) * pow(x, 1)/24 -
      pow(y, 4) * pow(x, 1)/24 + pow(y, 2) * pow(x, 1)/24);
    */
    return jul2(nx, ny, max, it+1, range);
  }
  else return it;
}



