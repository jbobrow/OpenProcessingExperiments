
final int MAX_PARTICLE = 30;
PVector[] p = new PVector[MAX_PARTICLE];
PVector[] v = new PVector[MAX_PARTICLE];
float[] s = new float[MAX_PARTICLE];
boolean[] l = new boolean[MAX_PARTICLE];
PVector[] c= new PVector[MAX_PARTICLE];


void setup(){
  size(400, 400);
  fill(0, 8);
  noStroke();
  
  for(int i = 0; i < MAX_PARTICLE; i++){
    p[i] = new PVector();
    v[i] = new PVector();
    l[i] = false;
    s[i] = 0;
    c[i] = new PVector();
  }
}

void draw(){
  loadPixels();
  
  for(int i = 0; i < MAX_PARTICLE; i++){
    if(l[i]){
      p[i].add(v[i]);
      int minX = (int)max(0, p[i].x - s[i] / 2);
      int maxX = (int)min(width, p[i].x + s[i] / 2);
      int minY = (int)max(0, p[i].y - s[i] / 2);
      int maxY = (int)min(height, p[i].y + s[i] / 2);
      for(int x = minX; x < maxX; x++){
        for(int y = minY; y < maxY; y++){
          float sx = x - p[i].x;
          float sy = y - p[i].y;
          float rr = sqrt(sx * sx + sy * sy);
          int r = (int)red(pixels[y * width + x]);
          int g = (int)green(pixels[y * width + x]);
          int b = (int)blue(pixels[y * width + x]);
          
          r += max(0, s[i] / 2 - rr) * c[i].x;
          g += max(0, s[i] / 2 - rr) * c[i].y;
          b += max(0, s[i] / 2 - rr) * c[i].z;
          
          if(r > 255){r = 255;}
          if(g > 255){g = 255;}
          if(b > 255){b = 255;}
          
          pixels[y * width + x] = color(r, g, b);
        }
      }
      s[i] -= 0.5;
      if(s[i] <= 0){
        l[i] = false;
      }
    }
  }
  updatePixels();
  
  for(int i = 0; i < MAX_PARTICLE; i++){
    if(!l[i]){
      setP(i, random(width), height + 50, random(4) - 2, -random(5) - 0.1, random(100));
    }
  }
  
  rect(0, 0, width, height);
}

void setP(int i, float x, float y, float vx, float vy, float size){
  p[i].x = x;
  p[i].y = y;
  v[i].x = vx;
  v[i].y = vy;
  s[i] = size;
  l[i] = true;
  c[i].set(random(1), random(1), random(1));
}

