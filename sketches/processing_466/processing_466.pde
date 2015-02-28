
public class Tube {
  // Global Variables: these variables can be seen throughout the class
  color c;// color
  float a;// tube angle changes based on perlin noise
  float r;// tube length(radius) changes based on perlin noise
  float t;// tube width(thickness) changes based on perlin noise
  float x;// begin line x point
  float y;// begin line y point
  float xCenter;// end line x point
  float yCenter;// end line y point

  // Parameters: parameters assigned to these global variables
  float xoff;// for perlin noise
  float xincrement;// incrementer for perlin noise
  float tubeLengthMax;// max length(radius) of stroke
  float tubeWidthMax;// max width(thickness) of stroke
  float tubeAngleMax;// tube angle change max
  color tubeAccentColor;// tube accent color;
  boolean tubeAccented;// does the tube have ribs
  // Class Constructor: 7 arguments
  Tube (float _xoff, float _xincrement, float _tubeWidthMax, float _tubeLengthMax, float _tubeAngleMax, color _tubeAccentColor, boolean _tubeAccented)
  {   
    xoff = _xoff;
    xincrement = _xincrement;
    tubeWidthMax = _tubeWidthMax;
    tubeLengthMax = _tubeLengthMax;
    tubeAngleMax = _tubeAngleMax;
    tubeAccentColor = _tubeAccentColor;
    tubeAccented = _tubeAccented;
  } 

  // Update Method: controls the creating and drawing of the Tube
  void update()
  {
    // Update Method Variables
    a = noise(xoff)*tubeAngleMax;// tube angle changes based on perlin noise
    r = noise(xoff)*tubeLengthMax;// tube length(radius) changes based on perlin noise
    t = noise(xoff)*tubeWidthMax;// tube width(thickness) changes based on perlin noise

    // Update Method Arguments

    xoff += xincrement;
    x = (cos(radians(a)) * r) + xCenter;
    y = (sin(radians(a)) * r) + yCenter;
    if(mousePressed == true){
      x = mouseX;
      y = mouseY;
    }
    if(inBounds()){
      if(tubeAccented){
        drawTubeAccent(); 
      }
      drawTube(); 
    } 
    else {
      resetTube();
    }
    xCenter = x;
    yCenter = y;
  }

  // inBounds Method: checks to see if tube is in view
  boolean inBounds(){
    if(((x > 0 - tubeWidthMax) && (x < width + tubeWidthMax)) && ((y > 0 - tubeWidthMax) && (y < height + tubeWidthMax))){
      return true;
    } 
    else {
      return false; 
    }
  }

  // drawTube Method: draws the tube
  void drawTube(){
    strokeWeight(t); 
    stroke(c, 240);
    line(x, y, xCenter, yCenter); 
  }

  // drawTubeAccent Method: draws the tube accent(ribbing)
  void drawTubeAccent(){
    strokeWeight(t+2); 
    stroke(tubeAccentColor);
    line(x, y, xCenter, yCenter);
  }

  // resetTube Method: resets tube to center of screen and changes color
  void resetTube(){
    // select a new color and...
    ix = int(random(img.width));
    iy = int(random(img.height));
    c = img.get(ix, iy);
    // restart the line in the center of the screen.
    x = width/2;
    y = height/2;
  }
}


