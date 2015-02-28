
// 3D関連
private float[][] cameraMat;
private float[][] worldMat;

// 行列スタック関連
private final int   N_STACK = 10;    // スタック数
private float[][][] matricesStack;  // 行列スタック
private int         sp;             // スタックポインタ       

// 世界座標系から見たカメラ座標軸ベクトル
private PVector xCam;
private PVector yCam;
private PVector zCam;

private static final int WIDTH  = 400;
private static final int HEIGHT = 300;

private PVector g_eyePt;

// 変換結果を一時的に格納するためのベクトル
private PVector tmp;

// 線を引くための端点
private PVector start;
private PVector end;

int     t;  // 時間

// ====================
ArrayList<ArrayList<PVector>>        g_polygonsList;
HashMap<ArrayList<PVector>, Float>   g_zMap;
HashMap<ArrayList<PVector>, Integer> g_colorMap;
// ====================

Cube pencil;
Cube[] __debug = new Cube[2];

void setup() {
  // サイズを400x300に設定 
  size(400, 300);
  frameRate(30);
  background(0xFFFFFFFF);

  xCam  = new PVector();
  yCam  = new PVector();
  zCam  = new PVector();
  
  tmp = new PVector();

  start = new PVector();
  end   = new PVector();

  g_eyePt = new PVector();
  g_polygonsList = new ArrayList<ArrayList<PVector>>();
  g_zMap = new HashMap<ArrayList<PVector>, Float>();
  g_colorMap = new HashMap<ArrayList<PVector>, Integer>();
  
  worldMat  = new float[4][4];
  cameraMat = new float[4][4];

  for(int i = 0; i < 4; ++i)
    for(int j = 0; j < 4; ++j)
      worldMat[i][j] = cameraMat[i][j] = i == j ? 1.0 : 0.0;

  // 行列スタックの初期化
  matricesStack = new float[N_STACK][4][4];
  sp = 0;

  fill(255);
  //stroke(100);
  noStroke();
  
  pencil = new Cube(100, 100, 100);
  
  for(int i = 0; i < __debug.length; ++i) {
    __debug[i] = new Cube(100, 100, 100);
  }
  
  noSmooth();
}



void draw() {
  background(0xFFFFFFFF);

  // ====================
  g_polygonsList.clear();
  g_colorMap.clear();
  g_zMap.clear();
  // ====================

  pushMat();
    float cam_dist = 500;
    float angle = radians(frameCount*2);

    g_eyePt.set(cam_dist * sin(angle),
        100, //-cam_dist * cos(angle),
        cam_dist * cos(angle));

    cam(g_eyePt.x,
        g_eyePt.y,
        g_eyePt.z,
        0, 0, 0, 0, 1, 0);
  
  pushMat();

  for(int i = 0; i < __debug.length; ++i) {
    pushMat();
    trans((int) i * 200 - 100, 0 , 0);
    __debug[i].update();
    popMat();
  }
  popMat();

  popMat();



  // ====================
  // text("こんにちは", 10, 10);
  if(g_polygonsList.size() < 1) return;

  zSort(0, g_polygonsList.size() - 1);


  for(ArrayList<PVector> polygon : g_polygonsList) {
    if(ccw(polygon.get(0), polygon.get(1), polygon.get(2)) > 0) 
      continue;
      
    fill(g_colorMap.get(polygon));
    
    beginShape();
    for(PVector v : polygon) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);

  }

  // ====================

}



void zSort(int left, int right) {

  int i = left;
  int j = right;

  Float pivot = g_zMap.get(g_polygonsList.get((int)((i + j) / 2)));

  while(true) {
    while(g_zMap.get(g_polygonsList.get(i)) > pivot) ++i;
    while(pivot > g_zMap.get(g_polygonsList.get(j))) --j;
    
    if(!(i < j)) break;

    ArrayList<PVector> tmpList = g_polygonsList.get(i);
    g_polygonsList.set(i, g_polygonsList.get(j));
    g_polygonsList.set(j, tmpList);

    ++i;
    --j;
    
    if(left < i - 1)  zSort(left, i - 1);
    if(j + 1 < right) zSort(j + 1, right);
  }
}


