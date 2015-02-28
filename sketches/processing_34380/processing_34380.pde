
class CoverFlow implements Scene {
  // =============================================================
  // iTunes や iPod の CoverFlow をまねっこしてみた。 
  // -------------------------------------------------------------
  // マウスドラッグで操作できるよ。
  // =============================================================
  private boolean isEnable;
  
  final float MAX_ANGLE = radians(70);  // ジャケットの最大傾斜角
  final float interval  = 350;           // 間隔
  final int   offsetZ   = 200;           // Z方向の移動分
  final float dX = 3;
  float xVec;
  
  Photo[] p;
  CoverFlow() {
    xVec = dX;
    
    isEnable = true;
    p = new Photo[20];
    for(int i = 0; i < p.length; i++) {
      p[i] = new Photo();
      p[i].nX = (i - p.length / 2) * interval;
    }
  }
    
  Scene update() {
    // ちいさな画面
    camera(0, 0, 600, 0, 0, 0, 0, 1, 0);
    renderScene();
    loadPixels();
    for(int i = 0; i < pixels.length; i++) {
      subView.pixels[i] = pixels[i];
    }
    updatePixels();
    subView.resize(width * 3 / 10, height * 3 / 10);
    
    // 大きな画面
    camera(0, -1000 * sin(camAngle), 1000 * cos(camAngle), 0, 0, 0, 0, 1, 0);
    renderScene();
    
    loadPixels();
    for(int i = 0; i < pixels.length; i++) {
      mainView.pixels[i] = pixels[i];
    }
    updatePixels();
    
    pushMatrix();
    camera();
    background(mainView);
    image(subView, 10, 10);
    stroke(0);
    noFill();
    rect(10, 10, subView.width, subView.height);
    
    fill(0);
    textFont(font, 24);
    textAlign(CENTER);
    textMode(SCREEN);
    text("Cover Flow Demo", width / 2, height - 10);
    
    popMatrix();
    
    noStroke();
    subView.resize(width, height);
    
    if(keyPressed && isEnable) {
      return new StateTransitionEffect(this, new DiscFlow());
    }
    

    
    return this;
  }
  void setEnable(boolean isEnable) { 
    this.isEnable = isEnable;
  }
  void renderScene() {
    background(255);
    pushMatrix();
    camera();
    lights();
    popMatrix();
    
    double minX = 9999;
    for(int i = 0; i < p.length; i++) {
      p[i].update();
      if(abs((float)p[i].nX) < abs((float)minX)) {
        minX = p[i].nX;
      }
    }
      
    double offsetX;
    
    
    if(mousePressed && abs(mouseX - pmouseX) > dX) offsetX = xVec = 6.0 * (mouseX - pmouseX);

    else {
      float fx = (float)-minX;
      xVec = xVec < 0 ? -dX : dX;

      if(p[0].nX > 0) {
        xVec = min(fx * 0.1, -dX);
      } else if(p[p.length-1].nX < 0) {
        xVec = max(fx * 0.1, dX);
      }
      offsetX = xVec;
    }
    for(int i = 0; i < p.length; i++) {
      p[i].nX += offsetX;
    }
    
    noLights();
  }
   
  class Photo {
    int width  = 400;
    int height = 300;
     
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
      fill(150);
       
      if(abs((float)x) <= interval + 0.1) {
        x = nX;
        angle = MAX_ANGLE * x / interval;
        z = offsetZ * (interval - abs((float)nX))/interval;
        // 色付け（特に本質ではない）
        if(abs((float)x) < interval - 1) fill(255, 0, 0);
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
      
      scale(this.width, this.height, 2);
      box(1);
      popMatrix();
    }
  }
}

