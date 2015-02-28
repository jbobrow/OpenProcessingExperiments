
  /*#######################################################################
   Cette classe gère la nourritre que les serpents iront manger
  #########################################################################*/
  
  class Aliment{
    
    //Attributs
    float x, y;
    int dimension;
    color c;
    
    //Constructeurs
    Aliment(float x, float y, int dimension, color c){
      this.x = x;
      this.y = y;
      this.dimension = dimension;
      this.c = c;
    }
    
    void draw(){
      fill(c);
      ellipse(x,y,dimension,dimension);
    }
  }

