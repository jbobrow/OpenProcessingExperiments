
// Light node

class Foco {
  int id; // Node id
  float xpos; // X coordinate
  float ypos; // Y coordinate
  float diam; // Circle diameter
  color fondo; // Background color
  
  Foco (int id, float x, float y, float r, color c){
    this.id = id;
    xpos = x;
    ypos = y;
    diam = r*2;
    fondo = c;
  }
  
  // Draws the node on screen
  void traza(){
    ellipse(xpos,ypos,diam,diam);
  }

  // This function returns true if the mouse pointer is inside the node
  boolean estaDentro(){
    float disX = xpos - mouseX;
    float disY = ypos - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diam/2 ) {
      return true;
    } else {
      return false;
    }
  }
}

