
class Beam{
  
  //Attributs
  float bx, by, bspeed, btan;
  
  //Constructeur
  Beam(float bx, float by, float bspeed, float btan){
    this.bx = bx;
    this.by = by;
    this.bspeed = bspeed;
    this.btan = btan;
  }
  
  void draw(){
    fill(0, random(100, 255), 0);
    ellipse(bx, by, 20, 20);
    float posbX = cos(btan);
    float posbY = sin(btan);
    this.bx = this.bx + (3*posbX);
    this.by = this.by + (3*posbY);

  }
  

}

