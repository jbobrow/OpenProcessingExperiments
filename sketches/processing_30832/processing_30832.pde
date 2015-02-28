
final int  N_PARTICLES = 2000;
Particle[] particles;
float[][]  speedRateMap;
long       time;

void setup() {
  size(400, 300);
  frameRate(30);
  time = 0;
  
  particles = new Particle[N_PARTICLES];
  for(int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
  
  // 通常時・ブレーキ時のスピードレート
  float normalSpeedRate = 2.0;
  float brakeSpeedRate  = 0.1;
  
  // ノイズ画像から速度レートマップ生成
  // ========================================================
  // smap を任意の画像に差し替えれば、
  // パーティクルでメッセージを作る事も可能
  speedRateMap = new float[width][height];
  PImage smap = createCroud();
  for(int y = 0; y < smap.height; y++) {
    for(int x = 0; x < smap.width; x++) {
      int c = smap.pixels[y * width + x] & 0xFF;
      // マップに基づいて速度の減衰率を求める
      float data = 1.0 - (float)c / 0xFF;
      data *= (normalSpeedRate - brakeSpeedRate);
      data += brakeSpeedRate;
      
      speedRateMap[x][y] = data;
    }
  }
}

void draw() {
  time++;
  background(0); 
  stroke(255);
  
  for(int i = 0; i < particles.length; i++) {
    Particle p = particles[i];
    stroke(p._color);
    point(p.x, p.y);
    p.update();
  }
  blendTwincle();
}

private void blendTwincle() {
  PImage fg = createTwincle();

  loadPixels();
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int c1 = pixels[y * width + x];
      int c2 = fg.pixels[y * width + x];
      pixels[y * width + x] = addColor(c1, c2);
    }
  }
  updatePixels();
}

int addColor(int c1, int c2) {
  int r1 = c1 >> 16 & 0xFF;
  int g1 = c1 >>  8 & 0xFF;
  int b1 = c1       & 0xFF;
      
  int r2 = c2 >> 16 & 0xFF;
  int g2 = c2 >>  8 & 0xFF;
  int b2 = c2       & 0xFF;
      
  int r = r1 + r2 < 0xFF ? r1 + r2 : 0xFF;
  int g = g1 + g2 < 0xFF ? g1 + g2 : 0xFF;
  int b = b1 + b2 < 0xFF ? b1 + b2 : 0xFF;
  
  return 0xFF << 24 | r << 16 | g << 8 | b;
}

// 指定した透過率で色を黒っぽくする
int transColor(int c, float _alpha) {
  float a;
  a = min(_alpha, 1.0);
  a = max(_alpha, 0.0);
  
  int r1 = c >> 16 & 0xFF;
  int g1 = c >>  8 & 0xFF;
  int b1 = c       & 0xFF;
  
  int r = (int)(r1 * a + 0.5);
  int g = (int)(g1 * a + 0.5);
  int b = (int)(b1 * a + 0.5);
  return 0xFF << 24 | r << 16 | g << 8 | b;
}

PImage blendImage;
private PImage createTwincle() {
  if(blendImage == null) 
    blendImage = createImage(width / 2, height / 2, RGB);
  
  PImage _capture = createImage(width / 2, height / 2, RGB);
  
  float _alpha;
  if(mousePressed) _alpha = 0.98;  // マウスボタンを押すとブーストする
  else _alpha = random(0.9, 0.99);
  
  loadPixels();
  for(int y = 0; y < _capture.height; y++) {
    for(int x = 0; x < _capture.width; x++) {
      int c1 = blendImage.pixels[y * blendImage.width + x];
      int c2 = pixels[(y * 2) * width + (x * 2)];

      c1 = transColor(c1, _alpha);
      
      blendImage.pixels[y * blendImage.width + x]
        = _capture.pixels[y * _capture.width + x]
          = addColor(c1, c2);
    }
  }
  updatePixels();
  blendImage.filter(BLUR);
  _capture.resize(width, height);  
  return _capture;
}

class Particle {
  public int x, y;
  public int _color;
  private float  _x,  _y;
  private float _dx, _dy;
  private final int MAX_H = 120;  // 色相の階調数
  
  Particle(float x, float y) {
    initialize();
    
    this._x = (int)(this._x = x);
    this._y = (int)(this._y = y);
    _color = 0x00000000;
  }
  
  void update() {
    float rate = 1.0;
    // マップから速度レート読み込み
    if (x >= 0 && x < speedRateMap.length 
        && y >= 0 && y < speedRateMap[0].length)
          rate = speedRateMap[x][y];
    
    x = (int)(_x += (_dx * rate));
    y = (int)(_y += (_dy * rate));
    if(y >= height) initialize();
  }
  
  private void initialize() {
    colorMode(HSB, MAX_H, 100, 100);
    _color = color(time % MAX_H, 50, 70);
        
    x = (int)(_x = random(width));
    y = (int)(_y = 0);
    
    this._dx = random(-0.1, 0.1);
    this._dy = random(2, 4);
  }
}

// ==========================================================
// 雲模様データの生成
// ==========================================================
private PImage createCroud() {
  PImage img = createImage(width, height, RGB);
  
  float xbase  = random(100);
  float ybase  = random(100);
  
  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc    = 0.02;
  
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int _gray = 
        (int)(noise(xnoise+xbase, ynoise+ybase)*0xFF+0.5);
      img.pixels[y * width + x] = _gray;
      xnoise += inc;
    }
    xnoise = 0.0;
    ynoise += inc;
  }
  return img;
}


