
int A_INIT = 10; // initial concentration chemical A
int B_INIT = 7;// initial concentration chemical B
int BETA_VARIANCE_INIT = 12;// initial variance o concentration of B

float betaVariance = 1.3f; // random factor for initial variance
float adiff = 1/8.0f; // diffusion speed of chemical A
float bdiff = 1/48.0f; // diffusion speed of chemical B
float s = 1/240.0f; // spot size;

float a[], b[], da[], db[], beta[];

float maxb,minb,mina,maxa;

void setup() {
  colorMode(RGB,255);
  size(512,512,P2D);
  loadPixels();
  a = new float[width*height];
  b = new float[width*height];
  da = new float[width*height];
  db = new float[width*height];
  beta = new float[width*height];

  // init chemicals array
  for(int i=0; i<width; i++){
    for(int j=0; j<height; j++){
      a[i+j*width] = A_INIT;
      b[i+j*width] = B_INIT;
      beta[i+j*width] = BETA_VARIANCE_INIT + (random(0,betaVariance));
    }
  }
}

void reactionDiffusion() {
  int yoffset = 0;
  for (int j=0; j<height; j++) {
    for (int i=0; i<width; i++) {
      int current = i+yoffset;
      int east = ((i+1)%width)+(yoffset); 
      int west = ((i-1+width)%width)+(yoffset); 
      int south = i+(((j+1)%height)*width); 
      int north = i+(((j-1+height)%height)*width); 

      // chemical A
      float concentration = s*(16-a[current]*b[current]);
      float laplacian = a[east] + a[west] + a[south] + a[north] - 4*a[current];
      float diffusion = adiff*laplacian;
      da[i+yoffset] = (concentration+diffusion);

      // chemical B
      concentration = s*(a[current]*b[current]-b[current]-beta[current]);
      laplacian = b[east] + b[west] + b[south] + b[north] - 4*b[current];
      diffusion = bdiff*laplacian;
      db[i+yoffset] = (concentration+diffusion);
    }
    yoffset += width;
  }
  // update concentrations
  int xyoffset = width*height;
  for (int offset=0; offset<xyoffset; offset++) {
    a[offset] += da[offset];
    b[offset] += db[offset];
    if (b[offset]<0) b[offset] = 0;
    if (a[offset]<0) a[offset] = 0;
    maxb = max((float)maxb,(float)b[offset]);
    minb = min((float)minb,(float)b[offset]);
    maxa = max((float)maxa,(float)a[offset]);
    mina = min((float)mina,(float)a[offset]);			
  }
}

void draw() {
  background(0);
  minb = 0; 
  maxb = 0;
  mina = 0; 
  maxb = 0;
  reactionDiffusion();
  float scaleb = 255.0f/(maxb);
  float scalea = 255.0f/(maxa);
  int yoffset = 0;
  for (int j=0; j<height; j++) {
    for (int i=0; i<width; i++) {
      int red = (int)(scalea*(a[i+yoffset]-mina)); 
      int green = (int)(scaleb*(b[i+yoffset]-minb));
      int blue = 0;
      pixels[i+yoffset] = color(red,green,blue);
    }
    yoffset += width;
  }
  updatePixels();
}



