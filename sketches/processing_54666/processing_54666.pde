
class Bubble {
  color bubCol = color(0, 0, 0);  
  float bubSize = 10; 
  int xPos; 
  int yPos;
  color majColor = color(0, 0, 0);
 int active = 0;  
  
  FCircle obj = new FCircle(0);

  boolean tooWhite = false; 


  Bubble (int _xPos, int _yPos) {   
    xPos = _xPos; 
    yPos = _yPos;
  }


  void changeSize (float _newSize) {
    bubSize = _newSize;
  }

  void changeColor (color _newColor) {
    bubCol = _newColor;
  }




  void drawBubble() {
    chooseColor(); 

    /*------------------------------
     TWO COLOR MODES
     -------------------------------*/
    //Real Color Fill
    fill (bubCol); 

    //Majority Color Fill
    //fill (majColor); 
    //-----------------------------


    noStroke(); 
    ellipse (xPos, yPos, bubSize, bubSize);
  }

  void drawBubbleOL() {
    //chooseColor(); 

    /*------------------------------
     TWO COLOR MODES
     -------------------------------*/
    //Real Color Fill
    noFill(); 

    //Majority Color Fill
    //fill (majColor); 
    //-----------------------------


    strokeWeight(2);
    stroke(150,55); 
    ellipse (xPos, yPos, bubSize, bubSize);
    noStroke(); 
  }


  void chooseColor () {

    int r = (bubCol >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (bubCol >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = bubCol & 0xFF;          // Faster way of getting blue(argb)


    float c = max(r, g, b); 

    if (r == c) {
      majColor = color(135, 22, 32);
    } 

    else if (g == c) {
      majColor = color(1, 116, 57);
    } 

    else if (b == c) {
      majColor = color(13, 82, 131);
    }


  }


  void addBubble() {

//    if (!tooWhite) {
      active = 1;
      float angle = random(90);
      float magnitude = 200;
      obj.setSize(bubSize);
      //obj.attachImage (PIMAGE);
      obj.setFillColor(majColor);
      obj.setNoStroke(); 
      obj.setPosition(xPos, yPos);
      obj.setRotation(angle+PI/2);
      obj.setVelocity(magnitude*cos(angle), magnitude*sin(angle));
      obj.setDensity(1);
      obj.setDamping(1);
      obj.setRestitution(.6);
      world.add(obj);
//    }
  }
  
  void restore () {
      FCircle obj = new FCircle(0);
      active = 0; 
  }
  
  
  
}


