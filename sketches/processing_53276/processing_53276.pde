
class P {

  int x;
  int y;
  int d;
  color myc;
  boolean okToDraw;
  boolean chaste = true;

  P() {
    // random initial conditions
    selfinit();
  }
  
  void selfinit() {
    // position
    okToDraw = false;    
    x = int(random(width));
    y = int(random(height));
    d = 0;
    myc = readBackground(x,y);
  }

  void draw() {
    expand();
    if (okToDraw) {
      stroke(myc);
      strokeWeight(d);
//      stroke(myc);
     // fill(myc);
//      line(x+random(10),y-random(10),x-random(20),y-random(20));
      //line(x,y,x+random(10),y-random(10));//
      ellipse(x,y,d,d);//rect(x,y,d,d);
    }
  }
  
  void expand() {
    // assume expansion is ok
    d+=random(10);
    
    // look for obstructions around perimeter at width d
    int obstructions = 0;
    for (int j=int(x-d/2-1);j<int(x+d/2);j++) {
      int k=int(y-d/2-1);
      obstructions += checkPixel(j,k);
      k=int(y+d/2);
      obstructions += checkPixel(j,k);
    }      
    for (int k=int(y-d/2-1);k<int(y+d/2);k++) {
      int j=int(x-d/2-1);
      obstructions += checkPixel(j,k);
      j=int(x+d/2);
      obstructions += checkPixel(j,k);
    }      
      
    if (obstructions>0) {
      // reset
      selfinit();    
      if (chaste) {
        makeNewP();
        chaste = false;
      }
    } else {
      okToDraw = true;
    }
  }

  int checkPixel(int x, int y) {
    if ((x>dimborder) && (x<dimx-dimborder) || (x==0) || (x==dimx-1)) {
      if ((y>dimborder) && (y<dim-dimborder) || (y==0) || (y==dim-1)) {
        color c = get(x, y);
        if ((red(c)+blue(c)+green(c))>0) {
          // a lit pixel has been found
          return 1;
        } else {
          return 0;
        }
      }
    }
    return 0;
  }
}

