
//-----------------------------------------------------------------------------
//Donut
//-----------------------------------------------------------------------------
class Donut {
  float x, y;
  float sz;
  float staerke;

  color farbe;
  float var_alpha;
 
  Donut() {
    //println("Donut!");
  }
  
  //-----------------------------------------------------------------------------
  //sets
  //-----------------------------------------------------------------------------
  void setProperties(float x, float y, float sz, color farbe) {
    this.x = x;
    this.y = y;
    this.farbe = farbe;

    //var_alpha = random(255*0.25, 255*0.45);
  }

  void setCoord(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void setSize(float sz) {
    this.sz = sz;
  } 

  void setFarbe(color farbe) {
    this.farbe = farbe;
  }
  
   void setAlpha(float var_alpha) {
    this.var_alpha = var_alpha*255;
  }
 
  //-----------------------------------------------------------------------------
  //create
  //-----------------------------------------------------------------------------
  void create(float staerke) {
    this.staerke = staerke;
    
    noFill();
    strokeWeight(staerke);
    stroke(farbe, var_alpha);
    ellipse(x,y,sz,sz);
    ellipse(x,y,sz/3,sz/3);
    
  }

  void create() {
    noFill();
    stroke(farbe, var_alpha);
    ellipse(x,y,sz,sz);
    ellipse(x,y,sz/3,sz/3);
  }

}



