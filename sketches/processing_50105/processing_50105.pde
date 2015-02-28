
// =============================================================
// ひこうき（高速化？版）
//
// ループ内でアロケータを使用していないので、もしかしたら高速かも
// =============================================================

// 3D関連
float[][] cameraMat;
float[][] worldMat;

// 行列スタック関連
int N_STACK = 100;          // スタック数
float[][][] matricesStack;  // 行列スタック
int sp;                     // スタックポインタ

// 世界座標系から見たカメラ座標軸ベクトル
PVector xCam;
PVector yCam;
PVector zCam;

// 変換結果を一時的に格納するためのベクトル
PVector tmp;

// 線を引くための端点
PVector start;
PVector end;  

int     t;  // 時間

void setup() {
  size(300, 300);
  frameRate(30);
  
  xCam  = new PVector();
  yCam  = new PVector();
  zCam  = new PVector();
  tmp = new PVector();
  
  start = new PVector();
  end   = new PVector();
  
  worldMat  = new float[4][4];
  cameraMat = new float[4][4];
  for(int i = 0; i < 4; i++)
    for(int j = 0; j < 4; j++)
      worldMat[i][j] = cameraMat[i][j] = i == j ? 1.0 : 0.0;
    
  // 行列スタックの初期化
  matricesStack = new float[N_STACK][4][4];
  sp = 0;
    
  fill(100);
  stroke(100);
}
  
void draw() {
  t = frameCount;
  background(0xFFFFFFFF);
   
  pushMat();
    float cam_dist  = 500;
    float angle = radians(t);
    cam(cam_dist * sin(angle),
        -cam_dist * cos(angle),
         cam_dist,
         0, 0, 0, 0, 1, 0);
   
    // ==========
    // 飛行機の描画
    pushMat();
      rotZ(sin(angle) * PI / 6.0);
       
      // ==========
      // 本体
      pushMat();
        rotX(HALF_PI);
        int LEN  = 400;
        int HEAD_SIZE = 70;
        drawCylinder(70, LEN);
        trans(0, LEN/2, 0);
        drawDome(HEAD_SIZE, HEAD_SIZE, HEAD_SIZE);
      popMat();
       
      // ==========
      // 羽
      for(int i = 0; i < 2; i++) {
        pushMat();
          rotZ(radians(i == 0 ? -90 : 90));
          trans(0, HEAD_SIZE, 0);
          pushMat();
            trans(0, 0, LEN/5);
            drawDome(20, 300, 50);
          popMat();
          pushMat();
            trans(0, 0, - LEN/2 + 50);
            drawDome(10, 150, 50);
          popMat();
        popMat();
      }
      // ==========
      // うしろの羽
      pushMat();
        angle = radians(190);
        trans(0, -HEAD_SIZE - 100 * sin(angle), - LEN/2 + 50);
        rotX(angle);
        drawDome(10, 150, 50);
      popMat();
       
      // ==========
      // プロペラ
      pushMat();
        trans(0, 0, HEAD_SIZE + LEN/2);
        rotZ(radians(t*10));
        drawEllipsoid(30, 30, 20);
        pushMat();
          drawEllipsoid(5, 200, 5);
          rotZ(radians(90));
          drawEllipsoid(5, 200, 5);
        popMat();
      popMat();
    popMat();
  popMat();
}
  
