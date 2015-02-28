
PImage refrection;
PImage blurImage;
double noiseCount;
int    bgColor;
float  angle;

// 灯籠の配列
Tourou[] tourouList;

void setup() {
  size(400, 300, P3D);
  
  bgColor = 0xFF000000;
  refrection = createImage(width, height, RGB);
  blurImage  = createImage(width, height, RGB);
  tourouList = new Tourou[10];
  for(int i = 0; i < tourouList.length; i++) {
    float r     = random(4000.0);
    float theta = random(1000.0) * TWO_PI / 1000.0;
    
    tourouList[i] = new Tourou(loadImage("tex"+i+".png"));
    tourouList[i].angle = random(1000.0) * HALF_PI / 1000.0;
    tourouList[i].x = r * sin(theta);
    tourouList[i].z = r * cos(theta);
  }
  
  fill(255);
  noStroke();
}

void draw() {
  // パフォーマンス向上のため局所変数にロード
  PImage  _refrection = refrection;
  PImage  _blurImage  = blurImage;
  
  background(bgColor);
  lights();
  
  // カメラの設定
  angle += radians(0.1);
  if(mousePressed) angle += radians(mouseX - pmouseX);
  if(angle >= TWO_PI) angle -= TWO_PI;
  if(angle < 0) angle += TWO_PI;
  camera(5000.0*cos(angle), -300, 5000.0*sin(angle), 0, 0, 0, 0, 1, 0);
  

  // 更新およびリフレクションの描画  
  for(Tourou t : tourouList) {
    t.update();
    t.renderRefrection(); 
  }

  // 乱反射エフェクト
  float xnoise = 0.0;
  float ynoise = -(float)(noiseCount+=random(1));
  float xinc   = 0.05;
  float yinc   = 0.3;
  loadPixels();
  _refrection.loadPixels();
  for(int y = 0; y < height; y++) {
    float rate = (float) y / height;
    for(int x = 0; x < width; x++) {
    
      float refNoise = min(0, 0.5-noise(xnoise , ynoise)) * rate;
      xnoise += xinc;
      
      int xoffset = (int)(0.1 * refNoise * (x - 0.5 * width));
      int yoffset = (int)(refNoise * 50);
      int row = min(height - 1, max(0, y + yoffset));
      int col = min(width  - 1, max(0, x + xoffset));
      _refrection.pixels[y * width + x] = pixels[row * width + col];
    }
    xnoise = 0.0;
    ynoise += yinc;
  }
  _refrection.updatePixels();
  updatePixels();
  
  //_refrection.filter(BLUR);
  
  // 水面の反射の描画
  pushMatrix();
  camera();
  background(_refrection);
  popMatrix();
  
  // 灯籠の描画
  for(Tourou t : tourouList) {
    t.render(); 
  }
  
  int step = 5;  // 必ず、widthとheightの最大公約数で指定
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
}

class Tourou {
  public float angle;    // 回転角変位
  private float da;
  
  public float   x, z;   // 並進位置
  private PImage tex;    // テクスチャ
  private PImage ref;    // リフレクション
  private PImage ground; // 地面（リフレクション用）
  private float  w, h;   // レンダリングするパネルの幅と高さ

  Tourou(PImage tex) {
    this.w = 480;

    float scaleFactor = this.w / tex.width;
    this.h = tex.height * scaleFactor;
    
    this.tex = tex;
    this.tex.resize(64, 64);
    
    createRefrectionTexture(this.tex);
    
    this.da = radians(random(-1, 1));
  }
  
  void update() {
    angle += da;
  }
  
  void render() {
    pushMatrix();
    translate(x, 0, z);
    rotateY(angle);
    
    // =====================================================
    // テクスチャマッピング
    // P3D モードでも極力テクスチャが歪まないようにしている。
    // =====================================================
    int   n     = 20; // 分割数
    float dW    = (float)w / n;
    float dTexW = (float)tex.width  / n;
     
    // 4面描画
    for(int j = 0; j < 4; j++) {
      pushMatrix();
      
      rotateY(j * radians(90));
      translate(0, 0, w/2);
      
      beginShape(QUAD_STRIP);
      texture(tex);
      for(int i = 0; i <= n; i++) {
        vertex(-w / 2.0 + i*dW, -h / 2.0, i*dTexW, 0);
        vertex(-w / 2.0 + i*dW,  h / 2.0, i*dTexW, tex.height-1);
      }
      endShape();
      popMatrix();
    }
    
    popMatrix();
  }

  void renderRefrection() {
    pushMatrix();
    translate(x, 0, z);
    rotateY(angle);
    
    // =====================================================
    // テクスチャマッピング
    // P3D モードでも極力テクスチャが歪まないようにしている。
    // =====================================================
    int   n     = 10; // 分割数
    float dW    = (float)w / n;
    float dTexW = (float)ref.width  / n;
    
    beginShape(QUADS);
    texture(ground);
    vertex(-w/2, h/2, -w/2, 0,           0);
    vertex(-w/2, h/2,  w/2, 0,           tex.height-1);
    vertex( w/2, h/2,  w/2, tex.width-1, tex.height-1);
    vertex( w/2, h/2, -w/2, tex.width-1, 0);
    endShape();
    
    for(int j = 0; j < 4; j++) {
      pushMatrix();

      rotateY(j * radians(90));
      translate(0, 0, w/2);
      
      beginShape(QUAD_STRIP);
      texture(ref);
      for(int i = 0; i <= n; i++) {
        vertex(-w / 2.0 + i*dW, h / 2.0, i*dTexW, 0);
        vertex(-w / 2.0 + i*dW, h * 3.0/ 2.0, i*dTexW, ref.height-1);
      }
      endShape();
      popMatrix();
    }
    
    popMatrix();
  }
  

  private void createRefrectionTexture(PImage tex) {
    ref    = createImage(tex.width, tex.height, RGB);
    ground = createImage(tex.width, tex.height, RGB);
    
    float a, ca;   // リフレクションの強さ
    a = ca = 150;  // 初期値
    float dA = - (float)0xFF / tex.height;
    
    for(int iy = 0; iy < ref.height; iy++) {
      for(int ix = 0; ix < ref.width; ix++) {
        if( ca < 0 ) ca = 0;
        int i = iy * ref.width + ix;
        int c = tex.pixels[(tex.height - iy - 1)*tex.width + ix];
           
        int fg = c;
        int fR = (0x00FF0000 & fg) >>> 16;
        int fG = (0x0000FF00 & fg) >>> 8;
        int fB =  0x000000FF & fg;
           
        int bR = (0x00FF0000 & bgColor) >>> 16;
        int bG = (0x0000FF00 & bgColor) >>> 8;
        int bB =  0x000000FF & bgColor;
        
        int rR = (fR * (int)a + bR * (int)(0xFF - a)) >>> 8;
        int rG = (fG * (int)a + bG * (int)(0xFF - a)) >>> 8;
        int rB = (fB * (int)a + bB * (int)(0xFF - a)) >>> 8;
        ground.pixels[i] = 0xFF000000 | (rR << 16) | (rG << 8) | rB;
        
        rR = (fR * (int)ca + bR * (int)(0xFF - ca)) >>> 8;
        rG = (fG * (int)ca + bG * (int)(0xFF - ca)) >>> 8;
        rB = (fB * (int)ca + bB * (int)(0xFF - ca)) >>> 8;   
        ref.pixels[i] = 0xFF000000 | (rR << 16) | (rG << 8) | rB;
      }
      ca += dA;
    }
  }
}

