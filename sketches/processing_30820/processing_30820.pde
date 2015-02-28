
// ==========================================================
// しっぽ（tail_y）さんの SmolderEffect をパクって、
// Processing で再現しました（ごめんなさいごめんなさい）。
//
// ちなみに wonderfl のソースは移植せず、ほとんど「俺流」で
// 書きましたので、色々と最適化やらリファクタリングのの余地
// がありますがご容赦ください。
// ----------------------------------------------------------
// ネタ元： http://wonderfl.net/c/yFSI/
// ==========================================================

float[] croud;       // マスク制御用のデータを格納
boolean[] prevMask;  // マスク画像
boolean[] curMask;
boolean[] diff;      // 差分マスク

boolean[] noiseMask; // パーティクル用マスク
float t;             // 閾値

PImage bgImg;        // 背景画像
PImage fgImg;        // 前景画像
PImage croudMask;    // クラウド用マスク

PImage[]  img;       // テスト用画像
final int N_IMG = 4; // 画像の枚数
int imgIndex;

LinkedList<Particle> particleList;  // パーティクルリスト

void setup() {
  size(400, 300);
  frameRate(30);
  
  bgImg = loadImage("bg.png");
  
  img = new PImage[N_IMG];
  for(int i = 0; i < N_IMG; i++) {
    img[i] = loadImage("t"+ i +".png");
  }
  imgIndex = 0;
  
  fgImg = createImage(width, height, RGB);
  
  croud     = new float[width * height];
  prevMask  = new boolean[width * height];
  curMask   = new boolean[width * height];
  diff      = new boolean[width * height];
  noiseMask = new boolean[width * height];
  
  particleList = new LinkedList<Particle>();
  
  croudMask = createImage(width, height, RGB);
  initData(img[imgIndex]);
  smooth();
}

void draw() {
  loadPixels();
  
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int index = y * width + x;
      curMask[index]  = croud[index] < t;
      diff[index]     = prevMask[index] != curMask[index];
      prevMask[index] = curMask[index];
      
      if(curMask[index])
        pixels[index] = bgImg.pixels[index];  // 背景
      else
        pixels[index] = fgImg.pixels[index];  // 前景
      
      if(diff[index]) {
        pixels[index] = 0xFFFFFFFF;  // 破れた感じの描画
        if(noiseMask[index]) {
          particleList.add(new Particle(x, y, fgImg.pixels[index]));
        }
      }
    }
  }
  
  for(Iterator it = particleList.iterator(); it.hasNext(); ) {
    Particle p = (Particle)it.next();
    if(!p.update()) { it.remove(); continue; }
    pixels[p.y * width + p.x] = addColor(p._color, pixels[p.y * width + p.x]);
  }
  
  // 消失判定
  float speed = 1.0;  // フレームレートに依らない消失速度の計算
  if((t += (speed * 60.0 / frameRate)) >= 0xFF) {
    initData(img[imgIndex]);
  }
  updatePixels();
}

// ==========================================================
// 色加算メソッド
// ==========================================================
private int addColor(int c1, int c2) {
  //int a1 = (c1 >> 24) & 0xff;
  int r1 = (c1 >> 16) & 0xFF;
  int g1 = (c1 >>  8) & 0xFF;
  int b1 =  c1        & 0xFF;
  
  int r2 = (c2 >> 16) & 0xFF;
  int g2 = (c2 >>  8) & 0xFF;
  int b2 =  c2        & 0xFF;
  
  int r = r1 + r2 < 0xFF ? r1 + r2 : 0xFF;
  int g = g1 + g2 < 0xFF ? g1 + g2 : 0xFF;
  int b = b1 + b2 < 0xFF ? b1 + b2 : 0xFF;
  
  return (0xFF << 24 | r << 16 | g << 8 | b);
}

void mouseClicked() {
  initData(img[imgIndex]);
}

