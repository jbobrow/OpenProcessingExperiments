
PImage img32, img64;
PImage img1, img2;
color[][] colorArray;
float average, Min, Max;
int MinPos, MaxPos, Start, End;
int TargetSize, SampleSizeW, SampleSizeH;
int TemplateSize = 64;
int TargetArea = TargetSize*TargetSize;
double[] Target = new double[TargetArea];
double[] preSample = new double[TemplateSize*TemplateSize];
double[] Sample = new double[TemplateSize*TemplateSize];
int thresh = 10000000;

void setup(){
size(64, 64);
  Start = millis();
  img1 = loadImage("SampleNeuronSlice.jpg"); 
  img2 = loadImage("SampleNeuron.jpg");
  img64 = loadImage("Blank128.jpg");
  img32 = loadImage("Blank32.jpg");
  int TargetSize = img1.height;
  int SampleSizeW = img2.width;
  int SampleSizeH = img2.height;
  size(TargetSize, TargetSize);
  turnGray(img1);
  turnGray(img2);  
  Target = intToDouble(img1.pixels);
  preSample = intToDouble(img2.pixels);
  average = averageRegion(preSample, SampleSizeW, SampleSizeH, SampleSizeW, SampleSizeH);
  fillRegion(preSample, Sample, TemplateSize, TemplateSize, SampleSizeW, SampleSizeH, (int)(average+.5));
  double[] Master = new double[TargetSize*TargetSize]; 
    for(int iy = 0; iy < TargetSize; iy+=TemplateSize){             
      for(int ix = 0; ix < TargetSize; ix+=TemplateSize){       
        double[] b = findSquare(Target, ix, iy, TemplateSize, TemplateSize, TargetSize);  
        double[] master = masterFourier(Sample, b, TemplateSize*TemplateSize);     
        Master = replaceSquare(master, Master, ix, iy, TemplateSize, TemplateSize, TargetSize, TemplateSize*TemplateSize);                          
     }
   }  
   findMinMax(Master, TargetSize*TargetSize);   
   printArraytoPic(Master, img1);
   End = millis() - Start;
   println(End);
}

double[] masterFourier(double[] Sample, double[] Target, int TargetArea){
  double[] Temp = new double[TargetArea];
  sampleCopy(Temp, Sample, TargetArea);   
  double[] zeroSet = new double[TargetArea];
  double[] zeroSet2 = new double[TargetArea];
  zeroFill(zeroSet, TargetArea);
  zeroFill(zeroSet2, TargetArea);  
  FFT(1, TargetArea, Temp, zeroSet);
  FFT(1, TargetArea, Target, zeroSet2);
  Target[0] = 0;
  Temp[0] = 0;  
  negiArray(zeroSet, TargetArea);
  multiFFT(Target, zeroSet, Temp, zeroSet2, TargetArea); 
  FFT(-1, TargetArea, Target, zeroSet2); 
  return Target;
}

double averageCell(double[] a, int n){
  double average = 0;
  for( int i = 0; i<n; i++){
    average+=a[i];
  }
  average/=n;
  return average;
}
double standardDeviation(double[] a, int n){
  double sDev = 0;
  double average = averageCell(a, n);
  //println("averageSDev: "+average);
  for( int i =0; i<n; i++){
    sDev+=(a[i] - average)*(a[i] - average);
  }
  sDev/=n;
  sDev = sqrt((float)sDev);
  return sDev;     
}

void sampleCopy(double[] a, double[] b, int n) {
  for (int i=0; i<n; i++) {
    a[i] = b[i];
  }
}


double[] intToDouble(int[] pix)
{
  double[] dubs = new double[pix.length];
  for ( int i = 0; i < pix.length; i++)
  {
    dubs[i] = (double)pix[i];
  } 
  return dubs;
}

void findMinMax(double[] a, int n){
  Min = 10000000;
  Max = -10000000;
  MinPos = 0;
  MaxPos = 0;
  for(int i=0; i<n; i++){
    if (a[i]<Min){
      Min = (int)a[i];
      MinPos = i;
    }
    if (a[i]>Max){
      Max = (int)a[i];
      MaxPos = i;
    }
  }
}

float averageRegion(double[] a, int Width, int Height, int subWidth, int subHeight) {
  int sum=0, offset = 0;
  for (int y=0; y<subHeight; y++) {
    offset = y*Width;
    for (int x=0; x<subWidth; x++) {
      sum += a[x+offset];
    }
  }
  sum /= (subWidth*subHeight);  
  return sum;
}

void fillRegion(double[] a, double[] b, int Width, int Height, int subWidth, int subHeight, int average) {
  int offset = 0;
  for (int y = 0; y<subHeight; y++) {
    offset = y*Width;
    for (int x = 0; x<subWidth; x++) {
      b[x+offset] = a[x+y*subWidth];
    }
    for (int x = subWidth; x<Width; x++) {
      b[x+offset] = average;
    }
  }
  for (int y=subHeight; y<Height; y++) {
    offset = y*Width;
    for (int x=0; x<Width; x++) {
      b[x+offset] = average;
    }
  }
}

