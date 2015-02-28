
int MAX_PARTICLE;
Particle[] p;

PGraphics pg;

class Particle{
  boolean live = false;
  PVector pos = new PVector();
  PVector vec = new PVector();
  color col;
  Particle(){
    vec.set(random(5) + 0.1, 0, 0);
  }
  
  void set(float vx, float vy){
    vec.set(vx, vy, 0);
  }
  
  void move(){
    pos.add(vec);
    if(pos.x > width){
      live = false;
    }
    if(pos.y > width){
      live = false;
    }
    
    float r = red(col) * 0.98;
    float g = green(col) * 0.98;
    float b = blue(col) * 0.98;
    col = color(r, g, b);
    if(col == color(0, 0, 0)){
      live = false;
    }
  }
  
  int getIndex(){
    return int(int(pos.y) * width + pos.x);
  }
}

void setup() {
  size(400, 400);
  MAX_PARTICLE = width * height;
  p = new Particle[MAX_PARTICLE];
  for(int i = 0; i < MAX_PARTICLE; i++){
    p[i] = new Particle();
  }
  
  pg = createGraphics(width, height);
  generateParticle();

  frameRate(80);
}

void draw() { 
  if(frameCount % 100 == 0){
    generateParticle();
  }
  background(0);
  
  loadPixels();
  for(int i = 0; i < MAX_PARTICLE; i++){
    if(p[i].live){
      p[i].move();
      if(p[i].live && 0 < p[i].getIndex() &&
      p[i].live && p[i].getIndex() < width * height){
        int index = p[i].getIndex();
        pixels[index] = p[i].col;
      }
    }
  }
  updatePixels();
}

void generateParticle(){
  float textX = random(width / 2);
  float textY = random(height * 1.5);
  
  //  仮想キャンパスに描画
  pg.beginDraw();
  pg.background(0);
  pg.textSize(200);
  pg.text("text", textX, textY);
  pg.endDraw();
  
  //  仮想キャンパスの内容からパーティクルの作成
  pg.loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      if(pg.pixels[y * width + x] != color(0, 0, 0)){
        p[y * width + x].live = true;
        p[y * width + x].col = pg.pixels[y * width + x];
        p[y * width + x].pos.set(x, y, 0);
        p[y * width + x].vec.x = (random(5) + 0.1);
        
        float tvec = y - (textY - 100);
        tvec /= 200.0;
        p[y * width + x].vec.y = tvec; 
      }
    }
  }
}

