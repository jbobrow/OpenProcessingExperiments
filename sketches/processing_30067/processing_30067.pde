
int counter;    // カウンタ
PImage[]  tex;  // テクスチャ配列
PVector[] pos;  // パーティクル位置ベクトル
PVector[] vel;  // パーティクル速度ベクトル

final int   NUM_PARTICLES  = 120;  // パーティクル数
final float ACCELERATION_Y = 0.1;  // 加速度

void setup() {
  size(400, 300);
  tex = new PImage[NUM_PARTICLES];
  pos = new PVector[NUM_PARTICLES];
  vel = new PVector[NUM_PARTICLES];
  counter = 0;
  
  // パーティクルのテクスチャを配列に格納
  colorMode(HSB, NUM_PARTICLES, 100, 100);
  for(int i = 0; i < tex.length; i++) {
    tex[i] = getParticleTexture(color(i, 50, 50));
    pos[i] = new PVector(0, height * 2);
    vel[i] = new PVector();
  }
  background(0);
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  
  // カウンタ更新
  if (++counter >= NUM_PARTICLES) counter = 0;
  
  // ずれ量（初期位置にノイズを加える）
  float noiseAmount = tex[counter].width/4.0;
  
  // 初期位置の設定
  pos[counter].x = width/2 + random(-noiseAmount, noiseAmount);
  pos[counter].y = height * 9/10 + random(-noiseAmount, noiseAmount);
  
  // 初速度の設定
  vel[counter].x =  random(-2, 2);
  vel[counter].y = -random(3, 7);
  
  // パーティクルの更新
  loadPixels();
  for(int i = 0; i < NUM_PARTICLES; i++) {
    if(pos[i].y < height+tex[i].height && pos[i].y > -tex[i].height) {
      // 加算合成を自力で書いた。
      // blend()メソッドを使うよりもたぶん速い
      for(int imgY = 0; imgY < tex[i].height; imgY++) {
        for(int imgX = 0; imgX < tex[i].width; imgX++) {
          int pX = (int)pos[i].x + imgX;
          if(pX < 0 || pX >= width) continue;
          
          int pY = (int)pos[i].y + imgY;
          if(pY < 0 || pY >= height) continue;
          
          int pIndex = pY * width + pX;
          int bg = pixels[pIndex];
          if(bg == 0xFFFFFFFF) continue;
          
          int fg = tex[i].pixels[imgY * tex[i].width + imgX];
          if(fg == 0xFF000000) continue;
          
          int fR = 0x00FF0000 & fg;    
          int fG = 0x0000FF00 & fg;  
          int fB = 0x000000FF & fg;
          
          int bR = 0x00FF0000 & bg;    
          int bG = 0x0000FF00 & bg;  
          int bB = 0x000000FF & bg;
          
          fR = min(fR + bR, 0x00FF0000);
          fG = min(fG + bG, 0x0000FF00);
          fB = min(fB + bB, 0x000000FF);
          
          fg = 0xFF000000 | fR | fG | fB;
          pixels[pIndex] = fg;
        }
      }
    } 
    // 位置・速度更新
    pos[i].x += vel[i].x;
    pos[i].y += vel[i].y;
    vel[i].y += ACCELERATION_Y;
  }
  updatePixels();
}

// ==============================================
// 指定した色のパーティクル用テクスチャを生成する
// 引数 c : パーティクルの色
// ==============================================
PImage getParticleTexture(color c) {
  // 画像サイズとパーティクルの半径
  final int   IMG_SIZE        = 20;
  final float PARTICLE_RADIUS = 0.5f * IMG_SIZE - 2;
  
  // 画像を作成
  PImage img = createImage(IMG_SIZE, IMG_SIZE, RGB);
  img.loadPixels();
  for(int i = (int)PARTICLE_RADIUS; i > 0; i--) {
    // グラデーション作成
    int a = (int)(0xFF*(float)(PARTICLE_RADIUS-i)/PARTICLE_RADIUS);
    int fg = c;
    int fR = (0x00FF0000 & fg) >>> 16;  
    int fG = (0x0000FF00 & fg) >>> 8;
    int fB =  0x000000FF & fg; 
    int rR = (fR * a) >>> 8;
    int rG = (fG * a) >>> 8;
    int rB = (fB * a) >>> 8;
    fg = 0xFF000000 | (rR << 16) | (rG << 8) | rB;
    
    // パーティクル用テクスチャ作成
    for(int y = 0; y < img.height; y++) {
      for(int x = 0; x < img.width; x++) {
        float yDistance = (y-img.height/2.0)*(y-img.height/2.0);
        float xDistance = (x-img.width/2.0)*(x-img.width/2.0);
        if(yDistance + xDistance <= i*i) {
          img.pixels[y * img.width + x] = fg;
        }
      }
    }
  }
  img.updatePixels();
  img.filter(BLUR);
  return img;
}


