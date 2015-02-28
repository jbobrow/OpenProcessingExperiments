
// =============================================================
// 3D関連
float[][] cameraMat;
float[][] worldMat;

// 行列スタック関連
int N_STACK = 100;          // スタック数
float[][][] matricesStack;  // 行列スタック
int sp;                     // スタックポインタ

// =============================================================
// キューブ関連
float C_SIZE   = 130;
float C_MARGIN =  10;
long  t;
int mode_RotAxis, mode_RotPos, mode_RotDir;

void setup() {
  size(400, 300);
  frameRate(30);
  
  worldMat  = new float[4][4];
  cameraMat = new float[4][4];
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
      worldMat[i][j] = cameraMat[i][j] = i == j ? 1.0 : 0.0;
    }
  }
  
  // 行列スタックの初期化
  matricesStack = new float[N_STACK][4][4];
  sp = 0;
  
  noSmooth();
  stroke(200);
  noFill();
}

void draw() {
  background(0);
  float cam_dist  = 500;
  float cam_angle = radians(t*0.1);
  cam(cam_dist*cos(cam_angle), -cam_dist, cam_dist*sin(cam_angle),
      0, 0, 0, 0, 1, 0);
  pushMat();
  float offset = C_SIZE + C_MARGIN;
  trans(-offset, -offset, -offset);
   
  // ここで回転のモード切り替え
  if((t+=3) % 90 == 0) {
    mode_RotAxis = (int)(random(3));
    mode_RotPos  = (int)(random(3));
    mode_RotDir  = random(1) < 0.5 ? -1 : 1;
  }
   
  trans(offset, offset, offset);
  switch (mode_RotAxis) {
    case 0:
      rotX(radians(90));
      break;
    case 1:
      rotY(radians(90));
      break;
  }
  trans(-offset, -offset, -offset);
   
  for(int i = 0; i < 3; i++) {
    for(int j = 0; j < 3; j++) {
      for(int k = 0; k < 3; k++) {
        pushMat();
        trans(offset, offset, offset);
        if(k == mode_RotPos) rotZ(mode_RotDir * radians(t));
        trans(-offset, -offset, -offset);
        trans(i * offset, j * offset, k * offset);
        drawBox(C_SIZE);
        popMat();
      }
    }   
  }
  popMat();
}

void drawBox(float boxSize) {
  PVector v1 = wvp(new PVector(-boxSize * 0.5,  boxSize * 0.5, -boxSize * 0.5));
  PVector v2 = wvp(new PVector(-boxSize * 0.5,  boxSize * 0.5,  boxSize * 0.5));
  PVector v3 = wvp(new PVector( boxSize * 0.5,  boxSize * 0.5,  boxSize * 0.5));
  PVector v4 = wvp(new PVector( boxSize * 0.5,  boxSize * 0.5, -boxSize * 0.5));
  PVector v5 = wvp(new PVector(-boxSize * 0.5, -boxSize * 0.5, -boxSize * 0.5));
  PVector v6 = wvp(new PVector(-boxSize * 0.5, -boxSize * 0.5,  boxSize * 0.5));
  PVector v7 = wvp(new PVector( boxSize * 0.5, -boxSize * 0.5,  boxSize * 0.5));
  PVector v8 = wvp(new PVector( boxSize * 0.5, -boxSize * 0.5, -boxSize * 0.5));
  
  line(v1.x, v1.y, v2.x, v2.y);
  line(v2.x, v2.y, v3.x, v3.y);
  line(v3.x, v3.y, v4.x, v4.y);
  line(v4.x, v4.y, v1.x, v1.y);

  line(v5.x, v5.y, v6.x, v6.y);
  line(v6.x, v6.y, v7.x, v7.y);
  line(v7.x, v7.y, v8.x, v8.y);
  line(v8.x, v8.y, v5.x, v5.y);

  line(v1.x, v1.y, v5.x, v5.y);
  line(v2.x, v2.y, v6.x, v6.y);
  line(v3.x, v3.y, v7.x, v7.y);
  line(v4.x, v4.y, v8.x, v8.y);
}


void drawLine(PVector ss, PVector se) {
    PVector ps = wvp(ss);
    PVector pe = wvp(se);
    line(ps.x, ps.y, pe.x, pe.y);
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
void cam(float eyeX, float eyeY, float eyeZ,
                 float centerX, float centerY, float centerZ,
                 float upX, float upY, float upZ) {
     
  // カメラ座標空間の3軸
  PVector zCam = new PVector(eyeX-centerX, eyeY-centerY, eyeZ-centerZ);
  PVector yCam = new PVector(upX, upY, upZ);
  PVector xCam = yCam.cross(zCam);
          yCam = zCam.cross(xCam);
     
  // 正規化
  xCam.normalize();
  yCam.normalize();
  zCam.normalize();
     
  // 並進成分の計算
  PVector t = new PVector(
    -(eyeX * xCam.x + eyeY * xCam.y + eyeZ * xCam.z),
    -(eyeX * yCam.x + eyeY * yCam.y + eyeZ * yCam.z),
    -(eyeX * zCam.x + eyeY * zCam.y + eyeZ * zCam.z)
  );
     
  // 変換行列の作成・適用
  cameraMat[0][0] = xCam.x;
  cameraMat[0][1] = xCam.y;
  cameraMat[0][2] = xCam.z;
  cameraMat[0][3] = t.x;
     
  cameraMat[1][0] = yCam.x;
  cameraMat[1][1] = yCam.y;
  cameraMat[1][2] = yCam.z;
  cameraMat[1][3] = t.y;
     
  cameraMat[2][0] = zCam.x;
  cameraMat[2][1] = zCam.y;
  cameraMat[2][2] = zCam.z;
  cameraMat[2][3] = t.z;
     
  cameraMat[3][0] = 0.0;
  cameraMat[3][1] = 0.0;
  cameraMat[3][2] = 0.0;
  cameraMat[3][3] = 1.0;
}

// =============================================================
// ワールド・ビュー・射影変換
PVector wvp(PVector v) {
  PVector ret = projection(mul(cameraMat, mul(worldMat, v)));
  return ret;
}

// =============================================================
// 射影変換
PVector projection(PVector v) {
  PVector ret = new PVector();
  float distanceToCamera = (height/2.0) / tan(PI*60.0 / 360.0);
  ret.x = distanceToCamera * v.x / -v.z + 0.5 * width;
  ret.y = distanceToCamera * v.y / -v.z + 0.5 * height;
  return ret;
}

// =============================================================
// スタック操作
void pushMat() {
  sp++;
  if(sp >= matricesStack.length) return;  // エラー
  float[][] mat = new float[4][4];
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
      mat[i][j] = worldMat[i][j];
    }
  }
  matricesStack[sp] = mat;
}
void popMat() {
  if(sp < 0) return;  // エラー
  worldMat = matricesStack[sp];
  sp--;
}

// =============================================================
// 行列操作
PVector mul(float[][] m, PVector v) {
  PVector ret = new PVector(m[0][0] * v.x + m[0][1] * v.y + m[0][2] * v.z + m[0][3],
                            m[1][0] * v.x + m[1][1] * v.y + m[1][2] * v.z + m[1][3],
                            m[2][0] * v.x + m[2][1] * v.y + m[2][2] * v.z + m[2][3]);
  return ret;
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