// =============================================================
// ワールド変換
void apply(float m11, float m12, float m13, float m14,
           float m21, float m22, float m23, float m24,
           float m31, float m32, float m33, float m34,
           float m41, float m42, float m43, float m44) {
  float elm11 = worldMat[0][0] * m11 + worldMat[0][1] * m21 + worldMat[0][2] * m31 + worldMat[0][3] * m41;
  float elm12 = worldMat[0][0] * m12 + worldMat[0][1] * m22 + worldMat[0][2] * m32 + worldMat[0][3] * m42;
  float elm13 = worldMat[0][0] * m13 + worldMat[0][1] * m23 + worldMat[0][2] * m33 + worldMat[0][3] * m43;
  float elm14 = worldMat[0][0] * m14 + worldMat[0][1] * m24 + worldMat[0][2] * m34 + worldMat[0][3] * m44;
  
  float elm21 = worldMat[1][0] * m11 + worldMat[1][1] * m21 + worldMat[1][2] * m31 + worldMat[1][3] * m41;
  float elm22 = worldMat[1][0] * m12 + worldMat[1][1] * m22 + worldMat[1][2] * m32 + worldMat[1][3] * m42;
  float elm23 = worldMat[1][0] * m13 + worldMat[1][1] * m23 + worldMat[1][2] * m33 + worldMat[1][3] * m43;
  float elm24 = worldMat[1][0] * m14 + worldMat[1][1] * m24 + worldMat[1][2] * m34 + worldMat[1][3] * m44;
  
  float elm31 = worldMat[2][0] * m11 + worldMat[2][1] * m21 + worldMat[2][2] * m31 + worldMat[2][3] * m41;
  float elm32 = worldMat[2][0] * m12 + worldMat[2][1] * m22 + worldMat[2][2] * m32 + worldMat[2][3] * m42;
  float elm33 = worldMat[2][0] * m13 + worldMat[2][1] * m23 + worldMat[2][2] * m33 + worldMat[2][3] * m43;
  float elm34 = worldMat[2][0] * m14 + worldMat[2][1] * m24 + worldMat[2][2] * m34 + worldMat[2][3] * m44;
  
  float elm41 = worldMat[3][0] * m11 + worldMat[3][1] * m21 + worldMat[3][2] * m31 + worldMat[3][3] * m41;
  float elm42 = worldMat[3][0] * m12 + worldMat[3][1] * m22 + worldMat[3][2] * m32 + worldMat[3][3] * m42;
  float elm43 = worldMat[3][0] * m13 + worldMat[3][1] * m23 + worldMat[3][2] * m33 + worldMat[3][3] * m43;
  float elm44 = worldMat[3][0] * m14 + worldMat[3][1] * m24 + worldMat[3][2] * m34 + worldMat[3][3] * m44;                   
    
  worldMat[0][0] = elm11; worldMat[0][1] = elm12; worldMat[0][2] = elm13; worldMat[0][3] = elm14;
  worldMat[1][0] = elm21; worldMat[1][1] = elm22; worldMat[1][2] = elm23; worldMat[1][3] = elm24;
  worldMat[2][0] = elm31; worldMat[2][1] = elm32; worldMat[2][2] = elm33; worldMat[2][3] = elm34;
  worldMat[3][0] = elm41; worldMat[3][1] = elm42; worldMat[3][2] = elm43; worldMat[3][3] = elm44;
}
  
// 並進と回転
void trans(float x, float y, float z) {
  apply(1.0, 0.0, 0.0, x,
        0.0, 1.0, 0.0, y,
        0.0, 0.0, 1.0, z,
        0.0, 0.0, 0.0, 1.0);
}
  
void rotX(float angle) {
  apply(1.0, 0.0,         0.0,        0.0,
        0.0, cos(angle), -sin(angle), 0.0,
        0.0, sin(angle),  cos(angle), 0.0,
        0.0, 0.0,         0.0,        1.0);
}
  
void rotY(float angle) {
  apply( cos(angle), 0.0,  sin(angle), 0.0,
         0.0,        1.0,  0.0,        0.0,
        -sin(angle), 0.0,  cos(angle), 0.0,
         0.0,        0.0,  0.0,        1.0);
}
  
void rotZ(float angle) {
  apply(cos(angle), -sin(angle), 0.0, 0.0,
        sin(angle),  cos(angle), 0.0, 0.0,
        0.0,         0.0,        1.0, 0.0,
        0.0,         0.0,        0.0, 1.0);
}
  
