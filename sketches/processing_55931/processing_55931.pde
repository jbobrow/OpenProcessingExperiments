
// フェード処理
class FadeEffect implements Scene {
  private Scene prev;
  private Scene next;
  
  private final double FADE_TIME = 2000.0;
  private double time;
  private int alphaFactor;
  
  FadeEffect(Scene prev, Scene next) {
    this.prev = prev;
    this.next = next;
    this.time = 0;
    this.alphaFactor = 0;
    
    if(prev == null) {
      this.time = FADE_TIME;
      this.alphaFactor = 0xFF;
    }
  }
  
  Scene update() {
    time += 1000.0 / frameRate;
    
    // フェードアウト
    if(time < FADE_TIME) {
      prev.update();
      alphaFactor = round((float)(0xFF * time / FADE_TIME));
    }
    
    // フェードイン
    if(time > FADE_TIME) {
      next.update();
      alphaFactor = round((float)(0xFF * (2 * FADE_TIME - time) / FADE_TIME));
      if(alphaFactor < 1) return next;    
    }
    
    pushMatrix();
    camera();
    
    pushStyle();
    noStroke();
    fill(alphaFactor << 24);
    rect(0, 0, width, height);
    popStyle();
    popMatrix();
    
    return this;
  }
}

