
////////////////////////////////////////////////////////////////////
/// SPH fluid    periodic boundary condition
/// T. Matsuno
////////////////////////////////////////////////////////////////////
/// periodic boudary condition ( torus space )
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
int   Mx = 16; 
int   My = 16;
int   M = Mx * My;  // number of particles
float[] x = new float[M];
float[] y = new float[M];
float[] vx = new float[M];
float[] vy = new float[M];
float[] rho = new float[M];   // density of particles
int[] cellindex_x = new int[M];
int[] cellindex_y = new int[M];
float t;
//
float[] x_next = new float[M];
float[] y_next = new float[M];
float[] vx_next = new float[M];
float[] vy_next = new float[M];
float[] tmp = new float[M];  // for writeback-swap
//
////// kernel parameters
float h_W = 1.0;
float c_W = 5.0 / (PI * h_W * h_W);  // two dimensional case
float h_W2 = h_W * h_W;

/// dynamics parameters
float L_x = 4.0;
float L_y = 4.0;
float a = 0.2;               //  1/r potential parameter

float a_harmonic = 0.0;      //  harmonic potential parameter

//float L_wx = L_x / 1.5;        //  well potential parameter
//float L_wy = L_x / 1.5;        //  well potential parameter
float L_wx = L_x / 1.5;        //  well potential parameter
float L_wy = L_x / 1.5;        //  well potential parameter
float b_height_dwell = 1.0;  //  double-well potential parameter
float b_width_dwell = 0.05;  //  double-well potential parameter
/// calculation parameters
//float dt = 2 * L_wx / (Mx * Mx);
float dt = 0.05;


