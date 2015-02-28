

class command{
  int targ;
  PVector X;
  float R;
  boolean A;
  int initType;
  command(PVector target, float area){
    targ = 0;
    X = target;
    R = area;
    A = false;
    initType = 0;
  }
  command(int target, float area, boolean attack){
    targ = target;
    X = new PVector();
    R = area;
    A = attack;
    initType = 1;
  }
}

