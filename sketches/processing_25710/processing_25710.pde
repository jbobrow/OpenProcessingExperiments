
class Rotater {
  
  float x,y;
  float theta; // angle of rotation
  float speed; // speed of rotation
  float r;     // size of rectangle
  float arclength;//keeps position along curve
  String rye;
  
  Rotater( float tempx, float tempy, float tempSpeed, float tempR, float temparc, String temprye) {
 
    // Angle is always initialized to 0
    theta = 0; 
    speed = tempSpeed;
    r = tempR;
    arclength = temparc;
    rye = temprye;
    x = tempx;
    y = tempy;
  }
  
  void rotation(){
    translate(x, y);
  // We must keep track of our position along the curve
  float arclength = 0;
  currAngle += angleChange;
  if (currAngle > ANGLE_LIMIT || currAngle<0)
  {
    angleChange = -angleChange;
    currAngle += angleChange;
  }
  
if(mousePressed == false){
rotate(radians(currAngle));
}else {
}
  }
  

  void display() {

   // For every box
  for (int i = 0; i < rye.length(); i++){
    // Instead of a constant width, we check the width of each character.
    char currentChar = rye.charAt(i);
    float w = textWidth(currentChar); 
    arclength += w/2;
    float theta = PI + arclength / r; 
    // pushMatrix() and popMatrix() are called inside the class' display() method. 
    // This way, every Rotater object is rendered with its own independent translation and rotation! 
    pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    rotate(theta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    fill(200,0,5,150);
    text(currentChar,0,0);
    
    popMatrix();
    // Move halfway again
    arclength += w/2;
  }
}
}