float beta = 10.0;
float gamma = 0.2;  // friction
float mu = 5.0;
/////////////
/// cell
int Ncell_x = (int)(2 * L_x / h_W);
int Ncell_y = (int)(2 * L_y / h_W);
int Ccell = 50; // capacity of each cel
float dx_cell = 2.0 * L_x / Ncell_x;
float dy_cell = 2.0 * L_y / Ncell_y;
int[][][] cell = new int[Ncell_x + 2][Ncell_y + 2][Ccell + 1];  // 粒子インデックス格納配列
int[][] celledge_x = new int[Ncell_x + 2][Ncell_y + 2];  // セルが端かどうかのフラグ
int[][] celledge_y = new int[Ncell_x + 2][Ncell_y + 2];  // セルが端かどうかのフラグ
int overflowcount = 1;
/////////////
/// display parameters
int dispX = 720;
int dispY = 720;
int dispE = 0;
float bi_x = L_x;
float sc_x = dispX / (2.0 * L_x);
float bi_y = L_y;
float sc_y = dispY / (2.0 * L_y);
///////////////
/// interactive
float moux = 0;
float mouy = 0;
int   mouflag =0;
float dmou = 0.7;
////////////////////////////////////////////////////////////////////
void setup(){
  size(dispX + dispE, dispY, P2D);
  
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  PFont font;
  //font = createFont("ArialMT-48",24);   
  font = createFont("Menlo",24);   
  textFont(font);
  
  initialize();
  
  //println("Ncell_x: " + Ncell_x + ", Ncell_y: " + Ncell_y);
  //println("dx_cell: " + dx_cell + ", dy_cell: " + dy_cell);
  //println("dt = " + dt);
 
  t = 0;
  
  periodicSettingCells();
  setCellEdges();
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void draw(){
  background(0.8);
  displayLines();
  displayParticles();
  displayText();
  //displayWell();
  //displayDoubleWell();
  displayPointer();
  doDynamics();
  addForce();
  //mm.addFrame();    // for video
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void displayParticles(){
  float s = 50;
  for(int i = 0; i < M; i++){
    noStroke();
    float h = (sin((vx[i]*vx[i] + vy[i]*vy[i])/1.0+0.2)+1.0)/2.0;
    fill(h, 1, 1);
    ellipse((x[i] + bi_x) * sc_x, ( -y[i] + bi_y) * sc_y, s, s);
    //rect((x[i] + bi_x) * sc_x, ( -y[i] + bi_y) * sc_y, s, s);
  }
}
////////////////////////////////////////////////////////////////////
void displayLines(){
  int nx = 2 * (int)(L_x / h_W);
  int ny = 2 * (int)(L_y / h_W);
  strokeWeight(1);
  stroke(1);
  for(int i = 0; i <= nx; i++){
    float x = i * h_W * sc_x;
    line(x, 0, x, height);
  }
  for(int i = 0; i < ny; i++){
    float y = i * h_W * sc_y;
    line(0, y, dispX, y);
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void displayText(){
  fill(0.3,1,1);
  text( M + " particles", 15, 25);
  text("(Lx,Ly)=(" + L_x + ", " + L_y + ")", 15, 50);
  text("time: " + (int)t + " [s]" , 15, height - 20);
}
////////////////////////////////////////////////////////////////////
void displayPointer(){
  if(mouflag != 1){ return; }
  strokeWeight(8);
  stroke(0);
  noFill();
  ellipse(moux, mouy, dmou*2*sc_x, dmou*2*sc_y);
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//// DYNAMICS
////////////////////////////////////////////////////////////////////
void doDynamics(){
  updateAssignment();
  makeRho(x, y); 
  for(int i = 0; i < M; i++){
    vx_next[i] = vx[i] + dt * (( - beta * D_x(rho, i) + mu * DD(vx, i))/rho[i] - a_harmonic * x[i] - gamma * vx[i]);
    vy_next[i] = vy[i] + dt * (( - beta * D_y(rho, i) + mu * DD(vy, i))/rho[i] - a_harmonic * y[i] - gamma * vy[i]);
  }
  for(int i = 0; i < M; i++){
    x_next[i] = x[i] + dt * (vx_next[i] + F_v(vx_next, i));
    y_next[i] = y[i] + dt * (vy_next[i] + F_v(vy_next, i));
    if(x_next[i] >=  L_x){ x_next[i] -= 2 * L_x; } // periodic
    if(x_next[i] <  -L_x){ x_next[i] += 2 * L_x; } // periodic
    if(y_next[i] >=  L_y){ y_next[i] -= 2 * L_y; } // periodic
    if(y_next[i] <  -L_y){ y_next[i] += 2 * L_y; } // periodic
  }
  t += dt;
  writeBack();
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
/// potentials
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float V(float x, float y){  // harmonic potential
  return a_harmonic * ( x * x + y * y);
}
////////////////////////////////////////////////////////////////////
float fbeta(float x, float y){
  float rv = beta;
    if(mouflag == 1){
    float xm =   moux / dispX * 2 * L_x - L_x;
    float ym =   -mouy / dispY * 2 * L_y + L_y;
    float d = sqrt(pow(x-xm,2) + pow(y-ym,2));
    if(d < dmou){
      //rv = (beta + 5)/dmou * d - 5;
      rv = 2 * beta;
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float F_v(float[] v, int i){
  float rv = 0;
  int icx = cellindex_x[i];
  int icy = cellindex_y[i];
  for(int jy = icy - 1; jy <= icy + 1; jy++){
    for(int jx = icx - 1; jx <= icx + 1; jx++){
      int c = cell[jx][jy][0];
      for(int k = 1; k <= c; k++){
        int j = cell[jx][jy][k];
        ///// symmetrize is considerably effective!
        float rhoij = (rho[i] + rho[j])/2.0;
        rv += (v[j]-v[i]) / rhoij * W(xi_xj(i,j,icx,icy), yi_yj(i,j,icx,icy));
      }
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float D_x(float[] S, int i){
  float rv = 0;
  int icx = cellindex_x[i];
  int icy = cellindex_y[i];
  for(int jy = icy - 1; jy <= icy + 1; jy++){
    for(int jx = icx - 1; jx <= icx + 1; jx++){
      int c = cell[jx][jy][0];
      for(int k = 1; k <= c; k++){
        int j = cell[jx][jy][k];
        ///// symmetrize is considerably effective!
        float rhoij = (rho[i] + rho[j])/2.0;
        rv += (S[j]-S[i]) / rhoij * DW_x(xi_xj(i,j,icx,icy), yi_yj(i,j,icx,icy));
      }
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
float D_y(float[] S, int i){
  float rv = 0;
  int icx = cellindex_x[i];
  int icy = cellindex_y[i];
  for(int jy = icy - 1; jy <= icy + 1; jy++){
    for(int jx = icx - 1; jx <= icx + 1; jx++){
      int c = cell[jx][jy][0];
      for(int k = 1; k <= c; k++){
        int j = cell[jx][jy][k];
        ///// symmetrize is considerably effective!
        float rhoij = (rho[i] + rho[j])/2.0;
        rv += (S[j]-S[i]) / rhoij * DW_y(xi_xj(i,j,icx,icy), yi_yj(i,j,icx,icy));
      }
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float DS_x(float[] S, int i){
  float rv = 0;
  int icx = cellindex_x[i];
  int icy = cellindex_y[i];
  for(int jy = icy - 1; jy <= icy + 1; jy++){
    for(int jx = icx - 1; jx <= icx + 1; jx++){
      int c = cell[jx][jy][0];
      for(int k = 1; k <= c; k++){
        int j = cell[jx][jy][k];
        ///// symmetrize is considerably effective!
        float rhoij = (rho[i] + rho[j])/2.0;
        rv += sin(S[j]-S[i]) / rhoij * DW_x(xi_xj(i,j,icx,icy), yi_yj(i,j,icx,icy));
      }
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
float DS_y(float[] S, int i){
  float rv = 0;
  int icx = cellindex_x[i];
  int icy = cellindex_y[i];
  for(int jy = icy - 1; jy <= icy + 1; jy++){
    for(int jx = icx - 1; jx <= icx + 1; jx++){
      int c = cell[jx][jy][0];
      for(int k = 1; k <= c; k++){
        int j = cell[jx][jy][k];
        ///// symmetrize is considerably effective!
        float rhoij = (rho[i] + rho[j])/2.0;
        rv += sin(S[j]-S[i]) / rhoij * DW_y(xi_xj(i,j,icx,icy), yi_yj(i,j,icy,icy));
      }
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float DD(float[] psi, int i){  // laplacian
  float rv = 0;
  int icx = cellindex_x[i];
  int icy = cellindex_y[i];
  for(int jy = icy - 1; jy <= icy + 1; jy++){
      for(int jx = icx - 1; jx <= icx + 1; jx++){
        int c = cell[jx][jy][0];
        for(int k = 1; k <= c; k++){
          int j = cell[jx][jy][k];
          float dx = xi_xj(i,j,icx,icy);
          float dy = yi_yj(i,j,icx,icy);
          if(i != j){
            float rhoij = (rho[i] + rho[j])/2.0;
            rv += (psi[j]-psi[i]) / rhoij * 
                ( - dx * DW_x(dx, dy) - dy * DW_y(dx, dy)) / (dx * dx + dy * dy);
          }
      }
    }
  }
  return rv;
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void makeRho(float[] x, float[] y){
  for(int i = 0; i < M; i++){
    rho[i] = 0;
    int icx = cellindex_x[i];
    int icy = cellindex_y[i];
    for(int jy = icy - 1; jy <= icy + 1; jy++){
      for(int jx = icx - 1; jx <= icx + 1; jx++){
        int c = cell[jx][jy][0];
        for(int k = 1; k <= c; k++){
          int j = cell[jx][jy][k];
          rho[i] += W(xi_xj(i,j,icx,icy), yi_yj(i,j,icx,icy));
        }
      }
    }
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float W(float x, float y){  // Lucy kernel
  float r = sqrt(x * x + y * y) / h_W;
  if(r > 1.0){
    return 0;
  }else{
    return c_W * (1.0 + 3.0 * r) * pow((1.0 - r), 3);
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float DW_x(float x, float y){
  float r = sqrt(x * x + y * y) / h_W;
  if(r > 1.0){
    return 0;
  }else{
    return - 12.0 * c_W / h_W2 * pow((1.0 - r), 2) * x;
  }
}
////////////////////////////////////////////////////////////////////
float DW_y(float x, float y){
  float r = sqrt(x * x + y * y) / h_W;
  if(r > 1.0){
    return 0;
  }else{
    return - 12.0 * c_W / h_W2 * pow((1.0 - r), 2) * y;
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void writeBack(){  // swap: pointer exchange
  tmp = x_next; x_next = x; x = tmp;
  tmp = y_next; y_next = y; y = tmp;
  tmp = vx_next; vx_next = vx; vx = tmp;
  tmp = vy_next; vy_next = vy; vy = tmp;
}
////////////////////////////////////////////////////////////////////
void setCellIndecies(){
  for(int i = 0; i < M; i++){
    cellindex_x[i] = findCell_x(i);
    cellindex_y[i] = findCell_y(i);
  }
}
////////////////////////////////////////////////////////////////////
int findCell_x(int i){
  int icx = floor( (x[i] + L_x) / dx_cell ) + 1;  
  if(icx < 1){ icx = 1; }                     //  0-measure地雷対策
  else if(icx > Ncell_x){ icx = Ncell_x; }    //  0-measure地雷対策
  return icx;
}
int findCell_y(int i){
  int icy = floor( (y[i] + L_y) / dy_cell ) + 1;  
  if(icy < 1){ icy = 1; }                     // 0-measure地雷対策
  else if(icy > Ncell_y){ icy = Ncell_y; }    // 0-measure地雷対策
  return icy;
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void updateAssignment(){
  initCells();
  setCellIndecies();
  for(int i = 0; i < M; i++){
    pushParticle(i);
  }
}
////////////////////////////////////////////////////////////////////
void pushParticle(int i){
  int ix = cellindex_x[i];
  int iy = cellindex_y[i];
  int c = cell[ix][iy][0];
  if(c < Ccell){
    cell[ix][iy][c + 1] = i;
    cell[ix][iy][0] = c + 1;
  }else{
    println("stack overflow: " + overflowcount++);
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void initCells(){
  for(int j = 0; j < Ncell_y + 2; j++){
    for(int i = 0; i < Ncell_x + 2; i++){
      cell[i][j][0] = 0;
    }
  }
}
////////////////////////////////////////////////////////////////////
void periodicSettingCells(){ ////周期的境界条件
  for(int i = 1; i <= Ncell_x; i++){
    cell[i][0] = cell[i][Ncell_y];
    cell[i][Ncell_y + 1] = cell[i][1];
  }
  for(int j = 1; j <= Ncell_y; j++){
    cell[0][j] = cell[Ncell_x][j];
    cell[Ncell_x + 1][j] = cell[1][j];
  }
  cell[0][0] = cell[Ncell_x][Ncell_y];
  cell[Ncell_x + 1][0] = cell[1][Ncell_y];
  cell[0][Ncell_y + 1] = cell[Ncell_x][1];
  cell[Ncell_x + 1][Ncell_y + 1] = cell[1][1];
}
////////////////////////////////////////////////////////////////////
void initialize(){
  float dx = 2 * L_x / Mx * 0.7;
  float dy = 2 * L_y / My * 0.7;
  double xx = 0.1;
  for(int j = 0; j < My; j++){
    for(int i = 0; i < Mx; i++){
      int k = i + j * Mx;
      x[k] = ( i - Mx / 2 + 0.5) * dx;// + 0.1*(float)Math.cos(i*xx) + 0.1*(float)Math.random();
      y[k] = ( j - My / 2 + 0.5) * dy;// + 0.1*(float)Math.sin(i*xx);
      vx[k] = 0;
      vy[k] = 0;
    }
  }  
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
float xi_xj(int i, int j, int icx, int icy){
  int icex = celledge_x[icx][icy];
  int jcx = cellindex_x[j];
  int jcy = cellindex_y[j];
  int jcex = celledge_x[jcx][jcy];
  if(icex == 0){ return x[i] - x[j]; }
  if(icex == -1){
      if(jcex == 0 || jcex == -1){
        return x[i] - x[j];  
      }else{  /// jcex == +1
        return x[i] - (x[j] - 2 * L_x); 
      }
  }else{  /// icex == +1
      if(jcex == 0 || jcex == 1){
        return x[i] - x[j];  
      }else{  /// jcex == +1
        return x[i] - (x[j] + 2 * L_x); 
      }
  }
}
////////////////////////////////////////////////////////////////////
float yi_yj(int i, int j, int icx, int icy){
  int icey = celledge_y[icx][icy];
  int jcx = cellindex_x[j];
  int jcy = cellindex_y[j];
  int jcey = celledge_y[jcx][jcy];
  if(icey == 0){ return y[i] - y[j]; }
  if(icey == -1){
      if(jcey == 0 || jcey == -1){
        return y[i] - y[j];  
      }else{  /// jcey == +1
        return y[i] - (y[j] - 2 * L_y); 
      }
  }else{  /// icey == +1
      if(jcey == 0 || jcey == 1){
        return y[i] - y[j];  
      }else{  /// jcey == +1
        return y[i] - (y[j] + 2 * L_y); 
      }
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void setCellEdges(){
  for(int i = 0; i <= Ncell_x + 1; i++){
    for(int j = 0; j <= Ncell_y + 1; j++){
      celledge_x[i][j] = 0;
      celledge_y[i][j] = 0;
    }
  }
  for(int i = 0; i <= Ncell_x + 1; i++){
    celledge_y[i][0] = 1;
    celledge_y[i][1] = -1;
    celledge_y[i][Ncell_y] = 1;
    celledge_y[i][Ncell_y + 1] = -1;
  }
  for(int j = 0; j <= Ncell_y + 1; j++){
    celledge_x[0][j] = 1;
    celledge_x[1][j] = -1;
    celledge_x[Ncell_x][j] = 1;
    celledge_x[Ncell_x + 1][j] = -1;
  }
}
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void mousePressed(){
  mouflag = 1;
  moux = mouseX;
  mouy = mouseY;
}
void mouseDragged(){
  mouflag = 1;
  moux = mouseX;
  mouy = mouseY;
}
void mouseReleased(){
  mouflag = 0;
}
void addForce(){
  if(mouflag != 1){ return; }
  float k = 20.0;
  float xm =   moux / dispX * 2 * L_x - L_x;
  float ym =   -mouy / dispY * 2 * L_y + L_y;
  for(int i = 0; i < M; i++){
    float d = sqrt(pow(x[i]-xm,2)+pow(y[i]-ym,2));
    if(d < dmou){
      vx[i] = vx[i] + dt * (k * ( xm - x[i] ) );
      vy[i] = vy[i] + dt * (k * ( ym - y[i] ) );
    }
  }
}