// =============================================================
// カメラ変換
void cam(float eyeX, float eyeY, float eyeZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ) {
       
  // カメラ座標空間の3軸
  zCam.set(eyeX-centerX, eyeY-centerY, eyeZ-centerZ);
  yCam.set(upX, upY, upZ);
  xCam.set(yCam.y * zCam.z - yCam.z * zCam.y,
           yCam.z * zCam.x - yCam.x * zCam.z,  // = yCam.cross(zCam);
           yCam.x * zCam.y - yCam.y * zCam.x);
  yCam.set(zCam.y * xCam.z - zCam.z * xCam.y,
           zCam.z * xCam.x - zCam.x * xCam.z, // = zCam.cross(xCam);
           zCam.x * xCam.y - zCam.y * xCam.x);
       
  // 正規化
  xCam.normalize();
  yCam.normalize();
  zCam.normalize();
       
    
  // 変換行列の作成・適用
  cameraMat[0][0] = xCam.x;
  cameraMat[0][1] = xCam.y;
  cameraMat[0][2] = xCam.z;
  cameraMat[0][3] = -(eyeX * xCam.x + eyeY * xCam.y + eyeZ * xCam.z);
       
  cameraMat[1][0] = yCam.x;
  cameraMat[1][1] = yCam.y;
  cameraMat[1][2] = yCam.z;
  cameraMat[1][3] = -(eyeX * yCam.x + eyeY * yCam.y + eyeZ * yCam.z);
       
  cameraMat[2][0] = zCam.x;
  cameraMat[2][1] = zCam.y;
  cameraMat[2][2] = zCam.z;
  cameraMat[2][3] = -(eyeX * zCam.x + eyeY * zCam.y + eyeZ * zCam.z);
       
  cameraMat[3][0] = 0.0;
  cameraMat[3][1] = 0.0;
  cameraMat[3][2] = 0.0;
  cameraMat[3][3] = 1.0;
}
  
// =============================================================
// ワールド・ビュー・射影変換
void wvp(PVector v, PVector dst) {
  mul(worldMat, v, tmp);
  mul(cameraMat, tmp, tmp);
  projection(tmp, dst);
}
  
// =============================================================
// 射影変換
void projection(PVector v, PVector dst) {
  float distanceToCamera = (height/2.0) / tan(PI*60.0 / 360.0);
  float x = distanceToCamera * v.x / -v.z + 0.5 * width;
  float y = distanceToCamera * v.y / -v.z + 0.5 * height;
  dst.set(x, y, 0);
  //dst.z = 0;
}
  
// =============================================================
// スタック操作
void pushMat() {
  sp++;
  if(sp >= matricesStack.length) return;  // エラー
  //float[][] mat = new float[4][4];
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
      matricesStack[sp][i][j] = worldMat[i][j];
    }
  }
}
void popMat() {
  if(sp < 0) return;  // エラー
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
      worldMat[i][j] = matricesStack[sp][i][j];
    }
  }
  sp--;
}
  
// =============================================================
// 行列操作
void mul(float[][] m, PVector v, PVector dst) {
  float x = m[0][0] * v.x + m[0][1] * v.y + m[0][2] * v.z + m[0][3];
  float y = m[1][0] * v.x + m[1][1] * v.y + m[1][2] * v.z + m[1][3];
  float z = m[2][0] * v.x + m[2][1] * v.y + m[2][2] * v.z + m[2][3];
  dst.set(x, y, z);
}
  
float[][] matMul(float[][] a, float[][] b) {
  float[][] ret = new float[4][4];
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
      ret[i][j] = 0.0;
      for(int k = 0; k < 4; k++) {
        ret[i][j] += a[i][k] * a[k][j];
      }
    }
  }
  return ret;
}
 
// 射影変換ののちに線引き
void drawLine(float startX, float startY, float startZ, float endX,   float endY,   float endZ) {
    start.set(startX, startY, startZ);
    end.set(endX, endY, endZ);
    wvp(start, start);
    wvp(end, end);
    line(start.x, start.y, end.x, end.y);
}
 
