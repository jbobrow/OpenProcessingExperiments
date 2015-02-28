
// ===============================================
// 観覧車です（割と適当）
// -----------------------------------------------
// パラメータをいじると、観覧車の大きさや
// ゴンドラの数を変更する事ができます。
// ===============================================

final int   nGondolas   =  40;      // ゴンドラの数
final float gondolaSize =  12;      // ゴンドラの半径
final float len         = 110;      // ワイヤの長さ
final float speed       =   0.001;  // 回転速度
final float depth       =   3;      // 奥行きの大きさ
final int   nRebars     =   5;      // 鉄筋の複雑さ
final int   nStars      = 500;      // 星の数

PVector[]   stars;
PImage refrection;
PImage blurImage;
double noiseCount;
long time;

void setup() {
  size(300, 300, P3D);
  refrection = createImage(width, height, RGB);
  blurImage  = createImage(width, height, RGB);
  stars = new PVector[nStars];
  
  for(int i = 0; i < stars.length; i++) {
    float l = random(2000, 10000);
    float angle = 1000.0 * random(TWO_PI) / 1000.0;
    stars[i] = new PVector(l*cos(angle),random(-10000, -(len + gondolaSize)),l*sin(angle));
  }
  smooth();
}

void draw() {
  // パフォーマンス向上のため局所変数にロード
  PImage  _refrection = refrection;
  PImage  _blurImage  = blurImage;
  
  background(0xFF000000);
  colorMode(HSB, nGondolas -1, 100, 100);
  
  noFill();
  
  camera(-300*sin(radians(time*0.01+45)), -(len + gondolaSize), -300*cos(radians(time*0.01+45)), 
         0, -(len + gondolaSize), 0, 0, 1, 0);

  // 星
  stroke(0xFFAAAAAA);
  for(int i = 0; i < stars.length; i++) {
    point(stars[i].x, stars[i].y, stars[i].z);
  }

  // 反射
  pushMatrix();
  applyMatrix(1, 0, 0, 0,
              0, -1, 0, 0,
              0,  0, 1, 0,
              0,  0, 0, 1);
              
  drawFerrisWheel();
  popMatrix();
  
  // 反射を背景化
  loadPixels();
  _refrection.loadPixels();
  for(int y = 0; y < _refrection.height; y++) {
    float rate = (float)(_refrection.height - y) / _refrection.height;
    for(int x = 0; x < _refrection.width; x++) {
      int c = pixels[y * _refrection.width + x];
      int r = (int)((c >> 16 & 0xFF) * rate + 0.5);
      int g = (int)((c >>  8 & 0xFF) * rate + 0.5);
      int b = (int)((c       & 0xFF) * rate + 0.5);
      _refrection.pixels[y * _refrection.width + x] = 0xFF << 24 | r << 16 | g << 8 | b;
    }
  }
  _refrection.updatePixels();
  updatePixels();
  background(_refrection);
  
  // 乱反射エフェクト
  float xnoise = 0.0;
  float ynoise = -(float)(noiseCount+=random(1));
  float xinc   = 0.05;
  float yinc   = 0.3;
  
  loadPixels();
  _refrection.loadPixels();
  for(int y = _refrection.height * 4 / 5; y < _refrection.height; y++) {
    float rate = (float) y / height;
    for(int x = 0; x < _refrection.width; x++) {
     
      float refNoise = min(0, 0.5-noise(xnoise , ynoise)) * rate;
      xnoise += xinc;
       
      int xoffset = (int)(0.1 * refNoise * (x - 0.5 * _refrection.width));
      int yoffset = (int)(refNoise * 50);
      int row = min(_refrection.height - 1, max(0, y + yoffset));
      int col = min(_refrection.width  - 1, max(0, x + xoffset));
      _refrection.pixels[y * _refrection.width + x] = pixels[row * _refrection.width + col];
    }
    xnoise = 0.0;
    ynoise += yinc;
  }
  _refrection.updatePixels();
  updatePixels();
   
  // 水面の反射の描画
  pushMatrix();
  camera();
  background(_refrection);
  popMatrix();
  
  // メインの観覧車の描画
  drawFerrisWheel();
  
  int step = 2;  // 必ず、widthとheightの最大公約数で指定
  _blurImage.resize(width/step, height/step);
  loadPixels();
  for(int y = 0; y < height; y+=step) {
    for(int x = 0; x < width; x+=step) {
      blurImage.pixels[((y * width)/step + x) / step] = pixels[y * width + x];
    }
  }
  _blurImage.filter(BLUR);
  _blurImage.resize(width, height);
   
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int index = y * width + x;
      int c1 = blurImage.pixels[index];
      int r1 = c1 >> 16 & 0xFF;
      int g1 = c1 >>  8 & 0xFF;
      int b1 = c1       & 0xFF;
       
      int c2 = pixels[index];
      int r2 = c2 >> 16 & 0xFF;
      int g2 = c2 >>  8 & 0xFF;
      int b2 = c2       & 0xFF;
       
      int r = min(0xFF, r1 + r2);
      int g = min(0xFF, g1 + g2);
      int b = min(0xFF, b1 + b2);
       
      pixels[index] = 0xFF << 24 | r << 16 | g << 8 | b;
    }
  }
   
  updatePixels();
  time++;
}

