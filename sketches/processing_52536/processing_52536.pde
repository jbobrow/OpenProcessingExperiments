
class Tile {
  
  int Xindex;
  int Yindex;
  
  float x, y; // X-coordinate, y-coordinate center of tile
  float tilt; 
  float angle; 

  // Constructor
  Tile(int Xindex, int Yindex) {
    x = Xindex * tileSize + tileSize/2 ;
    y = Yindex * tileSize + tileSize/2; 
    angle = 0;
  }

  void change() {
    tilt += PI/2; 
  }

  void display() {
    noStroke();
    fill(color(234));
    pushMatrix();
    translate(x, y);
    
    rotate(tilt);
  
    triangle(-tileSize/2 , -tileSize/2 , -tileSize/2 , tileSize/2 , tileSize/2 , tileSize/2 ); 
    fill(200);
    popMatrix();
  }
}

