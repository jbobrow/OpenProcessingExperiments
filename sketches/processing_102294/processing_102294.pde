
int maxnumofclicks = 256;
Position [] click = new Position[maxnumofclicks];
int rotateAngle = 0;
float scaleFactor = 1;

void setup() {
  size(600, 600);
  background(255);
  // Initialize each object of class Position
  for (int Index = 0;Index<click.length;Index++) {
    click[Index] = new Position(0, 0, 0, true);
  }
  frameRate(5); // Change the frame rate to 5 frames/sec
}

void draw() {

  // Scan through each click object
  for (int index = 0;index<maxnumofclicks;index++) {

    // See if the object is being currently used
    if (!click[index].Available()) {

      //println(click[index].XPosition()+" "+click[index].YPosition());
      pushMatrix(); // limit transfrom shape to single shape
      translate(click[index].XPosition(), click[index].YPosition()); // Move to the new origin
      scale(click[index].shape.getScaleFactor()); // Scale 
      rotate(radians(click[index].shape.getRotateAngle())); // Rotate
      //Draw a triangle at the point the click was registered
      stroke(click[index].shape.getShapeColor()); // Change the stroke color
      triangle(0, 0, -20.0, 20, 20, 20); // draw triangle
      //rect(0,0,10,10); // draw square
      //ellipse(10,10,10,10);
      
      popMatrix();

      click[index].shape.incrementRotateAngle(20); // Increment the angle for the shape
      click[index].shape.changeScaleFactor(1.02); // Increment the scale
    }
  }
}

void mousePressed() {

  boolean found = false;
  color borderColor;
  int Red = 0;
  int Green = 0;
  int Blue = 0;

  for (int Index = 0;Index<maxnumofclicks;Index++) {

    if (click[Index].Available()) {

      click[Index].setXPosition(mouseX); // Save the mouse x position 
      click[Index].setYPosition(mouseY); // Save the mouse y position
      click[Index].setAvailable(false); // Set the position availability to false
      found = true; // We found an empty position set found to true
      Red = (int)map((int)dist(mouseX,mouseY,width/2,height/2),5,width/2,50,255);
      borderColor = color(Red,Green,Blue);
      click[Index].shape.setShapeColor(borderColor); // set the shape color
    }
    if (found) break; // Found! get out of the loop
  }
}

class Position {

  private int x;
  private int y;
  private int rotateCount;
  private boolean available;
  
  Shape shape = new Shape(255,0,0,1);

  Position(int xPosition, int yPosition, int rCount,boolean avail) {
    x = xPosition;
    y = yPosition;
    rotateCount = rCount;
    available = avail;
  }

  public int XPosition(){return x;}

  public void setXPosition(int xposition) {x = xposition;}
  
  public int YPosition(){return y;}

  public void setYPosition(int yposition) {y = yposition;}
  
  public int rotateCount(){return rotateCount;}
  
  public void setrotateCount(int rCount) {rotateCount = rCount;}
  
  public void setAvailable(boolean availability) {available = availability;}
  
  public boolean Available() {return available;} 
}

class Shape {

  private color shapeColor;
  private int rotateCount;
  private int rotateAngle;
  private float scaleFactor;


  Shape(color shapeCol, int rCount, int rAngle, float sFactor) {
    shapeColor = shapeCol;
    rotateCount = rCount;
    rotateAngle = rAngle;
    scaleFactor = sFactor;
  }

  public color getShapeColor() {
    return shapeColor;
  }
  public int getRotateCount() {
    return rotateCount;
  }
  public int getRotateAngle() {
    return rotateAngle;
  }
  public float getScaleFactor(){
    return scaleFactor;
  }
  public void setShapeColor(color col) {
    shapeColor = col;
  }
  public void setRotateCount(int rCount) {
    rotateCount = rCount;
  }
  public void setRotateAngle(int rAngle) {
    rotateAngle = rAngle;
  }
  public void setScaleFactor(int sFactor) {
    scaleFactor = sFactor;
  }
  public void incrementRotateAngle(int Angle){
   rotateAngle +=20; 
  }
  public void changeScaleFactor(float scaleChange){
   scaleFactor *= scaleChange; 
  }
}



