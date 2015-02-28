
// =============================================================
// iTunes や iPod の CoverFlow をまねっこしてみた。
// -------------------------------------------------------------
// マウスドラッグで操作できるよ。
// =============================================================
 
final float MAX_ANGLE = radians(50);  // ジャケットの最大傾斜角
final float interval = 430;           // 間隔
final int   offsetZ   = 400;           // Z方向の移動分
 
Photo[] p;
void setup() {
  size(400, 225, P3D);
  p = new Photo[20];
  for(int i = 0; i < p.length; i++) {
    p[i] = new Photo();
    p[i].nX = (i - p.length / 2) * interval;
  }
}
 
void draw() {
  lights();
  camera(0, -700, 1300, 0, 0, 0, 0, 1, 0);
  background(0);
   
  double minX = 9999;
  for(int i = 0; i < p.length; i++) { 
    p[i].update();
    if(abs((float)p[i].nX) < abs((float)minX)) {
      minX = p[i].nX;
    }
  }
   
  double offsetX;
  if(mousePressed) offsetX = 6*(mouseX - pmouseX);
  else offsetX = -minX * 0.1;
  for(int i = 0; i < p.length; i++) { 
    p[i].nX += offsetX;
  }
}

class Photo {
  int width  = 480;
  int height = 480;
  
  double x;
  double z;
  private double angle;
   
  double nX;
  private double rate = 2.0;
  
  void update() {
    z = 0;
    angle = MAX_ANGLE;
    if(nX < 0) angle = -angle;
    noStroke();
    fill(255, 100);
    
    if(abs((float)x) <= interval + 0.1) {
      x = nX;
      angle = MAX_ANGLE * x / interval;
      z = offsetZ * (interval - abs((float)nX))/interval;
      // 色付け（特に本質ではない）
      if(abs((float)x) < interval - 1) fill(255, 0, 0, 200);
    } else {
      x = nX;
      double offset = interval;
      if(nX < 0) offset = -offset;
      x -= offset;
      x /= rate;
      x += offset;
    }
    
    pushMatrix();
    translate((float)x, 0, (float)z);
    rotateY(-(float)angle);
    rect(-this.width/2, -this.height/2, this.width, this.height);
    popMatrix();
  }
}