// 与えられた3点を1,2,3の順に動くとき、
// 反時計回りになるのか時計回りになるかを調べる
// --------------------------------------------
// ※ ただし、PVectorの各要素はすべて正の整数を仮定
int ccw(PVector p0, PVector p1, PVector p2) {
  float dx1, dx2, dy1, dy2;
  dx1 = p1.x - p0.x; dy1 = p1.y - p0.y;
  dx2 = p2.x - p0.x; dy2 = p2.y - p0.y;
  if(dx1 * dy2 > dy1 * dx2) return +1;
  if(dx1 * dy2 < dy1 * dx2) return -1;
  if((dx1 * dx2 < 0) || (dy1 * dy2 < 0)) return -1;
  if((dx1 * dx1 + dy1 * dy1) < (dx2 * dx2 + dy2 * dy2)) return +1;
  return 0;
}


int getFillColor(ArrayList<PVector> polygon) {
  if (polygon.size() < 3) return 0;

  PVector p0 = polygon.get(0);
  PVector p1 = polygon.get(1);
  PVector p2 = polygon.get(2);  
  // (p1 - p0) x (p2 - p0)
  tmp.set( (p1.y - p0.y) * (p2.z - p0.z) - (p1.z - p0.z) * (p2.y - p0.y),
           (p1.z - p0.z) * (p2.x - p0.x) - (p1.x - p0.x) * (p2.z - p0.z),
           (p1.x - p0.x) * (p2.y - p0.y) - (p1.y - p0.y) * (p2.x - p0.x) );

  mul(worldMat, tmp, tmp);

  float angle = PVector.angleBetween(tmp, zCam);

  return (int)(angle * 0xff / PI);
}

interface IUpdatable {
  void update();
}

class RenderableObject implements IUpdatable {
  protected ArrayList<ArrayList<PVector>> polygonsList;
  protected HashMap<PVector, PVector>     verticesMap;
  
  public RenderableObject() {
    verticesMap = new HashMap<PVector, PVector>();
    polygonsList = new ArrayList<ArrayList<PVector>>();
  }
  
  public void update() {
    addToGlobalVerticesBuffers(polygonsList, verticesMap);
  }
  
  protected void addToGlobalVerticesBuffers(ArrayList<ArrayList<PVector>> localPolygonsList, 
                                HashMap<PVector, PVector>     localToProjectionMap) {
    Iterator iter = localToProjectionMap.entrySet().iterator();
    while(iter.hasNext()) {
      Map.Entry me = (Map.Entry)iter.next();
      wvp((PVector)me.getKey(), (PVector)me.getValue());
    }
    
    for(ArrayList<PVector> polygon : localPolygonsList) {
      int fillColor = getFillColor(polygon);
      ArrayList<PVector> polygon2 = new ArrayList<PVector>();
      
      
      float zMin =  3.4028235E38;
      float zMax = -3.4028235E38;
      
      float xMin = width;
      float xMax = 0;
      float yMin = height;
      float yMax = 0;
      
      float zVal = 0;
      
      boolean invalid = false;
      
      PVector sum = new PVector();
      
      for(PVector vec3 : polygon) {
        PVector vec2 = localToProjectionMap.get(vec3);
        
        if(zMin > vec2.z) {
          zMin = vec2.z;
          if(!(zMin > 0)) { invalid = true; break; }
        }
        
        if(zMax < vec2.z) zMax = vec2.z;
        
        if(xMin > vec2.x) {
          xMin = vec2.x;
          if (xMin > width) { invalid = true; break; }
        }
        
        if(xMax < vec2.x) {
          xMax = vec2.x;
          if(xMax < 0) { invalid = true; break; }
        }
        
        if(yMin > vec2.y) {
          yMin = vec2.y;
          if (yMin > height) { invalid = true; break; }
        }
        
        if(yMax < vec2.y) {
          yMax = vec2.y;
          if(yMax < 0) { invalid = true; break; }
        }
        
        zVal += vec2.z;
        polygon2.add(vec2);
        
        sum.add(vec2);
      }
      
      if(invalid) continue;
      
      zVal /= polygon2.size();
      
      g_polygonsList.add(polygon2);
      g_colorMap.put(polygon2, fillColor);
      g_zMap.put(polygon2, zMin);
    }
  }
}

