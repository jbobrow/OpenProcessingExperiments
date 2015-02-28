
final int fRate = 20; // framerate
final int N = 115; // number of mass
float T = 0.6; // tense
float rho = 0.03; // density of string
float d = 0.8; // distance of mass
 
float[][] p = new float[N][N];
float[][] np = new float[N][N]; // temporary value of p
float[][] dp = new float[N][N]; // variation of p
 
float dt = 1.0/fRate;
 
void setup(){
  frameRate(fRate);
  size(500,500);
  noStroke();
 
  // initial condition
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      p[i][j] = 0.0;
      dp[i][j] = 0.0;
    }
  }
}
 
void draw(){
  calc();
 
  background(0);
 
  float col = 0f;
 
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      col = p[i][j]*50+120;
      fill(0,0,255-col);
      rect(i*4+20, j*4+20,4,4);
    }
  }
}
 
// calculation of gravity
void calc(){
  float _dm = 1.0/(rho*d*d);
 
  for(int i=1;i<N-1;i++){
    for(int j=1;j<N-1;j++){
      // wave equation
      dp[i][j] = dp[i][j] + (T/(d*d)*(p[i+1][j] + p[i][j+1] -4*p[i][j] + p[i-1][j] + p[i][j-1]))*_dm*dt*dt;
 
      np[i][j] = p[i][j] + dp[i][j];
 
      // boundary condition
      p[0][j] = 0.0;
      p[N-1][j] = 0.0;
      p[i][0] = 0.0;
      p[i][N-1] = 0.0;
    }
  }
 
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      p[i][j] = np[i][j];
    }
  }
}
 
// mousePressed Event
void mousePressed(){
  if(mouseX>=20 && mouseX<= 4*N + 20 && mouseY>=20 && mouseY<= 4*N + 20){
    int n = round((mouseX-20)/4);
    int m = round((mouseY-20)/4);
    dp[n][m] = -1.0f;
  }
}



