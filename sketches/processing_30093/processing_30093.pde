
final int QUAD_NUM  = 1000;
final int HUE_RANGE =  360;

Camera cam;
Quad[] quadArray;
int quadCounter;
int hueCounter;

void setup() {
  size(800, 600, P3D);
  quadCounter = 0;
  hueCounter  = 0;
  // 適当にカメラ設定
  cam = new Camera(1000, 1000, 1000, 0, 0, 0, 0, 1, 0);
  quadArray = new Quad[QUAD_NUM];
  colorMode(HSB, HUE_RANGE, 100, 100, QUAD_NUM);
  
  for(int i = 0; i < quadArray.length; i++) {
    PVector dummy = new PVector(-99999999, -99999999, -99999999);
    quadArray[i] = new Quad();
    quadArray[i].v1 = quadArray[i].v2 = quadArray[i].v3 = quadArray[i].v4 = dummy;
    quadArray[i].a  = 0;
  }
}

void draw() {
  background(0);
  cam.update();
  if(mousePressed) {
    if(mouseButton == LEFT) {
      PVector origin = cam.eyeVec;
      PVector mousePoint = cam.mouseVec;
      
      float t = random(2, 20);    
      PVector dst = 
        PVector.add(origin, PVector.mult(PVector.sub(mousePoint, origin), t));
      
      float w = random(100, 200);
      float h = random(100, 200);
      PVector xCam = cam.xCam;
      PVector yCam = cam.yCam;
      PVector zCam = cam.zCam;
      
      quadArray[quadCounter].v1 =
        PVector.add(dst, PVector.add(PVector.mult(xCam, -w/2), PVector.mult(yCam, -h/2)));
      quadArray[quadCounter].v2 =
        PVector.add(dst, PVector.add(PVector.mult(xCam, -w/2), PVector.mult(yCam, h/2)));
      quadArray[quadCounter].v3 =
        PVector.add(dst, PVector.add(PVector.mult(xCam, w/2), PVector.mult(yCam, h/2)));
      quadArray[quadCounter].v4 =
        PVector.add(dst, PVector.add(PVector.mult(xCam, w/2), PVector.mult(yCam, -h/2)));
  
      quadArray[quadCounter].a = (int)(QUAD_NUM * 0.8);
      
      quadCounter = (quadCounter+1) % QUAD_NUM;
      hueCounter  = (hueCounter+1)  % HUE_RANGE;
    }
    if(mouseButton == RIGHT) {
      if(mouseX - pmouseX != 0 || mouseY - pmouseY != 0) { 
        cam.rotX(radians(mouseX - pmouseX));
        cam.rotY(radians(mouseY - pmouseY));
        for(int i = 0; i < quadArray.length; i++) {
          quadArray[i].a -= 5;
        }
      }
    }
  }
  noStroke();
  beginShape(QUADS);
  for(int i = 0; i < quadArray.length; i++) {
    if(--quadArray[i].a < 0) continue;
    fill(i % HUE_RANGE, 100, 100, quadArray[i].a);
    vertex(quadArray[i].v1.x, quadArray[i].v1.y, quadArray[i].v1.z);
    vertex(quadArray[i].v2.x, quadArray[i].v2.y, quadArray[i].v2.z);
    vertex(quadArray[i].v3.x, quadArray[i].v3.y, quadArray[i].v3.z);
    vertex(quadArray[i].v4.x, quadArray[i].v4.y, quadArray[i].v4.z);
  }
  endShape(QUADS);
} 

class Camera {
  public PVector eyeVec;
  public PVector centerVec;
  public PVector mouseVec;
  
  private double[][] cameraMat;
  private PVector xCam;  // 世界座標空間から見たカメラx軸
  private PVector yCam;  // 世界座標空間から見たカメラy軸
  private PVector zCam;  // 世界座標空間から見たカメラz軸
  private final float f = (height/2.0) / tan(PI*60.0 / 360.0);  // 焦点距離
  private float distance;  // 視点から注視点までの距離
  
