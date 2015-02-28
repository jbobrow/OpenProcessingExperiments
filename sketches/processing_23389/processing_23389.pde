
class Particle {
  /* This is the Particle class used in Cool your Boots 
   */
  /* Declare variable for the x coordinate for the particle 
   */
  int xCoord; 
  /* Declare variable for the y coordinate for the particle 
   */
  int yCoord;
  /* Declare variable for the colour of the particle 
   */
  color colour;
  /* Declare variable for the temperature of the particle 
   */
  int temperature;
  /* Declare variable for the size of the particle 
   */
  int dotSize;

  /* Particle constructor 
   */
  Particle(int _xCoord, int _yCoord, color _colour, int _dotSize, int _temperature) {
    xCoord = _xCoord;
    yCoord = _yCoord;
    colour = _colour;
    dotSize = _dotSize;
    temperature = _temperature;
  }

  /* Method to set coordinates 
   */
  public void setCoords(int _xCoord, int _yCoord) {
    xCoord = _xCoord;
    yCoord = _yCoord;
  }

  /* Method to set temperature 
   */
  public void setTemperature(int _temperature) {
    temperature = _temperature;
  }

  /* Method to set particle size 
   */
  public void setDotSize(int _dotSize) {
    dotSize = _dotSize;
  }

  /* Method to set colour 
   */
  public void setColour(color _colour) {
    colour = _colour;
  }

  /* Accessor to get x coordinate of object 
   */
  public int getX() {
    return xCoord;
  }

  /* Accessor to get y coordinate of object 
   */
  public int getY() {
    return yCoord;
  }

  /* Accessor to get temperature of object 
   */
  public int getTemperature() {
    return temperature;
  }

  /* Method to draw particle 
   */
  void draw() {
    fill(colour);
    noStroke();
    ellipse(xCoord, yCoord, dotSize, dotSize);
  }
}


