
class Aim {

  public int xpos, zpos, minDistance;
  Spriteset sprite;
  zposPlatzhalter zPh ;
  int spriteposa;
  int spriteposb;
  
  Aim(Spritebuffer buf) {
    sprite = new Spriteset(buf);
    xpos = int(random(width));
    zpos = int(random(height));
    minDistance = MIN_DISTANCE;
  } 
  
  Aim(Spritebuffer buf,int x, int z) {
    sprite = new Spriteset(buf);
    this.xpos = x;
    this.zpos = z;
    this.minDistance = MIN_DISTANCE;
  }
   Aim(Spritebuffer buf, int a, int b,int x, int z) {
    sprite = new Spriteset(buf);
    this.xpos = x;
    this.zpos = z;
    this.minDistance = 50;
    this.spriteposa = a;
    this.spriteposb = b;
    zPh = new zposPlatzhalter();
    zPh.myDadAim = this;
    zPh.myDadType = ("Aim");
    zPh.zpos = zpos;
  }  
  
  

  void drawMe() { // den richtigen Sprite zeichnen ;)
    sprite.xpos = xpos;
    sprite.zpos = zpos;
    sprite.drawExact(spriteposa,spriteposb);
  }

}


