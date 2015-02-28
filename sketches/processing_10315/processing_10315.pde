
class Branch {
  
  int xStart, xEnd, yStart, yEnd;
  int id;
  int colour;
  boolean active;
  int parent;
  boolean hasKids;

  Branch(int i) {
    id = i;
    xStart = floor(random(110,230));
    yStart = 480;
    parent = -1;
    xEnd = xStart+round(random(-3,3));
    yEnd = yStart-floor(random(1,10));
    colour=255;
    active = true;
  };
  
  Branch(int i, int p) {
    id = i;
    Branch parentBranch = (Branch) tree.get(p);
    xStart = parentBranch.getX();
    yStart = parentBranch.getY();
    parent = p;
       
    xEnd = xStart+round(random(-3,3));
    yEnd = yStart-floor(random(1,10));
    colour=255;
    active = true;
  }
    
  void growBranch() {
    if (active) {
      xEnd += round(random(-4,4));
      yEnd -= floor(random(1,3));
      if (yStart - yEnd > 100) if(random(1,100) > 72.1) active = false;
      if (yEnd < 40 && random(1,100) > 72.1) active = false;
    }
    if (colour >= 2) colour -= round(random(0,2));
  };
  
  void drawBranch() {
    growBranch();
    stroke(colour,255,colour,255-colour);
    line(xStart,yStart,xEnd,yEnd);
  };
  
  //methods that alter field values
  void addXeYe(int x, int y) {
    xEnd += x;
    yEnd += y;
  };
  void putXsYs(int x, int y) {
    xStart  = x;
    yStart = y;
  };
   
  //methods that return field values 
  int getX() { return xEnd; };
  int getY() { return yEnd; };
  int getP() { return parent; };
};

