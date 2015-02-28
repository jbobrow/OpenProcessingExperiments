
abstract class Code {
  String sym;
  abstract float eval();
  void connect(Player p) {}
  Vector subNodes() {
    return collect(new Vector());
  }
  Vector collect(Vector all) {
    all.add(this);
    return all;
  }
  abstract Code clone();
  String toString(){return sym;}
  Code splice(Code tar, Code rep) { // inefficient
    return this == tar ? rep.clone() : this;
  }
  Code randomNode() {
    return (Code) random(subNodes());
  }
  abstract int depth();
  abstract int nodesAt(int level);
  void show(float branchLength, int depth) {
    float diam = branchLength * bubbleSize;
    float eval = eval();
    fill(((eval/2)+.5)*255);
    stroke(200);
    strokeWeight(1);
    ellipse(0,0,diam,diam);
    float evalpi = eval * PI;
    strokeWeight(3);
    stroke(250,100,100,100);
    line(0,0,cos(evalpi) * diam/2,sin(evalpi) * diam/2);
    fill(0);
    if(depth < textDepth && !sym.equals("")) text(sym,-6,3);
  }
}

abstract class Terminal extends Code {
  int depth() {return 1;}
  int nodesAt(int level) {return level == 0 ? 1 : 0;}
}

abstract class Variable extends Terminal {
  Player p;
  Variable(String sym) {this.sym = sym;}
  void connect(Player p) {this.p = p;}
}

abstract class Function extends Code {
  Code[] args;
  Function(String sym, Code a) {
    args = new Code[] {a};
    this.sym = sym;
  }
  Function(String sym, Code a, Code b) {
    args = new Code[] {a, b};
    this.sym = sym;
  }
  Function(String sym, Code a, Code b, Code c) {
    args = new Code[] {a, b, c};
    this.sym = sym;
  }
  Function(String sym, Code a, Code b, Code c, Code d) {
    args = new Code[] {a, b, c, d};
    this.sym = sym;
  }
  String toString() {
    String out = "(" + sym;
    for(int i = 0; i < args.length; i++)
      out += " " + args[i];
    return out + ")";
  }
  void connect(Player p) {
    for(int i = 0; i < args.length; i++)
      args[i].connect(p);
  }
  Vector collect(Vector all) {
    for(int i = 0; i < args.length; i++)
      args[i].collect(all);
    return super.collect(all);
  }
  Code splice(Code tar, Code rep) {
    if(this == tar) return rep.clone();
    else {
      for(int i = 0; i < args.length; i++)
        args[i] = args[i].splice(tar, rep);
      return this;
    }
  }
  int depth() {
    int maxdepth = 0;
    for(int i = 0; i < args.length; i++) {
      int curdepth = args[i].depth();
      if(curdepth > maxdepth)
        maxdepth = curdepth;
    }
    return maxdepth + 1;
  }
  int nodesAt(int level) {
    int sum = 0;
    for(int i = 0; i < args.length; i++)
      sum += args[i].nodesAt(level - 1);
    return level == 0 ? 1 : sum;
  }
  void show(float branchLength, int depth) {
    // draw branches first
    if(depth < 30) // pushMatrix() can only be used this many times
      for(int i = 0; i < args.length; i++) {
        pushMatrix();
        float angle = (args.length == 1) ? 0 : (((float) i / (args.length - 1)) - .5) * 2;
        rotate(spread * angle);
        float nextbl = branchLength * branchDropoff;
        float movebl = nextbl * (1 + (argExtend * sq((float) args.length)));
        stroke(100);
        strokeWeight(2);
        line(0,0,movebl,0);
        translate(movebl,0);
        args[i].show(nextbl, depth + 1);
        popMatrix();
      }
    // draw self on top
    super.show(branchLength, depth);
  }
}

