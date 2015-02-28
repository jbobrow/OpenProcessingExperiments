
class DriftC{
  float x, y, scaleC;
  color c;
  
  DriftC(float _x, float _y, float _scaleC, color _c) {
    x = _x;
    y = _y;
    c = _c;
    scaleC = random((_scaleC-0.05), (_scaleC+0.05));
  }
  
  void drawCloud() {
    drifting();
    render();
  }
  
  void drifting() {
    x ++;
    y += random(-0.5,0.5);
    
    if(x > width + 90) {
      x = 0 - 90;
    }
  }
  
  void render() {
    cloud(x,y,scaleC,c);    
  }
  
  void cloud(float x, float y, float sz, color c) {
  //cloud made by bezier curves 
  //translate(120,145);
  //cloud's width=220, height=120
  pushMatrix();
  pushStyle();
  
  translate(x,y);
  noStroke();
  fill(c);
  scale(sz);
  
  float xA=30, yA=-40;
  bezier(30+xA,20+yA,90+xA,5+yA,110+xA,100+yA,30+xA,75+yA);
  bezier(30+xA,75+yA,50+xA,110+yA,-10+xA,120+yA,-5+xA,80+yA);
  bezier(-5+xA,80+yA,-10+xA,120+yA,-80+xA,110+yA,-60+xA,80+yA);
  bezier(-60+xA,80+yA,-70+xA,110+yA,-100+xA,90+yA,-80+xA,80+yA);
  bezier(-80+xA,80+yA,-140+xA,100+yA,-160+xA,20+yA,-110+xA,30+yA);
  bezier(-110+xA,30+yA,-120+xA,10+yA,-100+xA,0+yA,-90+xA,20+yA);
  bezier(-90+xA,20+yA,-95+xA,0+yA,-60+xA,-30+yA,-40+xA,5+yA);
  bezier(-40+xA,5+yA,-35+xA,-30+yA,60+xA,-10+yA,30+xA,20+yA);
  
  //fill cloud with color
  beginShape();
  vertex(31+xA,19+yA);
  vertex(31+xA,76+yA);
  vertex(-5+xA,81+yA);
  vertex(-60+xA,81+yA);
  vertex(-80+xA,81+yA);
  vertex(-111+xA,29+yA);
  vertex(-91+xA,19+yA);
  vertex(-40+xA,4+yA);
  endShape(CLOSE);
  
  popStyle();
  popMatrix();
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  color getC() {
    return c;
  }
  
  float getS() {
    return scaleC;
  }
}