class Cube extends RenderableObject {
  Cube(float x, float y, float z) {
    super();
    float halfX = x * 0.5;
    float halfY = y * 0.5;
    float halfZ = z * 0.5;
    

    ArrayList<PVector> verticesList = new ArrayList<PVector>();
    verticesList.add(new PVector(-halfX,  halfY, -halfZ));
    verticesList.add(new PVector(-halfX, -halfY, -halfZ));
    verticesList.add(new PVector( halfX, -halfY, -halfZ));
    verticesList.add(new PVector( halfX,  halfY, -halfZ));
    
    verticesList.add(new PVector(-halfX,  halfY,  halfZ));
    verticesList.add(new PVector(-halfX, -halfY,  halfZ));
    verticesList.add(new PVector( halfX, -halfY,  halfZ));
    verticesList.add(new PVector( halfX,  halfY,  halfZ));
    
    for(PVector v : verticesList) {
      verticesMap.put(v, new PVector());
    }
    
    
    ArrayList<PVector> polygon;
    
    // 1.
    polygon = new ArrayList<PVector>();
    for(int i = 0; i < 4; ++i) {
      polygon.add(verticesList.get(i));
    }
    polygonsList.add(polygon);
    
    // 2.
    polygon = new ArrayList<PVector>();
    for(int i = 7; !(i < 4); --i) {
      polygon.add(verticesList.get(i));
    }
    polygonsList.add(polygon);
    
    // 3.
    for(int i = 0; i < 4; ++i) {

      polygon = new ArrayList<PVector>();
    
      polygon.add(verticesList.get(i));
      polygon.add(verticesList.get(i + 4));
      polygon.add(verticesList.get((i + 1) % 4 + 4));  
      polygon.add(verticesList.get((i + 1) % 4));

      polygonsList.add(polygon);
    }
    
  }
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
private static final float FOCAL_LENGTH = (HEIGHT/2.0) / tan(PI*60.0 / 360.0);

void projection(PVector v, PVector dst) {
  if(!(v.z < 0)) {
    dst.set(-1, -1, -1);
    return;
  }
  
  float x = FOCAL_LENGTH * v.x / -v.z + 0.5 * width;
  float y = FOCAL_LENGTH * v.y / -v.z + 0.5 * height;
  
  float z = v.z * v.z;
  
  dst.set(x, y, z);
}

// =============================================================

// スタック操作

void pushMat() {
  ++sp;
  if(sp >= matricesStack.length) return;  // エラー
  for(int i = 0; i < 4; ++i) {
    for(int j = 0; j < 4; ++j) {
      matricesStack[sp][i][j] = worldMat[i][j];
    }
  }
}

void popMat() {
  if(sp < 0) return;  // エラー
  for(int i = 0; i < 4; ++i) {
    for(int j = 0; j < 4; ++j) {
      worldMat[i][j] = matricesStack[sp][i][j];
    }
  }
  --sp;
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
  for(int i = 0; i < 4; ++i) {
    for(int j = 0; j < 4; ++j) {
      ret[i][j] = 0.0;
      for(int k = 0; k < 4; ++k) {
        ret[i][j] += a[i][k] * a[k][j];
      }
    }
  }
  return ret;
}




