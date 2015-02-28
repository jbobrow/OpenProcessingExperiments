
// ∴∵∴∵∴∵∴∵∴∵∴∵∴∵∴∵∴∵∴
// 
// オーロラです
// =======================================
// マウスのドラッグで視点の変更ができますよ∩( ・ω・)∩
//
// ∵∴∵∴∵∴∵∴∵∴∵∴∵∴∵∴∵∴∵

final float AURORA_WIDTH =  3000;
final float AURORA_HEIGHT = 400;
float[][] noiseMap1, noiseMap2;
PVector[] stars;
int time;
float angleXY, angleXZ;
PImage glow;             // グローエフェクト
PImage bg;               // バックグラウンド
PImage tex;              // テクスチャ
final int MAX_H = 500;  // 輝度の最大値

Scene scene;
void setup() {
  size(400, 300, P3D);
  frameRate(30);  
  scene = new Loading();
}

void draw() {
  scene = scene.update();
}

// ========================================
// ローディング状態用クラス
// ここで、リソースを読み込む
// ========================================
class Loading implements Scene {
  private boolean isLoading;
  private PImage  screenImg, loadingImg;
  Loading () {
    colorMode(RGB, 255, 255, 255, 255);
    isLoading = true;
    
    screenImg  = createImage(width, height, RGB);
    loadingImg = createImage(width, height, RGB);
    smooth();
    pushMatrix();
    background(255);
    camera();
    float radi = 20;
    float sx = radi;
    float sy = 0;
    strokeWeight(10);
    translate(width / 2, height / 2);
    for(int i = 1; i < 255; i++) {
      float ax = radi * cos(radians(i));
      float ay = radi * sin(radians(i));
      stroke(i, 255, i);
      line(sx, sy, ax, ay);
      sx = ax;
      sy = ay;
    }
    popMatrix();
    loadPixels();
    for(int i = 0; i < pixels.length; i++) {
      screenImg.pixels[i] = 0xFFFFFFFF;
      loadingImg.pixels[i] = pixels[i];
    }
    updatePixels();
    noSmooth();    
    
    new Thread () {
      public void run() {
        init();
      }
    }.start();
  }
  
  Scene update() {
    background(screenImg);
    
    pushMatrix();
    translate( width/2, height/2);
    rotate(radians(time -= 20));
    translate(-width/2, -height/2);
    image(loadingImg, 0, 0);
    popMatrix();
    
    if(isLoading) return this;
    return new StateTransitionEffect(this, new AuroraEffect());
  }
  
  private synchronized void init() {
    // 星を作る
    stars = new PVector[50];
    for(int i = 0; i < stars.length; i++) {
      stars[i] = new PVector( 1000 * random(-AURORA_WIDTH/2, AURORA_WIDTH/2),
                             -1000 * random(                 AURORA_WIDTH/2),
                              1000 * random(-AURORA_WIDTH/2, AURORA_WIDTH/2));
    }
    
    noiseMap1 = createNoiseMap((int)(AURORA_WIDTH), (int)(AURORA_HEIGHT));
    noiseMap2 = createNoiseMap((int)(AURORA_WIDTH), (int)(AURORA_HEIGHT));
    glow      = createImage(width, height, RGB);
    bg        = createImage(width, height, RGB);
    angleXZ = radians(60);
    angleXY = -radians(20);
    // createTextures();
    noStroke();
    isLoading = false;
  }
  
  void setEnable(boolean isEnable) { }
}

// ========================================
// オーロラエフェクト
// ========================================
class AuroraEffect implements Scene {
  AuroraEffect() {
    time = 0;
    strokeWeight(1);
  }
  Scene update() {
    time++;
  
    // 背景と照明の設定
    background(0xFF000000);
    pushMatrix();
    camera();
    rotateY(radians(75));
    lights();
    popMatrix();
    
    if(mousePressed) {
      angleXZ += radians(mouseX - pmouseX);
      angleXY += radians(pmouseY - mouseY);
      
      // マウスによる可動範囲の制御
      /*
      if(angleXZ < -radians(60)) angleXZ = -radians(60);
      else if(angleXZ > radians(60)) angleXZ = radians(60);
      */
      if(angleXY < -radians(60))     angleXY = -radians(60);
      else if(angleXY > radians(30)) angleXY =  radians(30);
    }
    camera(400 * cos(angleXY) * cos(angleXZ), 
           400 * sin(angleXY), 
           400 * cos(angleXY) * sin(angleXZ), 
           0, 0, 0, 0, 1, 0);
    
    // 二重のオーロラを描画
    createTexture(time);
    renderAurora(noiseMap1, -300);
    loadPixels();
    for(int i = 0; i < pixels.length; i++) {
      bg.pixels[i] = pixels[i];
    }
    updatePixels();
    background(0xFF000000);
    createTexture(time + MAX_H * 9 / 10);
    renderAurora(noiseMap2, 0);
    
    // グローエフェクト
    loadPixels();

    for(int i = 0; i < pixels.length; i++) {
      int c1 = pixels[i];
      if(c1 == 0xFFFFFFFF) continue;    
      int c2 = boostColor(glow.pixels[i], 0.7);
      pixels[i] = addColor(c1, c2);
    }
    
    for(int i = 0; i < pixels.length; i++) {
      glow.pixels[i] = pixels[i] = addColor(pixels[i], bg.pixels[i]);
    }
    glow.resize(width / 20, height / 20);
    glow.filter(BLUR);
    glow.resize(width, height);
    
    updatePixels();
    
    // 星を描く  
    stroke(0xFFFFFFFF);
    for(int i = 0; i < stars.length; i++) {
      point(stars[i].x, stars[i].y, stars[i].z);
    }
    noStroke();
    
    return this;
  }
  
