
/*Cloud
 This class draws clouds.  It has parameters for the 
 x and y location of the clouds, as well as a parameter
 for the size of the clouds. 
 */

class Cloud {

  //Fields
  float cX;
  float cY; 
  float cS;

  //Constructor
  Cloud(float tempcX, float tempcY, float tempcS) {
    cX = tempcX;
    cY = tempcY;
    cS = tempcS;
  }

  void display() {
    smooth();
    noStroke();
    fill(255, 75);
    ellipse(cX, cY, cS, cS/6);
    ellipse(cX+cS/8, cY-cS/16, cS, cS/5);
    ellipse(cX+cS/8, cY+cS/16, cS, cS/5);
  }
}


