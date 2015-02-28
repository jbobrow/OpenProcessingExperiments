
class cellsystem{
  int States;
  int[] cells;
  int[] newGen;
  int[] rules;
  int gen;
  float Size;
  float RSize;
  color[] colors;
  
  cellsystem() {
    States=4;
    Size=1;
    RSize=1;
    colors=new color[States];
    newColors();
    cells=new int[int((width+Size)/Size)];
    newGen=new int[int((width+Size)/Size)];
    rules=new int[States*States*States];
    restart();
  }
  
  void restart() {
    gen=0;
    States=floor(random(3,5));
    noiseSeed(int(random(500)));
    newColors();
    background(255);
    for (int i=0; i<rules.length; i++) {
      rules[i]=int(random(States));
    }
    for (int i=0; i<cells.length; i++) {
      cells[i]=constrain(int(noise(i/20)*States),0,States-1);
      //cells[i]=0;
    }
  }
  
  void Continue() {
    gen=0;
    background(255);
  }
  
  void newColors() {
    for (int i=0; i<colors.length; i++) {
      colors[i]=color(random(255),random(255),random(255));
    }
  }
  
  void run() {
    if (finished()==false) {
      gen++;
      update();
      render();
    }

  }
  
  void render() {
    for (int i=0; i<cells.length; i++) {
      
      stroke(colors[cells[i]]);
      point(i,gen);
    }
  }
  
  void update() {
    for (int i=1; i<newGen.length-1; i++) {
      int l=cells[i-1];
      int m=cells[i];
      int r=cells[i+1];
      newGen[i]=next(l,m,r);
    }
    cells=(int[]) newGen.clone();
  }
  
  int next(int l, int m, int r) {
    int n=0;
    for (int iL=0; iL<States; iL++) {
      for (int iM=0; iM<States; iM++) {
        for (int iR=0; iR<States; iR++) {
          if (l==iL && m==iM && r==iR) {
            return rules[n];
          } else {
            n++;
          }
        }
      }
    }
    return 0;
  }
  
  boolean finished() {
    if (gen>((height-Size*2)/Size)) {
      return true;
    } else {
      return false;
    }
  }
}

