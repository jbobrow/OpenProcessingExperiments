
/***************************************
Lasfra karim                 
Cette classe construit les  etoiles a partir de carrés (pixels)
 ****************************************/
class Etoile {
  float x, y, z;

  Etoile( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void draw() {
    stroke( z * 15 );
    rect( x, y,2,2 );

    y += z;
    if (y > 400) { 
    
     y = 0;
    }
  }
}


