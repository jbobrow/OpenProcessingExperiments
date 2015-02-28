
class Particle {
  private float x = 10, y = 10, vX = 10, vY = 10;
  private float pWidth = 10, pHeight = 10;
  private float factor = 0.98;
  private float gravity = 0.2;
  private float wind = 0.0;
  private int R, G, B, T;
  private float tO = millis();
  private boolean ifDelate = false;
  
  Particle() {
  }

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Particle(float x, float y, float vX, float vY) {
    this.x = x;
    this.y = y;
    this.vX = vX;
    this.vY = vY;
  }

  Particle(float x, float y, float vX, float vY, float factor) {
    this.x = x;
    this.y = y;
    this.vX = vX;
    this.vY = vY;
  }
  
  public void setFactor(float factor) {
    this.factor = factor;
  }
  
  public void setWind(float wind) {
    this.wind = wind;
  }
  
  public void setPos(float x, float y){
    this.x = y;
    this.y = y;
  }
  
  public void setSize(float pWidth, float pHeight){
    this.pWidth = pWidth;
    this.pHeight = pHeight;
  }
  
  public void setRandomSize(){
    pWidth = random(5)+3;
    pHeight = random(5)+3;
  }
 
  public void setGravity(float gravity) {
    this.gravity = gravity;
  }
 
  public void setColor(int R, int G, int B, int T) {
    this.R = R;
    this.G = G;
    this.B = B;
    this.T = T;
  }
  
  public void setColor(float R, float G, float B, float T) {
    this.R = (int)R;
    this.G = (int)G;
    this.B = (int)B;
    this.T = (int)T;
  }
  
  public void setRandomColor() {
    float randomNumber = random(1,5);
    int randomColor;
    
    if(randomNumber < 3)
    {
      randomColor = (int)random(255);
      setColor(255,255-randomColor,255-randomColor,255);
    } else {
        if(randomNumber < 4) {
          randomColor = (int)random(50);
          setColor(255-randomColor,255-randomColor,50,255);
        } else {
          randomColor = (int)random(50);
          setColor(randomColor,randomColor,randomColor,255);
        }
    }
  }
  
  public void draw() {
    fill(R,G,B, T);
    ellipse(x, y, pWidth, pHeight);
  }
  
  public void update(){
    updatePos();
    updateColor();
    updateSize();
  }
  
  public void updatePos() {
    x += vX;
    y += vY;
    vX *= factor;
    vY *= factor;
    vY += gravity;
    vX += wind;
  }
  
  public void updatePosArc() {
    x += vX;
    y += vY;
    vX *= cos(factor)*0.97;
    vY *= sin(factor)*0.97;
    vY += gravity;
  }
  
  public void updateColor() {
    float diff = (tO - millis()) / 2000;
    T += diff;
  }
  
  public void updateSize() {
    if(pHeight > 0 && pWidth > 0) {
      float diff = (tO - millis()) / 8000;
      pHeight += diff;
      pWidth += diff;
    } else {
      setSize(0,0);
      setDelate(true);
    }
  }
  
  public void setDelate(Boolean ifDelate) {
    this.ifDelate = ifDelate;
  }
  
  public boolean getDelate() {
    return this.ifDelate;
  }
}

