
class SPH {
  
  // Properties

int sphRAD = 20;
 
 // Constructor
  SPH(int x) {
    this.sphRAD = int(random(5,150));

}

  // Methods
  void drawSPH() {
//    fill(this.sphColor);
    sphere(this.sphRAD);
  }
  
 


}

