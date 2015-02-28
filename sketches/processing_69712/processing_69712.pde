
class Branch {
  int c;
  int x1;
  int x2;
  int y1; 
  int y2;
  int growX; //+/- 10
  int growY; //-1 through - 10
  boolean isOpenEnded;
  boolean isGrowingCurrently;
  int stopGrowingProb;
  int strokeSize;
 
  Branch(int x1a, int y1a, int x2a, int y2a, int growXa, int growYa, int stopGrowingPropa, int stroke, int c1){
    x1 = x1a;
    x2 = x2a;
    y1 = y1a;
    y2 = y2a;
    growX = growXa;
    growY = growYa;
    isOpenEnded = true;
    isGrowingCurrently = true;
    stopGrowingProb = stopGrowingPropa;
    strokeSize = stroke;
    c = c1;
  }
  
  void display() {
    fill(c);
    line(x1, y1, x2, y2); 
  }
  
}