  Camera() {
    this(
      width/2.0, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0), 
      width/2.0, height/2.0, 0,     
      0, 1, 0);
  }
  Camera(float eyeX, float eyeY, float eyeZ,
         float centerX, float centerY, float centerZ, 
         float upX, float upY, float upZ) {
           
    // 初期化
    eyeVec = new PVector(eyeX, eyeY, eyeZ);
    centerVec = new PVector(centerX, centerY, centerZ);
    mouseVec = new PVector();
    cameraMat = new double[4][4];
    distance = PVector.dist(eyeVec, centerVec);

    // 行列を作る
    createMat(eyeX, eyeY, eyeZ, 
              centerX, centerY, centerZ, 
              upX, upY, upZ);
  }
  
  private void createMat(PVector eye, PVector ctr) {
    createMat(eye.x, eye.y, eye.z, ctr.x, ctr.y, ctr.z, yCam.x, yCam.y, yCam.z);
  }
  
  private void createMat(float eyeX, float eyeY, float eyeZ,
                         float centerX, float centerY, float centerZ, 
                         float upX, float upY, float upZ) {
    
    // カメラ座標空間の3軸
    zCam = new PVector(eyeX-centerX, eyeY-centerY, eyeZ-centerZ);
    yCam = new PVector(upX, upY, upZ);
    xCam = yCam.cross(zCam);
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
  
  public void update() {
    resetMatrix();
    applyMatrix((float)cameraMat[0][0], (float)cameraMat[0][1], (float)cameraMat[0][2], (float)cameraMat[0][3],
                (float)cameraMat[1][0], (float)cameraMat[1][1], (float)cameraMat[1][2], (float)cameraMat[1][3],
                (float)cameraMat[2][0], (float)cameraMat[2][1], (float)cameraMat[2][2], (float)cameraMat[2][3],
                (float)cameraMat[3][0], (float)cameraMat[3][1], (float)cameraMat[3][2], (float)cameraMat[3][3]);
    
    PVector centerScreen = PVector.mult(zCam, -f);   // スクリーン中心座標
    
    // 世界座標空間から見たスクリーン上のマウス座標（ややこしい！）
    PVector xMouse = PVector.mult(xCam, (mouseX - width/2));
    PVector yMouse = PVector.mult(yCam, (mouseY - height/2));
    mouseVec.x = eyeVec.x + centerScreen.x + xMouse.x + yMouse.x;
    mouseVec.y = eyeVec.y + centerScreen.y + xMouse.y + yMouse.y;
    mouseVec.z = eyeVec.z + centerScreen.z + xMouse.z + yMouse.z;
  }
  
  public void rotY(float amount) {
    rot(xCam, -amount);
  }
  
  public void rotX(float amount) {
    rot(yCam, amount);
  }
  
  private void rot(PVector axis, float amount) {
    if (abs(amount) < radians(0.1)) return;
    
    PVector tmp = PVector.sub(eyeVec, centerVec);
    double[][] mat = createRotMat(axis, amount);
    
    PVector v = new PVector();
    v.x = tmp.x * (float)mat[0][0] + tmp.y * (float)mat[1][0] + tmp.z * (float)mat[2][0];
    v.y = tmp.x * (float)mat[0][1] + tmp.y * (float)mat[1][1] + tmp.z * (float)mat[2][1];
    v.z = tmp.x * (float)mat[0][2] + tmp.y * (float)mat[1][2] + tmp.z * (float)mat[2][2];
          
    eyeVec = PVector.add(v, centerVec);
    eyeVec.normalize();
    eyeVec.mult(distance);
    createMat(eyeVec, centerVec); 
  }
  
  // 任意の軸周りの回転行列を得る
  private double[][] createRotMat(PVector axis, float t) {
    PVector n = axis;
    double[][] mat = new double[3][3];
    mat[0][0] = n.x * n.x * (1.0 - cos(t)) + cos(t);
    mat[0][1] = n.x * n.y * (1.0 - cos(t)) + n.z * sin(t);
    mat[0][2] = n.x * n.z * (1.0 - cos(t)) - n.y * sin(t);
    
    mat[1][0] = n.x * n.y * (1.0 - cos(t)) - n.z * sin(t);
    mat[1][1] = n.y * n.y * (1.0 - cos(t)) + cos(t);
    mat[1][2] = n.y * n.z * (1.0 - cos(t)) + n.x * sin(t);
    
    mat[2][0] = n.x * n.z * (1.0 - cos(t)) + n.y * sin(t);
    mat[2][1] = n.y * n.z * (1.0 - cos(t)) - n.x * sin(t);
    mat[2][2] = n.z * n.z * (1.0 - cos(t)) + cos(t);
    return mat;
  }
}

// ただの構造体だよ
class Quad {
  public PVector v1, v2, v3, v4;
  public int a;  // アルファ値（手抜き）
}

