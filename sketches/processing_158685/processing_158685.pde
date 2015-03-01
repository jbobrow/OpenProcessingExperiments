
final int tilesz = 50;
ArrayList<Tile> tArray;
int h;
int tileAmountX;
boolean newLine = false;
boolean flipped;
int flipDelay = 30;

void setup() {
  size(500,500,P2D);
  smooth(8);
  frameRate(60);
  strokeWeight(1);
  colorMode(HSB);
  tileGen();
}

void tileGen() {
  h = (int)random(0,360);
  tArray = new ArrayList<Tile>();
  for(int y = tilesz/2; y <= height+tilesz; y+=tilesz) {
    for(int x = 0; x <= width+tilesz/2; x+=tilesz/2) {
      tArray.add(new Tile(x,y,tilesz));
    }
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
    flipDelay = (int)random(20,50);
  }

  background(h,20,210);
  
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
    
    stroke(h,t.getSat(),t.getBr());
    fill(h,t.getSat(),t.getBr());
    
      if(tileAmountX%2!=0 && newLine) flipped=!flipped;
    
    if(flipped) {
      pushMatrix();
      translate(2*x1,2*y1+tilesz);
      rotate(PI);
      triangle(x1,y1,x2,y2,x3,y3);
      popMatrix();
      flipped=!flipped;
    } else {
      triangle(x1,y1,x2,y2,x3,y3);
      flipped=!flipped;
    }
  }
  if(frameCount % 10 == 0) h = h < 360 ? h+1 : 0;
}
public class Tile {
  private float centerx;
  private float centery;
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

  public Tile(float x, float y, float ts) {
    this.centerx = x;
    this.centery = y;

    this.br = random(5,80);
    this.brorig = this.br;
    this.sat = random(50,100);

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
      this.rightx-=1;
      this.leftx+=1;
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