// ==========================================================
// 初期化処理
// 引数に、表示したい画像を渡す
// ==========================================================
private void initData(PImage _img) {
  particleList.clear();
  createCroud();
  createCroudMask(_img);
  
  t = 0;
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int index = y * width + x;
      boolean isBackground = (croudMask.pixels[y * width + x] & 0xFF) < 0x80;
      if(isBackground) croud[index] = 0xFF000000;
      prevMask[index] = curMask[index] = croud[index] < t;
      if(random(1.0) > 0.90) noiseMask[index] = !isBackground;
    }
  }
  imgIndex = ++imgIndex < N_IMG ? imgIndex : 0;
}

// ==========================================================
// 消失用制御用のマスクデータ作成
// 画像の回転に対応するため、少々まわりくどい方法を採っている
// ==========================================================
private void createCroudMask(PImage _img) {
  if(_img != null) {
    // 角度。デフォルトは0度だが、適当に角度をつける事も可能
    float angle = 0;
    
    // ======================================================
    // [1] croudMask のデータ生成
    // ======================================================
    PImage _maskImg = createImage(_img.width, _img.height, RGB);
    for(int y = 0; y < _maskImg.height; y++) {
      for(int x = 0; x < _maskImg.width; x++) {
        _maskImg.pixels[y * _maskImg.width + x] = 0xFFFFFFFF;
      }
    }
    background(0xFF000000);
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(angle);
    translate(-_maskImg.width/2, -_maskImg.height/2);
    image(_maskImg, 0, 0);
    popMatrix();
    loadPixels();    
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        croudMask.pixels[y * width + x] = pixels[y * width + x];
      }
    }
    updatePixels();
    
    // ======================================================
    // [2] fgImg のデータ生成
    // ======================================================
    background(bgImg);  // 予め背景画像を下敷きにしないと、更新時に一瞬ちらつく事がある
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(angle);
    translate(-_img.width/2, -_img.height/2);
    image(_img, 0, 0);
    popMatrix();
    loadPixels();    
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        fgImg.pixels[y * width + x] = pixels[y * width + x];
      }
    }
    updatePixels();
  }
}

// ==========================================================
// 消失処理用の雲模様データの生成
// ==========================================================
private void createCroud() {
  if(croud == null)
    croud = new float[width * height];
  
  float bias   = 150.0;
  float xbase  = random(100);
  float ybase  = random(100);
  
  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc    = 0.02;
  
  bias = min(bias, 0xFF);
  for(int y = 0; y < height; y++) {
    float curBias = y * bias / height;
    for(int x = 0; x < width; x++) {
      float _gray = 
        (noise(xnoise + xbase, ynoise + ybase) * (0xFF - bias) + curBias);
      croud[y * width + x] = _gray;
      xnoise += inc;
    }
    xnoise = 0.0;
    ynoise += inc;
  }
}

// ==========================================================
// パーティクルクラス
// ----------------------------------------------------------
// 位置・色、および更新処理だけを持つ簡単な構造
// ==========================================================
class Particle {
  public int x, y;       // 公開用メンバ
  public int _color;     // colorは予約語なので。

  private float _x, _y;  // 精度向上のための内部計算用
  private float dx, dy;
  
  private int TTL = (int)random(50); // 生存時間
  private int time;                  // 経過時間
  private boolean isLiving;          // 生存フラグ
  
  Particle(int x, int y, int _color) {
    this._x = this.x = x;
    this._y = this.y = y;
    
    // 差分
    this.dx =  0;
    this.dy = -random(0.1, 3);
    time = 0;
    this._color = 0xFF000000 | _color;
    
    isLiving = true;                 // 生存設定
  }
  
  // 更新。
  // パーティクルの生存判定を返す。
  boolean update() {
    if(!isLiving) return false;
    
    x = (int)((_x += dx) + 0.5);
    y = (int)((_y += dy) + 0.5);
    
    float a = (float)(TTL - time) / TTL;
    int r = (int)((_color >> 16 & 0xFF) * a + 0.5);
    int g = (int)((_color >>  8 & 0xFF) * a + 0.5);
    int b = (int)((_color       & 0xFF) * a + 0.5);
    
    _color = 0xFF << 24 | r << 16 | g << 8 | b;
    
    if(x < 0 || x >= width)  isLiving = false;
    if(y < 0 || y >= height) isLiving = false;
    if(time++ >= TTL)        isLiving = false;
    return isLiving;
  }
}

