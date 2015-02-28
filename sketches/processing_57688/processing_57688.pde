
class P {

  int x;
  int y;
  float d;
  color myc;
  boolean okToDraw;
  boolean chaste = true;

  P() {
    selfinit();
  }
  
  void selfinit() {
    okToDraw = false;    
    x = mouseX;
    y = mouseY;
    d = 0;
    myc = readBackground(x,y);
  }

  void draw() {
    expand();
    if (okToDraw) {
      noStroke();
      fill(myc);
      ellipse(x,y,d,d);
      ellipse(x-10,y-10,d-2,d-2); 
      ellipse(x+5,y-15,d-1,d-1); 
      ellipse(x+15,y+5,d-3,d-3); 
      
  if (d > 10) {
    d = 10;
  }
  
  strokeWeight(10 - d);
  line(pmouseX, pmouseY, mouseX, mouseY);
    }
    
  }
  
  void expand() {
    d+=random(20);
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
    if ((x<dimx) || (x==0) || (x==dimx-1)) {
      if ((y<dim) || (y==0) || (y==dim-1)) {
        color c = get(x, y);
        if ((red(c)+blue(c)+green(c))>0) {
          return 1;
        } else {
          return 0;
        }
      }
    }
    return 0;
  }
}

