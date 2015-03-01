
/**
 * Recursive Functions. 
 * 
 */

UserClass _myClass;

void setup() {

  size(900, 540);

  frameRate(25);

  background(#000000);
  stroke(#4aed05);
  smooth();

  _myClass = new UserClass();
}

void draw() {
}

void mousePressed() {

  if (!_myClass.classDone) {
    _myClass.doAction();
  }
  else {
    noLoop();
    println("done");
  }
}

void keyPressed() {

  if (!_myClass.classDone) {
    _myClass.doAction();
  }
  else {
    noLoop();
    println("done");
  }
}

class UserClass {

  int depth;
  int unit;

  int xCP, yCP;
  int x0, y0;

  boolean classDone = false;

  UserClass() {                             // we construct our class...

    depth = 0;
    unit  = 128;

    x0    = width/2;
    y0    = height/2 + unit;

    fill(0);
    rect(0, 0, width - 1, height - 1);

    setInstance();
  }

  void doAction() {

    setInstance(); 

    if (depth == 8) {
      classDone = true;   // end recursion, very important...
    }
  }  

  void setInstance() {

    setContext();

    s(depth);
  }

  void setContext() {

    depth++;

    switch (depth) {
    case 1: 
      stroke(#ffffff); 
      break;
    case 2: 
      stroke(#ff0000); 
      break;
    case 3: 
      stroke(#00ff00); 
      break;
    case 4: 
      stroke(#0000ff); 
      break;
    case 5: 
      stroke(#ff00ff); 
      break;
    case 6: 
      stroke(#00ffff); 
      break;
    case 7: 
      stroke(#ffff00); 
      break;
    default: 
      stroke(#ffffff); 
      break;
    }

    x0 = x0 - unit;
    unit = unit/2;
    y0 = y0 + unit;

    xCP = x0;
    yCP = y0;
  }

  void s(int i) {

    a(depth);
    lineRel(xCP+unit, yCP-unit);
    b(depth);
    lineRel(xCP-unit, yCP-unit);
    c(depth);
    lineRel(xCP-unit, yCP+unit);
    d(depth);
    lineRel(xCP+unit, yCP+unit);
  }

  void a(int i) {

    if (i > 0) {

      a(i-1);
      lineRel(xCP+unit, yCP-unit);
      b(i-1);
      lineRel(xCP+2*unit, yCP);
      d(i-1);
      lineRel(xCP+unit, yCP+unit);
      a(i-1);
    }
  }

  void b(int i) {

    if (i > 0) {

      b(i-1);
      lineRel(xCP-unit, yCP-unit);
      c(i-1);
      lineRel(xCP, yCP-2*unit);
      a(i-1);
      lineRel(xCP+unit, yCP-unit);
      b(i-1);
    }
  }

  void c(int i) {

    if (i > 0) {

      c(i-1);
      lineRel(xCP-unit, yCP+unit);
      d(i-1);
      lineRel(xCP-2*unit, yCP);
      b(i-1);
      lineRel(xCP-unit, yCP-unit);
      c(i-1);
    }
  }

  void d(int i) {

    if (i > 0) {

      d(i-1);
      lineRel(xCP+unit, yCP+unit);
      a(i-1);
      lineRel(xCP, yCP+2*unit);
      c(i-1);
      lineRel(xCP-unit, yCP+unit);
      d(i-1);
    }
  }

  void lineRel(int x, int y) {

    line(xCP, yCP, x, y);

    xCP = x;
    yCP = y;
  }
} // end UserClass