void turnGray(PImage image) {
  image.loadPixels();
  int clour;
  int r, g, b, doriangray;
  for ( int i = 0; i< image.pixels.length; i++)
  {
    clour = image.pixels[i];
    b = clour & 0xFF;
    g = (clour >> 8) & 0xFF;
    r = (clour >> 16) & 0xFF;
    doriangray = (b+g+r)/3;
    set( i % image.width, i / image.width, color(doriangray));
    image.pixels[i] = doriangray;
  }
}

void printArraytoPic(double[] a, PImage image) {
  int Height = image.height;
  int Width = image.width;
  int V;
  for (int y=0; y<Height; y++) {
    for (int x=0; x<Width; x++) {
      V = (int)(255*((a[y*Width+x]-Min)/(Max-Min)));
      V &= 255;
      V += V*65536+V*256; 
  if (V<thresh){
V = 0;
  }
      set(x, y, (int)(V));
    }
  }
}


int twoDtoOneD(int x, int y, int wideth)
{
  return x+y*wideth;
}

void counterFill(double[] a, int n) {
  for (int i=0; i<n; i++) {
    a[i] = i;
  }
}


double[] findSquare(double[] a, int x, int y, int dx, int dy, int wideth) {
  double[] b = new double[dx*dy];
  int counter = 0;
  for (int iy = 0; iy < dy; iy++) {
    for (int ix = 0; ix < dx; ix++) {   
      b[counter] = a[twoDtoOneD(ix+x, iy+y, wideth)];
      counter+=1;
    }
  }  
  return b;
}


double[] replaceSquare(double[] a, double[]b, int x, int y, int dx, int dy, int Width, int n) {
  int counter = 0;
  double average = averageCell(a, n); 
  double sDev = standardDeviation(a, n);  
  for (int iy = 0; iy < (dy); iy++) {
    for (int ix = 0; ix < dx; ix++) {                 
      b[twoDtoOneD(ix+x, iy+y, Width)] = (a[counter]-average)/sDev;
      counter+=1;     
    }
  }  
  return b;
}

void printArray(double[] a, int n) {
  int i;
  for (i = 0; i<n ; i++) {
    print(a[i] + ", ");
  }
  println();
}

void zeroFill(double[] a, int n) {
  for (int i=0; i<n; i++) {
    a[i] = 0;
  }
}

void multiFFT(double [] re1, double [] im1, double [] re2, double [] im2, int n) {
  double tempReal = 0;
  double tempImag = 0;
  int i;
  for (i = 0; i<n; i ++) {
    tempReal = re1[i] * re2[i] - im1[i] * im2[i];
    tempImag = re1[i] * im2[i] + re2[i] * im1[i];
    re1[i] = tempReal;
    im1[i] = tempImag;
  }
}

void negiArray(double [] array, int n) {
  int i;
  for (i = 0; i < n; i++) {
    array[i] = -array[i];
  }
}

void FFT(int dir, int n, double [] x, double [] y)
{
  int m, i, i1, j, k, i2, l, l1, l2;
  double c1, c2, tx, ty, t1, t2, u1, u2, z;
  
  /* Calculate the number of points */
  //n =1 << m;
  for (m=1; (n>>m)!=1; m++)
    ;
    
  /* Do the bit reversal */
  i2 = n >> 1;
  j = 0;
  for (i=0;i<n-1;i++) {
    if (i < j) {
      tx = x[i];
      ty = y[i];
      x[i] = x[j];
      y[i] = y[j];
      x[j] = tx;
      y[j] = ty;
    }
    k = i2;
    while (k <= j) {
      j -= k;
      k >>= 1;
    }
    j += k;
  }

  /* Compute the FFT */
  c1 = -1.0; 
  c2 = 0.0;
  l2 = 1;
  for (l=0;l<m;l++) {
    l1 = l2;
    l2 <<= 1;
    u1 = 1.0; 
    u2 = 0.0;
    for (j=0;j<l1;j++) {
      for (i=j;i<n;i+=l2) {
        i1 = i + l1;
        t1 = u1 * x[i1] - u2 * y[i1];
        t2 = u1 * y[i1] + u2 * x[i1];
        x[i1] = x[i] - t1; 
        y[i1] = y[i] - t2;
        x[i] += t1;
        y[i] += t2;
      }
      z =  u1 * c1 - u2 * c2;
      u2 = u1 * c2 + u2 * c1;
      u1 = z;
    }
    c2 = sqrt((float)((1.0 - c1) / 2.0));
    if (dir == 1) 
      c2 = -c2;
    c1 = sqrt((float)((1.0 + c1) / 2.0));
  }

  /* Scaling for forward transform */
  if (dir == 1) {
    for (i=0;i<n;i++) {
      x[i] /= n;
      y[i] /= n;
    }
  }
}




