
class Player {
  // variables
  public float cx; // center X
  public float cy; // center Y
  float lastcy;
  float lastcx;
  public int s; // size
  int speed;
  
  public color small;
  public color med;
  public color large;
  public int curColor;
  
  // constructor
  Player(int x, int y, int h){
    cx = x;
    cy = y;
    s = 8;
    speed = 3;
    lastcy = cy;
    lastcx = cx;
    curColor = small;
  }
  
  // update
  void update(){
    // speed increments
    if(s < 50){
      speed = 3;
      curColor = small;
    } else if(s > 50 && s < 110){
      speed = 2;
      curColor = med;
    } else if(s > 110){
      speed = 1;
      curColor = large;
    }
    // check if player is touching wall
    if(cy - s/2 < 0)
      cy = 0 + s/2;
    if(cy + s/2 > height)
      cy = height - s/2;
    if(cx - s/2 < 0)
      cx = 0 + s/2;
    if(cx + s/2 > width)
      cx = width - s/2;
  }
 
  // display
  void display(){
    rectMode(CENTER);
    noStroke();
    fill(curColor);
    rect(cx, cy, s, s);
  }
  
  void drawShadow(){
    noStroke();
    //noFill();
    fill(hue(curColor), 99, 99, 100);
    rect(lastcx, lastcy, s, s);
  }
  
  // set x, y
  void setXY(int x, int y){
    cx = x;
    cy = y;
  }
 
  // set last x,y
  void setLast(float x, float y){
    lastcx = x;
    lastcy = y;
  }
  
  void assignColor(int sel, int h, int sa, int b){
    if(sel == 1){
      small = color(h, sa, b);
    } else if(sel == 2){
      med = color(h, sa, b);
    } else if(sel == 3){
      large = color(h, sa, b);
    }
  }
  
  
  void growSize(){
    s++;
  }
  
  void resetSize(){
    s = 8;
    speed = 3;
    curColor = small;
  }
  
}

