
// Poisson方程式を Conjugate Gradient 法で解く
// by tetsuya
//
//  Ax = b を解く
//  行列Aは，マイナスラプラシアン（境界条件込み）演算子に対応
//  x は電位（温度），b は電荷（熱源）に対応
//////////////////////////////////////
//import processing.video.*;
//MovieMaker mm;

int spaceX = 100;
int spaceY = 100;  
int marginX = 120;
int marginY = 40;

float rho_delta = 0.1;

float epsilon_0 = 1.0e-4;  // 収束基準

float[][]   x = new float[spaceX][spaceY]; // 電位 or 温度
float[][]   b = new float[spaceX][spaceY]; // 電荷 or 熱源
float[][]   R = new float[spaceX][spaceY];
float[][]   U = new float[spaceX][spaceY];

float bb;

int iterations;
float eps;

int drawFlag = 1;   /// 1: phi,  0: rho
int mousePressFlag = 0;
float cursorSize = 20;
int gradation = 10; 
//////////////////////////////////////////////////////////////////////////
void setup(){
   size(spaceX + marginX * 2, spaceY + marginY * 2, P2D);

   //mm = new MovieMaker(this, width, height, "drawing.mov", 20, 
   //                    MovieMaker.ANIMATION, MovieMaker.LOSSLESS);
   
   colorMode(HSB, 1.0);
   rectMode(CENTER);
   reset_x(); 
   reset_b();
   
   PFont font;
   font = createFont("ArialMT-48",24);   
   textFont(font);
   
   reset_b();
   reset_x();
   CG_init();
   iterations = 0;
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
void draw(){
   background(0.8);
   if(drawFlag == 1){
      draw_x();
   }else{
      draw_b();
   }
   drawText();
   drawMouseCursor();
   ConjGrad(bb);
   //mm.addFrame();
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
void ConjGrad(float b_dot_b){
   float[][] R_n = new float[spaceX][spaceY];
   float[][]  AU = new float[spaceX][spaceY];
   
   float R_dot_R = dotProduct(R, R);                 /// 残差ベクトルの2乗
   eps = R_dot_R / (b_dot_b + 1.0e-16);
   if(eps <= epsilon_0){ return; }                   /// 収束しているなら何もしない
   
   AU = A_mul(U);
   float lambda = dotProduct(U, R) / dotProduct(U, AU);
   x = vec_plus_vec(x, sc_mul_vec(lambda, U));
   R_n = vec_minus_vec(R, sc_mul_vec(lambda, AU));
   float mu = dotProduct(R_n, R_n) / R_dot_R;
   U = vec_plus_vec(R_n, sc_mul_vec(mu, U));
   R = vecCopy(R_n);
   iterations++;
}
//////////////////////////////////////////////////////////////////////////
void CG_init(){
   R = vecCopy(b);
   U = vecCopy(b);
   bb = dotProduct(b, b);
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
float[][] A_mul(float[][] v){   /// minus Laplacian with Boundary Condition
   float[][] y = new float[spaceX][spaceY];
   
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         y[i][j] =      
                     v[i][j]                                /// 「自分」
                 - ( (  i < spaceX - 1 ? v[i + 1][j] : 0 )  /// 「東」Dirichlet
                   + (  i > 0          ? v[i - 1][j] : 0 )  /// 「西」Dirichlet
                   + v[i][min(j + 1, spaceY - 1)]   /// 「南」Neumann
                   + v[i][max(j - 1, 0)] ) / 4.0;   /// 「北」Neumann
      }
   }
   return y;
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
float dotProduct(float[][] v, float[][] w){
   float sum = 0;
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         sum += v[i][j] * w[i][j];
      }
   }
   return sum;
}
//////////////////////////////////////////////////////////////////////////
float[][] vec_plus_vec(float[][] v, float[][] w){
   float[][] z = new float[spaceX][spaceY];
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         z[i][j] = v[i][j] + w[i][j];
      }
   }
   return z;
}
//////////////////////////////////////////////////////////////////////////
float[][] vec_minus_vec(float[][] v, float[][] w){
   float[][] z = new float[spaceX][spaceY];
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         z[i][j] = v[i][j] - w[i][j];
      }
   }
   return z;
}
//////////////////////////////////////////////////////////////////////////
float[][] sc_mul_vec(float a, float[][] v){
   float[][] y = new float[spaceX][spaceY];
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         y[i][j] = a * v[i][j];
      }
   }
   return y;
}
//////////////////////////////////////////////////////////////////////////
float[][] vecCopy(float[][] v){
  float[][] y = new float[spaceX][spaceY];
  for(int j = 0; j < spaceY; j++){
     for(int i = 0; i < spaceX; i++){
        y[i][j] = v[i][j];
     }
  }
  return y;
}
//////////////////////////////////////////////////////////////////////////
///// display (drawing phi, rho and texts)
//////////////////////////////////////////////////////////////////////////
void draw_x(){
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         stroke(abs(x[i][j]/gradation + 0.7)%1.0, 1, 1);
         point(i + marginX, j + marginY);
      } 
   }
}
//////////////////////////////////////////////////////////////////////////
void draw_b(){
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         float rho = b[i][j];
         if(rho >= rho_delta){ strokeWeight(2); stroke(0); }
         else if(rho <= -rho_delta){ strokeWeight(2); stroke(1); }
         else{ strokeWeight(1); stroke(0.5); }
         point(i + marginX, j + marginY);
      } 
   }
   strokeWeight(1);
}
//////////////////////////////////////////////////////////////////////////
void drawText(){
   fill(0); 
   //text("CPU ONLY", width - 130, height - 10); 
   //text("Mesh: " + spaceX * spaceY + " nodes", width - 250, 30);   
   text("iters = " + iterations + "   err = " + eps, 10, height - 10);
   if(drawFlag == 1){
      text("electric potential", 10, 30);
   }else{
      text("charge", 10, 30);
   }
   if(mousePressFlag == 1){
      String t;
      if(mouseButton == LEFT){ t = "plus"; }
      else{ t = "minus"; }
      text(t, 90, 30);
   } 
}
//////////////////////////////////////////////////////////////////////////
/// reset phi, rho;  set rho
//////////////////////////////////////////////////////////////////////////
void reset_x(){
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         x[i][j] = 0;
      } 
   }
}
//////////////////////////////////////////////////////////////////////////
void reset_b(){
   for(int j = 0; j < spaceY; j++){
      for(int i = 0; i < spaceX; i++){
         b[i][j] = 0;
      } 
   }
}
//////////////////////////////////////////////////////////////////////////
void set_b(int ix, int iy){    /// 電荷「書き込み」
   if(ix < 0 || iy < 0 || ix >= spaceX || iy >= spaceY){
      return;
   }
   if(mouseButton == LEFT){ 
      b[ix][iy] += rho_delta;
   }else{
      b[ix][iy] -= rho_delta;
   }
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
void keyPressed(){
   if(key == 'i' || key == 'I'){
      reset_b();
      reset_x();
      CG_init();
      iterations = 0;
   }else if(key == 'r' || key == 'R'){
      drawFlag = 0;
   }else if(key == 'f' || key == 'F'){
      //mm.finish();
   }
}
//////////////////////////////////////////////////////////////////////////
void keyReleased(){
   drawFlag = 1;
}
//////////////////////////////////////////////////////////////////////////
void mousePressed(){
   mousePressFlag = 1;
   drawFlag = 0;
   set_b(mouseX - marginX, mouseY - marginY); 
}
//////////////////////////////////////////////////////////////////////////
void mouseDragged(){
   mousePressFlag = 1;
   set_b(mouseX - marginX, mouseY - marginY);   
}
//////////////////////////////////////////////////////////////////////////
void mouseReleased(){
   mousePressFlag = 0;
   drawFlag = 1;
   CG_init();
   //println("|b|^2 = " + dotProduct(b, b));
}
//////////////////////////////////////////////////////////////////////////
void drawMouseCursor(){
   if(mousePressFlag == 1){
      stroke(0);
      noFill();
      ellipse(mouseX, mouseY, cursorSize, cursorSize);
      ellipse(mouseX, mouseY, cursorSize*1.5, cursorSize*1.5);
      ellipse(mouseX, mouseY, cursorSize*2, cursorSize*2);
   }
}
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
