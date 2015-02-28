

class Vamp{
  
  //Vamp's variables
  float x;
  float y;
  float cubeSize;
  int colR;
  int colG; 
  int colB;
  color strokeRGB = color(233, 233, 233);
  color strokeHit = color(66, 66, 66);
  color hitFill = color(235, 6, 87);
  //int strokeR = 146;
  //int strokeG = 148;
  //int strokeB = 151;
  boolean hit = false;

  // perlin noise
  float xt;
  float yt;
  float increment;
  
  //Vamp constructor
  Vamp( float tempCubeSize, int tempColR, int tempColG, int tempColB, float xt_, float yt_, float increment_){
 
    cubeSize = tempCubeSize;
    colR = tempColR;
    colG = tempColG;
    colB = tempColB;
    
    xt = xt_;
    yt = yt_;
    increment = increment_;
  }
  
  //Display Vamp
  void display() {
    
    strokeWeight(cubeSize/40);
    float eyeSize = cubeSize*.375;
    
    //Stroke color
    if (hit) {
      stroke(strokeHit);
    } else {
      stroke(strokeRGB);
    }
    
    //Draw Vamp's body
    rectMode(CENTER);
    if (hit) {
      fill(255);
    } else {
      fill(colR, colG, colB);
    }
   
    rect(x, y, cubeSize, cubeSize);
    
    //Draw Vamp's eye white
    
    if (hit) {
      fill(hitFill);
    } else {
      fill(255);
    }
    
    ellipse( x - eyeSize/2, y + eyeSize/6, eyeSize, eyeSize);
    ellipse( x + eyeSize/2, y + eyeSize/6, eyeSize, eyeSize);
    
    
    //Draw Vamp's eye black
    fill(0);
    ellipse( x - eyeSize/4, y + eyeSize/6, eyeSize/2, eyeSize/2);
    ellipse( x + eyeSize/4, y + eyeSize/6, eyeSize/2, eyeSize/2);
  
    //Draw Vamp's mouth
    if (hit) {
      line(x - eyeSize, y + eyeSize, x + eyeSize, y + eyeSize);
      fill(hitFill);
      triangle(x - (cubeSize-eyeSize)/2, y + eyeSize, x - eyeSize/6, y + eyeSize, x - eyeSize/2, y+cubeSize-eyeSize);
      triangle(x + (cubeSize-eyeSize)/2, y + eyeSize, x + eyeSize/6, y + eyeSize, x + eyeSize/2, y+cubeSize-eyeSize);
    } else {
      line(x - eyeSize/2, y + eyeSize, x + eyeSize/2, y + eyeSize);
    }
    
    //Draw Vamp's hair
    if (hit) {
      fill(hitFill);
    } else {
      fill(colR/5, colG/3, colB/2);
    }

    triangle(x - eyeSize/2, y-cubeSize/2, x + eyeSize/2, y - cubeSize/2, x, y - cubeSize/8);
  }
  
  void moveCritter() {  
    // add noise
    x = width * noise(xt);
    y = height * noise(yt);
    
    // increment timers
    xt += increment;
    yt += increment;
  }
  
  void hitTest(Vamp vamp) {
    
    // get larger distance
    float distance = (cubeSize > vamp.cubeSize ? cubeSize : vamp.cubeSize); 
    // "if expressions" are if statements that return a value
    
    if (dist(x, y, vamp.x, vamp.y) <= cubeSize) {
      vamp.hit = true;
      hit = true;
    } else {
      vamp.hit = false;
      hit = false;
    }
  }
}