  private void renderAurora(float[][] noiseMap, float zoffset) {
    float coef = 400;  // ノイズの幅
    int   diff = 10;   // ポリゴンの粗さ（1が最も細かい）
    pushMatrix();
    rotateY(HALF_PI);
    translate(-AURORA_WIDTH / 2, -AURORA_HEIGHT, zoffset);
    
    for(int y = 0; y < AURORA_HEIGHT - 1; y += diff) {
      beginShape(TRIANGLE_STRIP);
      texture(tex);
      textureMode(NORMALIZED);
      for(int x = 0; x < AURORA_WIDTH; x += diff) {
        int xIndex = (x + time) % noiseMap.length;
        float u = (float)x / AURORA_WIDTH;
        for(int oy = 0; oy < 2 * diff; oy += diff) {
          int newY = y + oy;
          float v = (float) newY / AURORA_HEIGHT;
          int yIndex = (newY + time) % noiseMap[0].length;
          float z = coef * (noiseMap[xIndex][yIndex] - 0.5);
          vertex(x, newY, z, u, v);
        }
      }
      endShape();
    }
    popMatrix();
  }
  void setEnable(boolean isEnable) { }
}

// ========================================
// 2色を加算合成するメソッド
// ========================================
int addColor(int c1, int c2) {
  int r1 = c1 >> 16 & 0xFF; int r2 = (c2 >> 16 & 0xFF);
  int g1 = c1 >>  8 & 0xFF; int g2 = (c2 >>  8 & 0xFF);
  int b1 = c1       & 0xFF; int b2 = (c2       & 0xFF);
    
  int r = min(r1 + r2, 0xFF);
  int g = min(g1 + g2, 0xFF);
  int b = min(b1 + b2, 0xFF);
  
  return 0xFF << 24 | r << 16 | g << 8 | b;
}


int boostColor(int c1, float coef) {
  int r1 = c1 >> 16 & 0xFF;
  int g1 = c1 >>  8 & 0xFF;
  int b1 = c1       & 0xFF;
    
  int r = min((int)(r1 * coef + 0.5), 0xFF);
  int g = min((int)(r1 * coef + 0.5), 0xFF);
  int b = min((int)(r1 * coef + 0.5), 0xFF);
  
  return 0xFF << 24 | r << 16 | g << 8 | b;
}

// ========================================
// 初期化関連
// ========================================

void createTexture(int h) {
  if(tex == null) tex = createImage(180, 100, RGB);
  colorMode(HSB, MAX_H, 100, 100, 100);
  
  for(int i = 0; i < tex.height; i++) {
    float tmp = abs(i - 0.5 * tex.height) / (0.5 * tex.height);
    float alphaRate2 = 1.0 - tmp * tmp;
      
    for(int j = 0; j < tex.width; j++) {
      float alphaRate1 = 1.0 - abs(j - 0.5 * tex.width ) / (0.5 * tex.width);
      int c = color((j + h) % MAX_H, 70, 50);
        
      int r = (int)((c >> 16 & 0xFF) * alphaRate1 * alphaRate2 + 0.5);
      int g = (int)((c >>  8 & 0xFF) * alphaRate1 * alphaRate2 + 0.5);
      int b = (int)((c       & 0xFF) * alphaRate1 * alphaRate2 + 0.5);
        
      tex.pixels[i * tex.width + j] = 0xFF << 24 | r << 16 | g << 8 | b;
    }
  }
}

// Perlinノイズのリアルタイム生成はボトルネックになるため、
// 循環するノイズパターンを生成して使い回す
float[][] createNoiseMap(int w, int h) {
  float[][] res  = new float[w][h];
  float[][] tmp1 = new float[w][h];
  float[][] tmp2 = new float[w][h];
  
  float xstart = random(w);
  float ystart = random(h);
  float xnoise = xstart;
  float ynoise = ystart;
  float xinc   = 0.007;
  float yinc   = 0.002;
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      xnoise += xinc;
      tmp2[x][y] = res[(x + w / 2) % w][y] = noise(xnoise , ynoise);
    }
    xnoise = xstart;
    ynoise += yinc;
  }

  for(int x = 0; x < w; x++) {
    float rate = abs(0.5 * w - x) / (0.5 * w);
    for(int y = 0; y < h; y++) {
      res[x][y] = tmp1[x][(y + h / 2) % h] = 
        rate * res[x][y] + (1.0 - rate) * tmp2[x][y];
    }
  }

  for(int y = 0; y < h; y++) {
    float rate = abs(0.5 * h - y) / (0.5 * h);
    for(int x = 0; x < w; x++) {
      res[x][y] = rate * tmp1[x][y] + (1.0 - rate) * res[x][y];
    }
  } 
  return res;
}

