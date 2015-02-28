

float a;

HScrollbar gridSizeSc, gridWaveSize, boxSizeSc;

Button top, left, center, right, bottom;
 

void setup()
{
  // menu
  size(500,500);
 
  colorMode(RGB, 6);
  
  stroke(8);
  
  frameRate(50);
  //Scrollbar
  //Number of blocks in grid
  gridSizeSc = new HScrollbar(120, 20, width-(120)-10, 10, 3*5+1);
  //Amplitude of wave
  gridWaveSize = new HScrollbar(120, 60, width-(120)-10, 10, 3*5+1);
  //Box height
  boxSizeSc =  new HScrollbar(120, 100, width-(120)-10, 10, 3*5+1);
  //Button for center of wave location
  top = new Button(45, 10, false);
  left = new Button(10, 45, false);
  center = new Button(45, 45, true);
  right = new Button(80, 45, false);
  bottom = new Button(45, 80, false);
}



void draw()
{
  //GRIDSIZE
  //determine number of boxes in grid by using gridSizeSc's ratio
  int gridSize = 1+(int) ((gridSizeSc.getRatio())*15); //number of blocks wide and deep
 
  //WAVESIZE
  //determines the size of the wave surrounding starting point
  float waveSize = (float) ((gridWaveSize.getRatio()*1.50));
 
  //BOXSIZE
  //determines max height of waves
  float boxSize = (float) ((boxSizeSc.getRatio()*5));
 
  //buttonStopper, only allows one button to be pressed at a time
  buttonStopper(top, left, center, right, bottom);
 
  /*
  a is decreased by 0.08. It represents the amount of radians the height of our boxes changes, and their speed.
   If we did nothing to a, then none of our shapes will move, so a is a key component in our formulas.
   */
  a -= 0.15;
  /* Screen is cleared and background is set to 6 (white). */
  background(4);
  /*
  These are our loops.
   We loop through gridSize rows for the x axis, and within each row, we loop through gridSize collumns for the z axis
   (x,z) is the ground, while y is verticle)
   */
  for (int x = 0; x < gridSize; x++) {
    for (int z = 0; z < gridSize; z++) {
      /*
    The y variable is set to determine the height of the box.
       We use formula radius * cos(angle) to determine this.
       Since cosine, when graphed, creates a wave, we can use this to have the boxes transition from small to big smoothly.
        
       The radius pretty much stands for our range. cosine alone will return values between -1 and 1, so we multiply this by
       24 to increase this value. The formula will return something in between -24 and 24.
        
       The angle is in radians. An entire loop (circle) is 2pi radians, or roughly 6.283185.
       Distance is used to create the circular effect. It makes the boxes of the same radius around the center similar.
       The distance ranges from 0 to gridSize, so 0.55 * distance will be between 0 and 3.85. This will make the highest and lowest
       box a little more than half a loop's difference. a is added on, (subtracted if you want to be technical, since a is negative), to
       provide some sort of change for each frame. If we don't include '+ a' in the algorithm, the boxes would be still.
       */
      //center button
      int y = int(24*boxSize * cos(waveSize * distance(x - (int)gridSize/2, z - (int)gridSize/2,8,0) + a));
      //top button
      if(top.clicked){
        y = int(24*boxSize * cos(waveSize * distance(x, z, 8, 0) + a));
      }
      //left button
      else if(left.clicked){
        y = int(24*boxSize * cos(waveSize * distance(x, z - gridSize, 0, 7) + a));
      }
      //right button
      else if(right.clicked){
        y = int(24*boxSize * cos(waveSize * distance(x - gridSize, z, 5, 0) + a));
      }
      //bottom button
      else if(bottom.clicked){
        y = int(24*boxSize * cos(waveSize * distance(x - gridSize, z - gridSize, 0, 5) + a));
      }
      //stops the top of the box falling through the bottom
      if(y<-30)
        y=-30;
      /*
    These are 2 coordinate variations for each quadrilateral.
       Since they can be found in 4 different quadrants (+ and - for x, and + and - for z),
       we'll only need 2 coordinates for each quadrilateral (but we'll need to pair them up differently
       for this to work fully).
        
       Multiplying the x and z variables by 17 will space them 17 pixels apart.
       The 8.5 will determine half the width of the box ()
       8.5 is used because it is half of 17. Since 8.5 is added one way, and 8.5 is subtracted the other way, the total
       width of each box is 17. This will eliminate any sort of spacing in between each box.
        
       If you enable noStroke(), then the whole thing will appear as one 3d shape. Try it.
       */
      float xm = x*17 -8.5;
      float xt = x*17 +8.5;
      float zm = z*17 -8.5;
      float zt = z*17 +8.5;
 
      /* We use an integer to define the width and height of the window. This is used to save resources on further calculating */
      int halfw = (int)width/2;
      //raises as gridSize increases, to keep centered
      //lowers as boxSize increases, to keep the scrollbars from overlapping
      //Note that boxSize was not used, the data from scrollbar was used to keep the movement smooth
      int halfh = (int)3*height/5-gridSize*10+(int)(boxSizeSc.getRatio()*40);
 
      /*
    Here is where all the isometric calculating is done.
       We take our 4 coordinates for each quadrilateral, and find their (x,y) coordinates using an isometric formula.
       You'll probably find a similar formula used in some of my other isometric animations. However, I normally use
       these in a function. To avoid using repetitive calculation (for each coordinate of each quadrilateral, which
       would be 3 quads * 4 coords * 3 dimensions = 36 calculations).
        
       Formerly, the isometric formula was ((x - z) * cos(radians(30)) + width/2, (x + z) * sin(radians(30)) - y + height/2).
       however, the cosine and sine are constant, so they could be precalculated. Cosine of 30 degrees returns roughly 0.866, which can round to 1,
       Leaving it out would have little artifacts (unless placed side-by-side to accurate versions, where everything would appear wider in this version)
       Sine of 30 returns 0.5.
        
       We left out subtracting the y value, since this changes for each quadrilateral coordinate. (-40 for the base, and our y variable)
       These are later subtracted in the actual quad().
       */
      int isox1 = int(xm - zm + halfw);
      int isoy1 = int((xm + zm) * 0.3 + halfh);
      int isox2 = int(xm - zt + halfw);
      int isoy2 = int((xm + zt) * 0.1 + halfh);
      int isox3 = int(xt - zt + halfw);
      int isoy3 = int((xt + zt) * 0.4 + halfh);
      int isox4 = int(xt - zm + halfw);
      int isoy4 = int((xt + zm) * 0.4 + halfh);
 
      /* The side quads. 2 and 4 is used for the coloring of each of these quads */
      fill (7);
      quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
      fill (8);
      quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);
 
      /*
    The top quadrilateral.
       y, which ranges between -24 and 24, multiplied by 0.05 ranges between -1.2 and 1.2
       We add 4 to get the values up to between 2.8 and 5.2.
       This is a very fair shade of grays, since it doesn't become one extreme or the other.
       */
      fill(3 + y * 0.010, y*.3, -y*.1);
      quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
    }
  }
  //scrollbar update
  gridSizeSc.update();
  gridWaveSize.update();
  boxSizeSc.update();
  gridSizeSc.display();
  gridWaveSize.display();
  boxSizeSc.display();
  // button update
  top.update();
  left.update();
  center.update();
  right.update();
  bottom.update();
  top.displayButton();
  left.displayButton();
  center.displayButton();
  right.displayButton();
  bottom.displayButton();
}
/* The distance formula */
float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}
 
