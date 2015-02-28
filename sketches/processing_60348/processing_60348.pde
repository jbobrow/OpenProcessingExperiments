
class Display implements State {
  private final int   n  = 30;              // 分割数
  private final float dX = (float)width / n;
  
  public State update() {
    
    beginShape(QUAD_STRIP);
    texture(textureImage);
    for(int i = 0; i <= n; ++i) {
      vertex(i * dX, 0,      i * dX, 0);
      vertex(i * dX, height, i * dX, textureImage.height);
    }
    endShape();    
    
    if(mousePressed) return new Prepare();
    
    return this;
  }
}

