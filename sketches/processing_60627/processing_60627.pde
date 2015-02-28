
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
      fill(6, 3, 0);
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
      fill(6, 3, 0);
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
  