//My simple button code
class Button
{
  boolean over;
  boolean clicked;
  int xpos;
  int ypos;
  int xSize=30;
  int ySize=30;
 
  Button(int x, int y, boolean pressed)
  {
    xpos=x;
    ypos=y;
    clicked=pressed;
  }
 
  void update() {
    if(mousePressed && over()) {
      clicked = true;
    }
  }
 
  boolean over() {
    if(mouseX > xpos && mouseX < xpos+xSize &&
      mouseY > ypos && mouseY < ypos+ySize) {
      return true;
    }
    else {
      return false;
    }
  }
 
  void displayButton() {
    if(over()) {
      fill(8, 3, 0);
    }
    else if(clicked){
      fill(2,2,2);
    }
    else {
      fill(6, 6, 6);
    }
    rect(xpos, ypos, xSize, ySize);
  }
 
  void click(){
    clicked=true;
  }
 
  void unclick(){
    clicked=false;
  }
}
 
//button stopper. Keeps multiple buttons from being clicked
void buttonStopper(Button one, Button two, Button three, Button four, Button five){
  if(one.over() && mousePressed){
    two.unclick();
    three.unclick();
    four.unclick();
    five.unclick();
  }
  else if(two.over() && mousePressed){
    one.unclick();
    three.unclick();
    four.unclick();
    five.unclick();
  }
  else if(three.over() && mousePressed){
    one.unclick();
    two.unclick();
    four.unclick();
    five.unclick();
  }
  else if(four.over() && mousePressed){
    one.unclick();
    two.unclick();
    three.unclick();
    five.unclick();
  }
  else if(five.over() && mousePressed){
    one.unclick();
    two.unclick();
    three.unclick();
    four.unclick();
  }
}
 
//scollBar class for grid size/number of blocks in grid
class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
 
  HScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = 2;
  }
 
  void update() {
    if(over()) {
      over = true;
    }
    else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }
 
  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }
 
  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    }
    else {
      return false;
    }
  }
 
  void display() {
    line(xpos, ypos+5, swidth+xpos,ypos+5);
    if(over || locked) {
      fill(6, 5, 0);
    }
    else {
      fill(0, 0, 0);
    }
    rect(spos, ypos, sheight, sheight);
  }
 
  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
 
  float getRatio(){
    // Determine the range the bar is from the left.
    //Far left being 0 and far right being 1
    return (spos-120)/swidth;
  }
}   
