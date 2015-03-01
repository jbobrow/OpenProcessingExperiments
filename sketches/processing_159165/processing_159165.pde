
final int tilesz = 200;
ArrayList<Tile> tArray;
int hue;
int tileAmountX;
boolean newLine = false;
boolean flipped;
int flipDelay = 60;
final float hueStep = .1;

void setup() {
  size(600,600,P2D);
  smooth(8);
  frameRate(60);
  strokeWeight(1);
  colorMode(HSB,360,255,255);
  tileGen();
}

void tileGen() {
  hue = 130;
  tArray = new ArrayList<Tile>();
  for(int y = tilesz/2; y <= height+tilesz; y+=tilesz) {
    for(int x = 0; x <= width+tilesz/2; x+=tilesz/2) {
      tArray.add(new Tile(x,y,tilesz,hue));
    }
    hue+=5;
  }
}

boolean checkFlip() {
  boolean res = false;
  for(int i = 0; i < tArray.size() && !res; i++) {
    res = tArray.get(i).isFlip();
  }
  return res;
}

void draw() {

  if(frameCount % flipDelay == 0) {
    tArray.get((int)random(0,tArray.size())).setFlip(true);
  }

  background(0,0,210);
  
  flipped = false;
  
  tileAmountX = (int)((width+tilesz/2) / (tilesz/2));
  
  for(int i = 0; i < tArray.size(); i++) {
    
    Tile t = tArray.get(i);
    if(t.isFlip()) t.update();
    
    newLine = i%(tileAmountX+1) == 0;
    
    float x1 = t.getCenterx();
    float y1 = t.getTopy();
    float x2 = t.getLeftx();
    float y2 = t.getLefty();
    float x3 = t.getRightx();
    float y3 = t.getRighty();
    
    stroke(t.getHue(),t.getSat(),t.getBr());
    fill(t.getHue(),t.getSat(),t.getBr());
    
      if(tileAmountX%2!=0 && newLine) flipped=!flipped;
    
    if(flipped) {
      pushMatrix();
      translate(2*x1,2*y1+tilesz);
      rotate(PI);
      
      externals.context.shadowOffsetX = 0;
      externals.context.shadowOffsetY = 0;
      externals.context.shadowBlur = 100;
      externals.context.shadowColor = "rgba(0,0,0,0.3)";
      
      triangle(x1,y1,x2,y2,x3,y3);
      popMatrix();
      flipped=!flipped;
    } else {
      externals.context.shadowOffsetX = 0;
      externals.context.shadowOffsetY = 0;
      externals.context.shadowBlur = 100;
      externals.context.shadowColor = "rgba(0,0,0,0.3)";
      
      triangle(x1,y1,x2,y2,x3,y3);
      flipped=!flipped;
    }
    
    float thisHue = tArray.get(i).getHue();
    float newHue = thisHue < 360-hueStep ? thisHue + hueStep : (thisHue + hueStep) - 360;
    tArray.get(i).setHue(newHue);
  }
}

void keyPressed() {
  if(key == ENTER) {
    save("TriangleTiles.png");
  }
}

public class Tile {
  private float centerx;
  private float centery;
  private float hue;
  private float br;
  private float sat;
  private boolean flip;
  private float tileSize;

  // top point coord
  private float topy;
  // left point coord
  private float leftx;
  private float lefty;
  // right point coord
  private float rightx;
  private float righty;
  
  // backup for flip
  private float leftxorig;
  private float rightxorig;
  private float brorig;

  public Tile(float x, float y, float ts, float h) {
    this.centerx = x;
    this.centery = y;

    this.hue = h;
    this.br = random(50,150);
    this.brorig = this.br;
    this.sat = random(150,220);

    this.flip = false;

    this.tileSize = ts;

    this.topy = this.centery - this.tileSize/2;
    this.leftx = this.centerx - this.tileSize/2;
    this.lefty = this.centery + this.tileSize/2;
    this.rightx = this.centerx + this.tileSize/2;
    this.righty = this.lefty;
    
    this.leftxorig = this.leftx;
    this.rightxorig = this.rightx;
  }

  public void update() {
    if(this.flip && this.rightx > this.centerx - this.tileSize/2) {
      this.rightx-=2;
      this.leftx+=2;
      this.br = this.brorig / (this.tileSize / abs(this.rightx - this.leftx));
    } else {
      this.flip = false;
      this.rightx = this.rightxorig;
      this.leftx = this.leftxorig;
      this.br = this.brorig;
    }
  }

  public float getCenterx() {
    return centerx;
  }

  public float getCentery() {
    return centery;
  }
  
  public float getHue() {
    return this.hue;
  }
  
  public void setHue(float h) {
    this.hue = h;
  }

  public float getBr() {
    return br;
  }
  
  public float getSat() {
    return this.sat;
  }

  public boolean isFlip() {
    return flip;
  }
  
  public void setFlip(boolean flip) {
    this.flip = flip;
  }

  public float getTileSize() {
    return tileSize;
  }

  public float getTopy() {
    return topy;
  }

  public float getLeftx() {
    return leftx;
  }

  public float getLefty() {
    return lefty;
  }

  public float getRightx() {
    return rightx;
  }

  public float getRighty() {
    return righty;
  }

}
