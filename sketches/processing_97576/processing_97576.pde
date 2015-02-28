
/*
PERLIN NOISE

UP:      increase number of octaves used
DOWN:    decrease number of octaves used
CLICK:   generate new noise

Self-coded perlin noise program made as an exercise.
Linear interpolation was used for teh octaves.
*/


int w = 256;                                       // width and height (should be a power of 2) 
int h = 256;                                       
int L = 7;                                         // number of octaves added

int[] main1 = new int[w*h];                        // matrix for storing the perlin noise values
int[] temp1 = new int[w*h];                        // matrix for storing the next octave

void setup() {
  size(256, 256);
  background(0); 
  noLoop();
}

void draw() {

  int r;                                             // random number storage
  int v1, v2, v3, v4;                                // known points around interpolated point 
  int x1, x2;                                        // pair of interpolated x-values
  float xW, yW;                                      // x,y weights between known points
  
  int K = 1;                                         // max distance between known points
  for (int q=1; q<=L; q++) {
    K *= 2;
  }  
  
  for (int i=0; i<height; i++) {                     // create main noise matrix (first octave)
    for (int j=0; j<width; j++) {
      main1[j + i*width] = int( 256*random(1) );
    }
  }



  for (int k=2; k<=K; k*=2) {                        // create additional L-1 octaves for perlin noise.

    for (int I=0; I<height; I+=k) {                  // plot the known points on the temp matrix (spacing b/w points is k)
      for (int J=0; J<width; J+=k) {                 //   we must later interpolate between points to fill in the gaps
        temp1[J + I*width] = int( 256*random(1) );  
      }
    }

    for (int i=0; i<height; i++) {                   // for every pixel in the temp1 matrix
      for (int j=0; j<width; j++) {
        
        xW = (j%k)/(k*1.0);                          // known points are k pixels apart so use mod k to find (x,y) position in the appropriate k by k "box"
        yW = (i%k)/(k*1.0);                          // divide by k to normalize position in the k by k "box"   
        
        // floor i,j to nearst known pixels (use mod width/height to loop back to beginning for last row/column) 
        v1 = temp1[ (int(j/k)*k)%width     + ((int(i/k)*k)%height)*width ];     // value of upper-left known pixel
        v2 = temp1[ (int(j/k + 1)*k)%width + ((int(i/k)*k)%height)*width ];     // value of upper-right pixel
        v3 = temp1[ (int(j/k)*k)%width     + ((int(i/k + 1)*k)%height)*width ]; // value of lower-left pixel
        v4 = temp1[ (int(j/k + 1)*k)%width + ((int(i/k + 1)*k)%height)*width ]; // value of lower-right pixel
                
        x1 = int( linInterp(v1, v2, xW) );            // interpolate b/w upper pixels (for a given x)
        x2 = int( linInterp(v3, v4, xW) );            // interpolate b/w lower pixels (for a given x)
        
        temp1[j + i*width] = int( linInterp(x1, x2, yW) ); // interpolate between interpolated x's for a given y
        main1[j + i*width] = ( main1[j + i*width] + temp1[j + i*width] )/2; //update main1 matrix by averaging with temp1
      }
    }
    
 }

  loadPixels();
  for (int i=0; i<height; i++) {                    // transfter pixel values from main1 to the drawing
    for (int j=0; j<width; j++) {
      pixels[j + i*width] = color( int(main1[j + i*width]) );
    }
  }
  updatePixels();
}

void mousePressed() {                    // click to generate new nosie
  redraw();
}

void keyPressed() {
  if (key == CODED) {
    if ( (keyCode == UP)  &&(L<7) ) {    // up arrow increases number of octaves
      L += 1;
      redraw();
    }
    if ( (keyCode == DOWN)&&(L>0) ) {    // down arrow decreases number of octaves
      L -= 1;
      redraw();
    }
  }
}
  

// interpolating functions interpolate between a and b based on the position of x
// x is a float between 0 and 1, with 0 representing a, 1 represention b, 0.5 representing the middle, etc.
int linInterp(int a, int b, float x) {
  return int(a*(1-x) + b*x);  
}

int cosInterp(int a, int b, float x) {
  float f = ( 1 - cos(PI*x) )*0.5;
  return int(a*(1-f) + b*f);  
}
  



