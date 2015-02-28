

int N = 256;
int NUM_COLOURS=64; 

int[][] colourMap;

double[] U = new double[N*N];
double[] V = new double[N*N];

double[] dU = new double[N*N];
double[] dV = new double[N*N];

int[][] offsets = new int[N*N][4];


void timestep(double delta, double F, double K, double diffU, double diffV) {
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          int p = i + j*N;
          
          double u = U[p];
          double v = V[p];
          
          int left = offsets[p][0];
          int right = offsets[p][1];
          int up = offsets[p][2];
          int down = offsets[p][3];
          
          double uvv = u*v*v;     
       
          double lapU = (U[up] +U[down] + U[left] + U[right] - 4*u);
          double lapV = (V[up] +V[down] + V[left] + V[right] - 4*v);
          
          dU[p] = diffU*lapU  - uvv + F*(1 - u);
          dV[p] = diffV*lapV + uvv - (K+F)*v;
        }
      }
      
      
    for (int k = 0; k < N*N; k++) {
          U[k] += dU[k];
           V[k] += dV[k];
    }
}

void setup() {
  
    for (int k = 0; k < N*N; k++) {
      U[k] = 1.0;
      V[k] = 0.0;
    }
    
    for (int i = N/3; i < 2*N/3; i++) {
        for (int j = N/3; j < 2*N/3; j++) {     
           U[i + j*N] = 0.5*(1 + random(-1, 1));
           V[i + j*N] = 0.25*( 1 + random(-1, 1));
      }
    }
    
   
    //Set up offsets
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        offsets[i + j*N][0] =  ((i-1) % N + N) % N + j*N;
        offsets[i + j*N][1] = ((i+1) % N + N) % N + j*N;
        offsets[i + j*N][2] = i + (((j-1) % N + N) % N)*N;
        offsets[i + j*N][3] = i + (((j+1) % N + N) % N)*N;
      }
    }
    
    colourMap = createColourMap(255, 0, 0, 0, 0, 0, 0, 255, 0, 0, 255, 0);
    
      size(N,N, P2D);

    frameRate(30); 
 //   smooth();
}


void draw(){
   
    for (int k = 0; k < 10; k++) {
    //  timestep(1.0,  0.035, 0.06,0.16, 0.08);
     // timestep(1.0,  0.042, 0.065,0.16, 0.08);
      timestep(1.0,  0.025, 0.056,0.18, 0.13);
    }
   
    // Draw points
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        uv2RGB(U[i + j*N], V[i + j*N]);
        point(i,j);
      }
    }
}

int[][] createColourMap(int r0, int g0, int b0, int r1, int g1, int b1, int r2, int g2, int b2, int r3, int g3, int b3) {
    int[][] colourMap = new int[NUM_COLOURS*NUM_COLOURS][3];
   
    for (int i = 0; i < NUM_COLOURS; i++) {
      for (int j = 0; j < NUM_COLOURS; j++) {
        float u = ((float)i)/(NUM_COLOURS-1);
        float v = ((float)j)/(NUM_COLOURS-1);
        
        int r =  (int)(r0*(1-u)*(1-v) + r1*u*(1-v) + r2*(1-u)*(1-v) + r3*(1-u)*v);
        int g = (int)(g0*(1-u)*(1-v) + g1*u*(1-v) + g2*(1-u)*(1-v) + g3*(1-u)*v);
        int b = (int)(b0*(1-u)*(1-v) + b1*u*(1-v) + b2*(1-u)*(1-v) + b3*(1-u)*v);
        colourMap[i + j*NUM_COLOURS][0] = r;
        colourMap[i + j*NUM_COLOURS][1] = g;
        colourMap[i + j*NUM_COLOURS][2] = b;
        
      }
    }
    
    return colourMap;  
  
}


void uv2RGB(double u, double v) {
        
        int x = (int)(u*(NUM_COLOURS-1));
        int y = (int)(v*(NUM_COLOURS-1));
        
        int k = x + y*NUM_COLOURS;
        
        stroke(colourMap[k][0],colourMap[k][1] , colourMap[k][2]);
       
}


