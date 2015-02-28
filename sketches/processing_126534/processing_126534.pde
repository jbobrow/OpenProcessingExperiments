
// Studio: Dynamic logo, looking like MIT media lab
// Colored Spot Box objects
ColoredSpotBox O1, O2, O3, O4, O5;
// Global speed
float[] speed;
float speed_x_inc,speed_y_inc;

void setup() {
  size(320,240);
  reset();
}

void reset() {
  // global speed (x,y)
  speed = new float[2];
  speed_x_inc = 1;
  speed_y_inc = 1;
  speed[0] = 0;
  speed[1] = 0;
  //
  O1 = new ColoredSpotBox(50,  70,color(255,64,64,128),    30,30);  
  O2 = new ColoredSpotBox(100, 70,color(64,256,255,128),  200,10);  
  O3 = new ColoredSpotBox(50, 130,color(197,197,64,128),   10,190);
  O4 = new ColoredSpotBox(100,130,color(64,64,255,128),   180,190);
  O5 = new ColoredSpotBox(220,100,color(128,128,128,128), 240,115);
}

void draw() {
  background(255);
  O1.display(); // muestro el objeto
  O2.display(); // muestro el objeto
  O3.display(); // muestro el objeto
  O4.display(); // muestro el objeto
  O5.display(); // muestro el objeto
  // :TODO: al pulsar con raton, llevar una caja a esa posicion
}

// reset if SPC key is pressed
void keyPressed() {
  if (key == BACKSPACE) {
    reset();
  }
  if (key == '0') {
      O5.changeSpeedColoredBoxTo(0,0);
      speed[0] = 0;
      speed[1] = 0;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      speed[1] -= 1;
    } else if (keyCode == DOWN) {
      speed[1] += 1;
    } else if (keyCode == LEFT) {
      speed[0] -= 1;
    } else if (keyCode == RIGHT) {
      speed[0] += 1;
    } 
  }

  O5.changeSpeedColoredBoxTo(speed[0],speed[1]);
}

// defino la clase Caja
class ColoredSpotBox {
  // colored box A
  color a_color, a_color_orig;
  float ax, ay;
  float ah, aw;
  float ax_speed, ay_speed;
  float ax_orig, ay_orig;
  // small Black Box B
  float bx, by, bs;
  float bx_speed, by_speed;
  float bx_orig, by_orig;
  // vertex coordinates
  float vcoord[][];
  
  // constructor
  ColoredSpotBox(float cbx, float cby, color cbc, float bbx, float bby) {
    a_color_orig = color(cbc);
    ax_orig = cbx;
    ay_orig = cby;
    bx_orig = bbx;
    by_orig = bby;
    this.reset();
  }
 
  void reset() {
    a_color = a_color_orig;
    ax = ax_orig;
    ay = ay_orig;
    bx = bx_orig;
    by = by_orig;
    // Sizes
    aw = 54;
    ah = 48;
    ax_speed = 0;
    ay_speed = 0;
    bs = 18;
    bx_speed = 0;
    by_speed = 0;
  }
    
  void display() {
    int i;
    float[][] vcoord = new float[6][2];
    bx += bx_speed;
    by += by_speed;
    ax += ax_speed;
    ay += ay_speed;

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
    if (by > ay && by + bs < ay + ah) {
      // Black box is in between Colored Box (Heigth)
      if (bx < ax) {
        // The Black box is located at left
        vcoord[2][0] = bx;
        vcoord[2][1] = by + bs;
        vcoord[3][0] = ax;
        vcoord[3][1] = ay+ah;
      } else if (bx > ax && bx + bs < ax + aw) {
        // The Black Box is just in the middle
        vcoord[2][0] = bx;
        vcoord[2][1] = by + bs;
        vcoord[3][0] = ax;
        vcoord[3][1] = ay+ah;
      } else {
        // The Black Box is at right
        vcoord[2][0] = ax + aw;
        vcoord[2][1] = ay + ah;
        vcoord[3][0] = bx + bs;
        vcoord[3][1] = by + bs;
      }
    } else if (by + bs < ay + ah) { 
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
    noStroke();
    beginShape();
    fill(a_color);
    for(i=0; i<6; i++) {
      vertex (vcoord[i][0],vcoord[i][1]);
      text(i+1, vcoord[i][0],vcoord[i][1]);
    }
    endShape(CLOSE);
    
    // Black Box
    stroke(0);
    fill(0);
    rect(bx,by,bs,bs);
  }

  // movement methods
  void moveColoredBoxTo(float cbx, float cby) {
    ax = cbx;
    ay = cby;   
  }
  
  void changeSpeedColoredBoxTo(float cbx, float cby) {
    ax_speed = cbx;
    ay_speed = cby;
  }
}