// 楕円体
// 引数はx, y, z軸方向の半径
void drawEllipsoid(float a, float b, float c) {
  final int N =  5;  // x - y平面の分割数
  final int M = 10;  // y 軸上の分割数
   
  int n = N-1;
  int m = M-1;
  for(int t1 = 1; t1 <= n; t1++) {
    float theta  = PI * (t1    ) / n;
    float ptheta = PI * (t1 - 1) / n;
 
    float sintheta = sin(theta);
    float costheta = cos(theta);
    float sinptheta = sin(ptheta);
    float cosptheta = cos(ptheta);
 
    for(int t2 = 1; t2 <= m; t2++) {
      float phi  = TWO_PI * (t2    ) / m;
      float pphi = TWO_PI * (t2 - 1) / m;
 
 
      float sinphi = sin(phi);
      float cosphi = cos(phi);
      float sinpphi = sin(pphi);
      float cospphi = cos(pphi);
 
      float px = a * sintheta * cospphi;
      float pz = c * sintheta * sinpphi;
      float py = b * costheta;
       
      float x = a * sintheta * cosphi;
      float z = c * sintheta * sinphi;
      float y = b * costheta;
       
      drawLine(px, py, pz, x, y, z);
       
      px = a * sinptheta * cosphi;
      pz = c * sinptheta * sinphi;
      py = b * cosptheta;
       
      x = a * sintheta * cosphi;
      z = c * sintheta * sinphi;
      y = b * costheta;
       
      drawLine(px, py, pz, x, y, z);
    }
  }
}
 
// 円柱
void drawCylinder(float r, float h) {
  int N = 10;
  int M = 10;
   
  int n = N-1;
  int m = M-1;
   
   
  for(int t1 = 1; t1 <= n; t1++) {
    float ptheta = TWO_PI * (t1 - 1) / n;
    float theta  = TWO_PI *  t1      / n;
 
    float px = r * cos(ptheta);
    float pz = r * sin(ptheta);
     
    float  x = r * cos(theta);
    float  z = r * sin(theta);
 
    for(int t2 = 0; t2 <= m; t2++) {
      float y = h *  t2      / m - 0.5 * h;
      drawLine(px, y, pz, x, y, z);
    }
    drawLine(x, -0.5*h, z, x, 0.5*h, z);
  }
}
 
// ドーム
void drawDome(float a, float b, float c) {
  final int N =  5;  // x - y平面の分割数
  final int M = 10;  // y 軸上の分割数
   
  int n = N -1;
  int m = M -1;
  for(int t1 = 1; t1 <= n; t1++) {
    float theta  = HALF_PI * (t1    ) / n;
    float ptheta = HALF_PI * (t1 - 1) / n;
     
    float sintheta = sin(theta);
    float costheta = cos(theta);
    float sinptheta = sin(ptheta);
    float cosptheta = cos(ptheta);
 
    for(int t2 = 1; t2 <= m; t2++) {
      float phi  = TWO_PI * (t2    ) / m;
      float pphi = TWO_PI * (t2 - 1) / m;
       
      float sinphi = sin(phi);
      float cosphi = cos(phi);
      float sinpphi = sin(pphi);
      float cospphi = cos(pphi);
 
      float px = a * sintheta * cospphi;
      float pz = c * sintheta * sinpphi;
      float py = b * costheta;
       
      float x = a * sintheta * cosphi;
      float z = c * sintheta * sinphi;
      float y = b * costheta;
       
      drawLine(px, py, pz, x, y, z);
       
      px = a * sinptheta * cosphi;
      pz = c * sinptheta * sinphi;
      py = b * cosptheta;
       
      x = a * sintheta * cosphi;
      z = c * sintheta * sinphi;
      y = b * costheta;
       
      drawLine(px, py, pz, x, y, z);
    }
  }
}
