
//increase or decrease density of points
int iterateNumber = 1000000;
//image ratio
float viewratio = 1.0;


static class Complex {
  float x;
  float y;
  public Complex() {
    x = 0.0f;
    y = 0.0f;
  }
  public Complex(float inx, float iny) {
    x = inx;
    y = iny;
  }
  static Complex mul(Complex a, Complex b) {
    return new Complex(a.x*b.x - a.y*b.y, a.x*b.y+a.y*b.x);
  }
}

static class Mobius {
  Complex A, B, C, D;
  public Mobius(Complex a, Complex b, Complex c, Complex d) {
    A = a; B = b; C = c; D = d;
  }
  public Complex TransformPoint(Complex z) {
    Complex u = Complex.mul(A,z);
    u.x += B.x; u.y += B.y;
    Complex v = Complex.mul(C,z);
    v.x += D.x; v.y += D.y;
    float p = u.x * v.x + u.y * v.y;
    float q = u.y * v.x - u.x * v.y;
    float r = v.x * v.x + v.y * v.y;
    return new Complex(p/r, q/r);
  }
  
  static Mobius mul(Mobius m1, Mobius m2) {
    Complex M1[][] = {{m1.A, m1.B}, {m1.C, m1.D}};
    Complex M2[][] = {{m2.A, m2.B}, {m2.C, m2.D}};
    Complex M3[][] = new Complex[2][2];
    for (int i = 0; i < 2; i++)
      for (int j = 0; j < 2; j++) {
        float x = 0;
        float y = 0;
        for (int k = 0; k < 2; k++) {
          Complex c = Complex.mul(M1[i][k], M2[k][j]);
          x += c.x;
          y += c.y;
        }
        M3[i][j] = new Complex(x, y);
      }
    return new Mobius(M3[0][0], M3[0][1], M3[1][0], M3[1][1]);
  }
}

class Affine {
  float A, B, C, D, E, F;
  public Affine(float a, float b, float c, float d, float e, float f) {
    A = a; B = b; C = c; D = d; E = e; F = f;
  }
  public Complex TransformPoint(Complex z) {
    return new Complex(A*z.x+B*z.y+E, C*z.x+D*z.y+F);
  }
}


int order = 9;
Complex d = new Complex(0.0502, 0.0969);
float dx = d.x;
float dy = 2.9172;
Mobius m = Mobius.mul(new Mobius(new Complex(1,0), new Complex(0,0), new Complex(0,-1), new Complex(1,0)),
  new Mobius(new Complex(1,0), new Complex(0.0502,-0.0969), new Complex(0,0), new Complex(1,0)));
Affine s[] = {new Affine(-1, 0, 0, -1, -d.x, d.y),
    new Affine(1, 0, 0, 1, -1, 0),
    new Affine(1, 0, 0, 1, 1, 0),
    new Affine(1, 0, 0, 1, -dx, -dy)};
float pLine[] = {1, d.y - 1};
int indexLUT[] = new int[10000];
int count = 5;
float PatternWeight = 1;
float HorizontalWeight = 0.25;
float VerticalWeight = 0.12;
float LineWeight = 0.05;
float Weight = 0.98;
int Power = 16;
color colors[] = {color(0xFF,0x00,0xAE), color(0xFF,0x20,0x20), color(0xff,0xff,0x00),
  color(0x00,0xff,0x6c), color(0x00,0xff,0xff), color(0x40, 0x40,0xff), color(0xae, 0x60, 0xff)};

float p[] = {PatternWeight, PatternWeight,
        HorizontalWeight, HorizontalWeight,
        VerticalWeight, LineWeight, LineWeight};
int k[] = { 0, 1, -1, -1, 2, -1, -1};
int powerChain = 0;
int attractorIndex = 0;

void setup() {
  size(800,800);
  smooth();
  translate(400,400);
  background(0);
  
  NormalizeWeights(p, 7);
  GenLUT(p, 7, indexLUT);
  Complex z = new Complex(0,0);
  int index = 0;
  for (int i = 0; i < iterateNumber; i++)
  {
    if (powerChain == 0) {
      if(random(1) < Weight)
        powerChain = 0;
      else
        powerChain = int(random(Power));
      index = indexLUT[int(random(indexLUT.length))];
      int idx = k[index];
      if (idx >= 0) {
        attractorIndex = idx;
      }
    } else {
      powerChain -= 1;
    }
    z.y += d.y/2;
    if (index < count) {
      if (index == 0) {
        z = m.TransformPoint(z);
      } else {
        z = s[index-1].TransformPoint(z);
      }
    } else {
      z.y = pLine[index-count];
      powerChain = 0;
    }
    z.y -= d.y/2;
    Complex zr = CircleReflect(z);
    Complex zd = zr;
    stroke(colors[index]);
    point(zd.x*400*viewratio, zd.y*400*viewratio);
  }
}

void NormalizeWeights(float p[], int len) {
  float sum = 0;
  for (int i = 0; i < len; i++)
    sum += p[i];
  for (int i = 0; i < len; i++)
    p[i] /= sum;
}

void GenLUT(float p[], int len, int indexLUT[]) {
  float upper = 0;
  int l = indexLUT.length;
  int cur = 0;
  for (int i = 0; i < len; i++) {
    upper += p[i];
    while(cur < l) {
      indexLUT[cur] = i;
      cur++;
      if ((((float)cur) / l) > upper)
        break;
    }
  }
}

Complex CircleReflect(Complex z) {
  float d = (float)Math.sqrt(z.x*z.x + z.y * z.y);
  float c = 1 / d / d;
//  if (d < (1-0.0969))
//    return z;
//  else
    return new Complex(z.x*c, z.y*c);
}


