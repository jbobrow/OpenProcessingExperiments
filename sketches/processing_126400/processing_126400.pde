
// Prototipo del logo mit media lab
// Declaro una caja c de la clase Caja
Caja c1, c2, c3, c4;

void setup() {
  size(320,240);
  background(255);
  c1 = new Caja(40,  70,color(255,64,64),  10,10); // creo el objeto
  c2 = new Caja(100, 70,color(64,256,255),230,10); // creo el objeto
  c3 = new Caja(40, 130,color(197,197,64), 10,210); // creo el objeto
  c4 = new Caja(110,130,color(128,128,128),  160,210); // creo el objeto
}

void draw() {
  c1.display(); // muestro el objeto
  c2.display(); // muestro el objeto
  c3.display(); // muestro el objeto
  c4.display(); // muestro el objeto
  // :TODO: al pulsar con raton, llevar una caja a esa posicion
}

// defino la clase Caja
class Caja {
  // caja color a
  color color_a;
  float ax, ay, ah, aw;
  //caja negra b
  float bx, by, bs;
  float px1, py1;
  // vertex coordinates
  float vcoord[][];
  
  // constructor
  Caja(float cbx, float cby, color cbc, float bbx, float bby) {
    color_a = color(cbc);
    ax = cbx;
    ay = cby;
    aw = 54;
    ah = 48;
    // Supuesto, por debajo 150,100
    bx = bbx;
    by = bby;
    bs = 18;
 }  
    
  void display() {
    int i;
    float[][] vcoord = new float[6][2];
    noStroke();
    fill(color_a,33);
    // Target: The Big Colored Box
    rect(ax,ay,aw,ah,33);

    // 1 - Primer punto, el más alto (y a la izq)
    if (by == ay) {
      // At the same height, choose the one at left
      if (bx < ax) {
        // The black box
        vcoord[0][0] = bx;
        vcoord[0][1] = by;
      } else {
        // The colored box
        vcoord[0][0] = ax;
        vcoord[0][1] = ay;
      }
    } else if (by < ay) { 
      // The black box
      vcoord[0][0] = bx;
      vcoord[0][1] = by;
    } else {
      // The colored box
      vcoord[0][0] = ax;
      vcoord[0][1] = ay;
    }

    // 2 - Segundo vertice, el que este mas a la izq
    if (bx < ax) { 
      // the black box
      vcoord[1][0] = bx;
      if (by < ay) {
        vcoord[1][1] = by + bs;
      } else {
        vcoord[1][1] = by;
      }
    } else {
      vcoord[1][0] = ax;
      if (by < ay) {
        vcoord[1][1] = ay;
      } else {
        vcoord[1][1] = ay + ah;
      }
    }

    // 3 - Third point, the left one on lower height, fourth the next one
    if (by + bs < ay + ah) { 
      vcoord[2][0] = ax;
      vcoord[2][1] = ay + ah;
      vcoord[3][0] = ax+aw;
      vcoord[3][1] = ay+ah;
    } else {
      vcoord[2][0] = bx;
      vcoord[2][1] = by + bs;
      vcoord[3][0] = bx + bs;
      vcoord[3][1] = by + bs;
    }

    // 5 - El que este mas a la dcha
    if (ax+aw > bx+bs) {
      // the colored box
      vcoord[4][0] = ax+aw;
      if (ay > by) {
        vcoord[4][1] = ay;
      } else {
        vcoord[4][1] = ay + ah;
      }
    } else {
      // The black box
      vcoord[4][0] = bx+bs;
      if (ay > by) {
        vcoord[4][1] = by + bs;
      } else {
        vcoord[4][1] = by;
      }
    }

    if (ay > by) {
      vcoord[5][0] = bx+bs;
      vcoord[5][1] = by;
    } else {
      vcoord[5][0] = ax+aw;
      vcoord[5][1] = ay;
    }
      
    // Start drawing the poly
    beginShape();
    for(i=0; i<6; i++) {
      vertex (vcoord[i][0],vcoord[i][1]);
      text(i+1, vcoord[i][0],vcoord[i][1]);

    }
    endShape(CLOSE);
    
    // caja negra
    stroke(0);
    fill(0,0,0,25);
    rect(bx,by,bs,bs);
  }
  
}

