
Scene scene;

void setup() {
  size(400, 300, P3D);
  scene = new Scene1();
}
void draw() {
  scene = scene.update();
}

// **************************************
// ページめくりエフェクト
// 
// 思い付いてそのまま作ったのでソースがとにかく汚い。
//
// **************************************
class PageFlipEffect implements Scene {
  private final int TIME_REQUIRED = 30;   // 所要時間
  private final int SHADOW_WIDTH  = 20;   // 影の幅（あてにならない）
  private int time;
  private PImage front, back, nextImg;
  private PVector p1, p2, p3, p4;
  private PVector rightTop, rightBottom;
  private Scene next;
  
  PageFlipEffect(Scene next) {
    this.next = next;
    
    time = 0;
    
    front  = createImage(width, height, RGB);
    back   = createImage(width, height, RGB);
    nextImg = createImage(width, height, RGB);
    
    p1 = new PVector();
    p2 = new PVector();
    p3 = new PVector();
    p4 = new PVector();
    
    rightTop = new PVector(width, 0);
    rightBottom = new PVector(width, height);
    next.setEnable(false);
    updateFront();
  }
  
  Scene update() {
    time++; 
    updateNext();
    
    float rate = (float)time / TIME_REQUIRED;
    
    p2.x = width * (1.0 - rate);
    p2.y = height;
    if (rate * (width + height) < height) {
      p3.x = width;
      p3.y = height - rate * (width + height);
      p4 = null;
    } else {
      p3.x = width - (rate * (width + height) - height);
      p3.y = 0;
      p4 = getPointSymmetricAboutRay(p2, p3, rightTop);
    }
    p1 = getPointSymmetricAboutRay(p2, p3, rightBottom);
    
    updateBack();
    
    background(front);
    
    noStroke();
    beginShape();
    texture(back);
    vertex(p1.x, p1.y, rightBottom.x, rightBottom.y);
    vertex(p2.x, p2.y, p2.x, p2.y);
    vertex(p3.x, p3.y, p3.x, p3.y);        
    if(p4 != null) vertex(p4.x, p4.y, rightTop.x, rightTop.y);
    endShape();
    
    beginShape();
    texture(nextImg);
    vertex(p2.x, p2.y, p2.x, p2.y);
    vertex(rightBottom.x, rightBottom.y, rightBottom.x, rightBottom.y);
    if(p4 != null) vertex(rightTop.x, rightTop.y, rightTop.x, rightTop.y);
    vertex(p3.x, p3.y, p3.x, p3.y);        
    endShape();
    
    if (time == TIME_REQUIRED) {
      next.setEnable(true); 
      return next;
    }
    return this;
  }
  
  void setEnable(boolean b) { /* 無視 */ }
  
  void createTexture() {
    for(int i = 0; i < back.pixels.length; i++) {
      back.pixels[i] = color(255, 255, 255);
    }
  }
  
  // 与えられた2点を通る光線に対して対称な点を得る
  private PVector getPointSymmetricAboutRay
      (PVector startPoint, PVector endPoint, PVector q) {
    PVector p = startPoint;
    PVector d = PVector.sub(endPoint, startPoint);
    d.normalize();
    float   t = PVector.dot(d, PVector.sub(q, p));
    
    // 点に最接近する直線上の座標
    PVector _q = PVector.add(p, PVector.mult(d, t));
    return PVector.sub(_q, PVector.sub(q, _q));
  }
  
  private void updateFront() {
    loadPixels();
    for(int i = 0; i < pixels.length; i++) {
      front.pixels[i] = pixels[i];
    }
    updatePixels();
  }
  private void updateNext() {
    next.update();
    loadPixels();
    for(int i = 0; i < pixels.length; i++) {
      nextImg.pixels[i] = pixels[i];
    }
    updatePixels();
  }
  
  private void updateBack() {
    // 影を作る
    int shadowBias = 150;
    background(0xFF);
    for(int i = SHADOW_WIDTH; i >= 0; i--) {
      float sRate = (float)i / SHADOW_WIDTH;
      int c = (int)(sRate * (0xFF - shadowBias) + shadowBias + 0.5);

      if(c > 0xFF) continue;
      stroke(c);
      strokeWeight(1 + i * 8);
      line(p2.x, p2.y, p3.x, p3.y);
    }
    noStroke();
    
    loadPixels();
    int bias = 200;  // バイアス
    
    for(int i = 0; i < front.pixels.length; i++) {
      int shadow = 0x000000FF & pixels[i];
      
      int c = front.pixels[i];
     
      int r = (0x00FF0000 & c) >>> 16;
      int g = (0x0000FF00 & c) >>> 8;
      int b =  0x000000FF & c;
      
      float biasRate = (float)bias / 100;
      
      // 裏うつり
      r *= biasRate;
      g *= biasRate;
      b *= biasRate;
      
      // 影のグラデーション
      if(shadow < r) r = shadow;
      if(shadow < g) g = shadow;
      if(shadow < b) b = shadow;
        
      back.pixels[i] = 0xFF000000 | r << 16 | g << 8 | b;
    }
    updatePixels();
  }
}


// **************************************
// シーンを司るインタフェースクラス
// 
// updateメソッドをオーバーライドして使う
// 戻り値は、次に遷移するシーンオブジェクト
// （遷移しない場合はthisポインタ）
// **************************************
interface Scene {
  Scene update();
  void setEnable(boolean isEnable);  
}

// =======================================================
// デモ用の状態クラス
// =======================================================
class Scene1 implements Scene {
  float h, p, b;     // ヘディング・ピッチ・バンク回転量
  float dh, dp, db;  // 角速度
  int objColor, bgColor;
  boolean isEnable;

  Scene1() {
    // 色の付け方はてきとうです。
    objColor = color(random(100, 200), 
      random(100, 200), 
      random(100, 200));
    bgColor = color( red(objColor) + 55, green(objColor) + 55, blue(objColor) + 55);
    
    // 回転量・並進量を設定
    h = random(0, 360);
    p = random(-90, 90);
    b = random(0, 360);
    dh = random(-1, 1);
    db = random(-1, 1);
    dp = random(-1, 1);
    
    isEnable = true;
  }
  
  Scene update() {
    camera();
    lights();
    
    background(bgColor);
    
    noStroke();
    fill(objColor);
    
    pushMatrix();
    translate(width/2, height/2, -width/2);
    rotateY(radians(h));
    rotateX(radians(p));
    rotateZ(radians(b));
    box(250);
    popMatrix();
    
    h += dh;
    p += dp;
    b += db;
    
    noLights();
        
    if (mousePressed && isEnable) {
      return new PageFlipEffect(new Scene1());
    } else {
      return this;
    }
  }
  
  void setEnable(boolean isEnable) {
    this.isEnable = isEnable;
  }
}