void drawFerrisWheel() {
  float dAngle = TWO_PI / nGondolas;
  float dL     = len    / (nRebars);
  int   h      = 0;  // 色彩
  pushMatrix();
  translate(0, -(len + gondolaSize), 0);
  // 脚
  stroke(0xFF646464);
  line(0, 0,  0.5*depth, -0.3*len, len + gondolaSize,  depth);
  line(0, 0,  0.5*depth,  0.3*len, len + gondolaSize,  depth);
  line(0, 0, -0.5*depth, -0.3*len, len + gondolaSize, -depth);
  line(0, 0, -0.5*depth,  0.3*len, len + gondolaSize, -depth);
  
  for(float i = 0; i < TWO_PI; i += dAngle) {
    
    float angle     =  i + time * speed;
    float prevAngle = (i - dAngle) + time * speed;
    float nextAngle = (i + dAngle) + time * speed;
    
    stroke(0xFF646464);
    
    line(len*cos(angle), len*sin(angle),  0.5*depth, 
         len*cos(angle), len*sin(angle), -0.5*depth);

    // 筋交い
    float carrefour = (nRebars + 1) / 2 * dL; 
    line(0,                          0,                          0.5*depth,
         carrefour * cos(nextAngle), carrefour * sin(nextAngle), 0.5*depth);
    line(carrefour * cos(nextAngle), carrefour * sin(nextAngle), 0.5*depth,
         len       * cos(angle),     len       * sin(angle),     0.5*depth);
    line(0,                          0,                          0,
         carrefour * cos(prevAngle), carrefour * sin(prevAngle), 0.5*depth);
    line(carrefour * cos(prevAngle), carrefour * sin(prevAngle), 0.5*depth,
         len       * cos(angle),     len       * sin(angle),     0.5*depth);
    line(0,                          0,                          -0.5*depth,
         carrefour * cos(nextAngle), carrefour * sin(nextAngle), -0.5*depth);
    line(carrefour * cos(nextAngle), carrefour * sin(nextAngle), -0.5*depth,
         len       * cos(angle),     len       * sin(angle),     -0.5*depth);
    line(0,                          0,                          0,
         carrefour * cos(prevAngle), carrefour * sin(prevAngle), -0.5*depth);
    line(carrefour * cos(prevAngle), carrefour * sin(prevAngle), -0.5*depth,
         len       * cos(angle),     len       * sin(angle),     -0.5*depth);
    
    for(float j = 0; j < nRebars; j++) {
      float l     = j     * dL;
      float nextL = (j+1) * dL;
      
      line(l * cos(angle),     l * sin(angle),      0.5*depth,
           l * cos(nextAngle), l * sin(nextAngle),  0.5*depth);
      line(l * cos(angle),     l * sin(angle),     -0.5*depth,
           l * cos(nextAngle), l * sin(nextAngle), -0.5*depth);
    }
    noSmooth();
    noStroke();
    fill(h, 20, 50);
    drawGondola(len * cos(angle), len * sin(angle));
    h++;
    smooth();
  }
  popMatrix();
}

void drawGondola(float x, float y) {
  pushMatrix();
  final int n = 10;
  float shift = 0.5 * gondolaSize;
  translate(x, y + shift, 0);
  
  beginShape();
  for(int i = 0; i < n; i++) {
    float angle = TWO_PI * i / n;
    vertex(shift * cos(angle), shift * sin(angle), 0.5*depth);
  }
  endShape();

  beginShape();
  for(int i = 0; i < n; i++) {
    float angle = TWO_PI * i / n;
    vertex(shift * cos(angle), shift * sin(angle), -0.5*depth);
  }
  endShape(); 
  popMatrix();
}

