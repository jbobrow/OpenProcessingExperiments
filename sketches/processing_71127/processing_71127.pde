
// open the class
class Rects {
  // Variables
  float xPos;
  float yPos;
  float mx;
  float my;
  float r;
  float mouseDist;
  float mouseDistMapped;
  
  // Constructuor
  Rects(float a, float b, float c){
    xPos = a;
    yPos = b;
    r = c;

  }
  
  // Update
  void update(float mx, float my){
    mouseDist = dist(xPos, yPos, mx, my);
    mouseDist = constrain(mouseDist, 0, 200);
    mouseDistMapped = map(mouseDist, 0,200, 2,1);
  }
  
  // Draw
  void display(){
    
    fill(50+200*mouseDistMapped,20+ 100 * mouseDistMapped,250-100 * mouseDistMapped);
    rect(xPos, yPos, r*mouseDistMapped , r/mouseDistMapped ); 
  }

} //close the class

