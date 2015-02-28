
class H{
  float x, y;
  float vx, vy;
  float rad;
  float rada;
  float spd;
  float r;
  float live = 0;
  int cmin, cmax;
  H(){
  }
  
  void create(float _x, float _y, float _r, float _rad, float _rada, float _spd, int _cmin, int _cmax){
    x = _x;
    y = _y;
    r = _r;
    rad = _rad;
    rada = _rada;
    spd = _spd;
    live = _spd * 100;
    cmin = _cmin;
    cmax = _cmax;
  }
  
  void act(){
    x += vx;
    y += vy;
    
    rad += rada;
    rada *= 0.99;
    
    vx = cos(rad) * spd;
    vy = sin(rad) * spd;
    
    spd *= 0.99;
    
    if(x < 0){
      x += width - 1;
    }
    if(x >= width){
      x -= width;
    }
    if(y < 0){
      y += height - 1;
    }
    if(y >= height){
      y -= height;
    }
    
    if(live > 0){
      live -= 1;
    }else{
      live = 0;
    }
  }
}

class P{
  float x, y;
  float vx, vy;
  int h, s;
  int c;
  
  P(float _x, float _y, int _h, int _s){
    x = _x;
    y = _y;
    h = _h;
    s = _s;
    c = color(h, s, 64, 16);
  }
  
  void init(float _x, float _y, float _vx, float _vy){
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
  }
  
  void act(){
    x += vx;
    y += vy;
    
    vx *= 0.995;
    vy *= 0.995;
    
    if(x < 0){
      x += width - 1;
    }
    if(x >= width){
      x -= width;
    }
    if(y < 0){
      y += height - 1;
    }
    if(y >= height){
      y -= height;
    }
  }
  
  void paint(int[] ar){
    if(0 <= x && x < width && 0 <= y && y < height){
      ar[(int)x + (int)y * width] = blendColor(c, ar[(int)x + (int)y * width], ADD);
    }
  }

  void receive(float _x, float _y, float _r, float _vx, float _vy, int _cmin, int _cmax){
    float d = dist(_x, _y, x, y);
    if((d < _r) && (_cmin <= h && h <= _cmax)){
      vx += _vx * (_r - d) / _r * 0.5;
      vy += _vy * (_r - d) / _r * 0.5;
    }
  }
}


static final int MAX = 500 * 500;
P[] p = new P[MAX];

static final int MAX_H = 1;
H[] h = new H[MAX_H];

void setup(){
  colorMode(HSB, 500);
  size(500, 500);
  for(int i = 0; i < sqrt(MAX); i++){
    for(int j = 0; j < sqrt(MAX); j++){
      p[j + (int)(i * sqrt(MAX))] = new P(i * width / sqrt(MAX), j * height / sqrt(MAX), i, j);
    }
  }
  
  for(int i = 0; i < MAX_H; i++){
    h[i] = new H();
  }
}

void draw(){
  background(0);
  loadPixels();

  for(int i = 0; i < MAX_H; i++){
    if(h[i].live > 0){
      for(int j = 0; j < MAX; j++){
        p[j].receive(h[i].x, h[i].y, h[i].r, h[i].vx * 0.1, h[i].vy * 0.1, h[i].cmin, h[i].cmax);
      }
      h[i].act();
    }else{
      if(random(1) > 0.9){
        float _x = random(width);
        float _y = random(height);
        float _r = random(100);
        float _rad = random(TWO_PI);
        float _rada = random(PI / 300.0) - (PI / 150.0);
        float _spd = random(3);
        
        int cmin = 0;
        int cmax = 500;
        /*
        if(random(1) > 0.9){
          cmin = (int)random(500);
          int tmp = (int)random(500);
          cmax = max(cmin, tmp);
          cmin = min(cmin, tmp);
          _r *= 2;
        }
        */
        
        h[i].create(_x, _y, _r, _rad, _rada, _spd, cmin, cmax);
      }
    }
  }

  for(int i = 0; i < MAX; i++){
    p[i].act();
    p[i].paint(pixels);
  }
  
  updatePixels();
  
  //println(frameRate);
}

