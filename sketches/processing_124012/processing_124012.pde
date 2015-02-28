
// size and number of knot squares
int s = 48;
int w = 18;
int h = 18;
Knot[][] grid;

void setup() {
  //size(w*s, h*s); Apparently JavaScript can't handle variables in size()...
  size(864, 864);

    // initialize grid of knots
  grid = new Knot[w][h];
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      grid[i][j] = new Knot();
      grid[i][j].display(s*i, s*j, s);
    }
  }
}

void draw() {
}

void mousePressed() {
  int x, y, i, j;

  x = mouseX;
  y = mouseY;
  i = round(1.*x/s);
  j = round(1.*y/s);
  // if mouse is closer to a horizontal connection
  if (abs(x - i*s) < abs(y - j*s)) {
    //j = y/s; Apparently JavaScript can't handle integer division either...
    j = floor(y/s);
    // out-of-bounds catch
    if (i > 0) {
      // update left knot square
      grid[i-1][j].bump(1);
      grid[i-1][j].display(s*(i-1), s*j, s);
    }
    if (i < w) {
      // update right knot square
      grid[i][j].bump(3);
      grid[i][j].display(s*i, s*j, s);
    }
  }
  // if mouse is closer to a vertical connection
  else {
    //i = x/s;
    i = floor(x/s);
    // out-of-bounds catch
    if (j > 0) {
      // update top knot square
      grid[i][j-1].bump(2);
      grid[i][j-1].display(s*i, s*(j-1), s);
    }
    if (j < h) {
      // update bottom knot square
      grid[i][j].bump(0);
      grid[i][j].display(s*i, s*j, s);
    }
  }
}

class Knot {
  int[] sides = new int[4];

  // initialize knot square with solid boundaries
  Knot() {
    for (int i = 0; i < 4; i++) {
      sides[i] = 0;
    }
  }

  // initialize knot square with specified boundaries
  Knot(int up, int right, int down, int left) {
    sides[0] = up;
    sides[1] = right;
    sides[2] = down;
    sides[3] = left;
  }

  // toggle the type of connector on one side of knot square
  void bump(int side) {
    sides[side] = (sides[side] + 1) % 3;
  }

  // update the visual display of knot square
  void display(int l, int t, int s) {
    // set coordinates of knot square
    pushMatrix();
    translate(l, t);

    // add white square background for visibility
    fill(255);
    stroke(1);
    rect(0, 0, s, s);
    fill(0);
    noStroke();

    // draw blank square (four solid sides)
    if (sides[0] + sides[1] + sides[2] + sides[3] == 0) {
    }
    // draw special case (one straight connection)
    else if (sides[0] + sides[1] + sides[2] + sides[3] == 1) {
      // check which side is a connection and rotate accordingly
      if (sides[1] == 1) {
        translate(s, 0);
        rotate(PI/2);
      }
      else if (sides[2] == 1) {
        translate(s, s);
        rotate(PI);
      }
      else if (sides[3] == 1) {
        translate(0, s);
        rotate(PI*3/2);
      }
      dispOneStraight(s);
    }
    // draw special case (four straight connections)
    else if (sides[0] == 1 && sides[1] == 1 && sides[2] == 1 && sides[3] == 1) {
      for (int i = 0; i < 4; i++) {
        // draw one quarter and rotate
        dispFourStraight(s);
        translate(s, 0);
        rotate(PI/2);
      }
    }
    // draw standard knot square
    else {
      for (int i = 0; i < 4; i++) {
        // draw one quarter and rotate
        dispQuart(i, s);
        translate(s, 0);
        rotate(PI/2);
      }
    }

    // reset coordinates
    popMatrix();
  }

  // draws knot square with one straight connection
  void dispOneStraight(int s) {
    float x = s/3*(1-1/sqrt(2));
    beginShape();
    vertex(x, 0);
    vertex(s/3, 0);
    vertex(s/3, s/3);
    vertex(s/2, s/2);
    vertex(s*2/3, s/3);
    vertex(s*2/3, 0);
    vertex(s-x, 0);
    vertex(s-x, s/2);
    vertex(s/2, s*5/6);
    vertex(x, s/2);
    endShape(CLOSE);
  }

  // draws one fourth of knot square with four straight connections
  void dispFourStraight(int s) {
    float x = s/3*(1-1/sqrt(2));
    float y = s/15;
    beginShape();
    vertex(s/3+y, x);
    vertex(s, x);
    vertex(s, s/3);
    vertex(s/3+y, s/3);
    endShape(CLOSE);
    beginShape();
    vertex(s*2/3, 0);
    vertex(s-x, 0);
    vertex(s-x, x-y);
    vertex(s*2/3, x-y);
    endShape(CLOSE);
  }

  // draws one fourth of knot square
  void dispQuart(int quart, int s) {
    float x = s/3*(1-1/sqrt(2));
    float y = s/(15*sqrt(2));

    // draws upper and upper-right ninths of the knot square
    // secondary side is clockwise from primary side

    // primary side is a solid boundary
    if (sides[quart] == 0) {
      // secondary side is a solid boundary
      if (sides[(quart+1)%4] ==0) {
        beginShape();
        vertex(s/3, x);
        vertex(s-x, x);
        vertex(s-x, s/3);
        vertex(s/3, s/3);
        endShape(CLOSE);
      }
      // secondary side is a straight connection
      else if (sides[(quart+1)%4] == 1) {
        beginShape();
        vertex(s/3, x);
        vertex(s, x);
        vertex(s, s/3);
        vertex(s/3, s/3);
        endShape(CLOSE);
      } 
      // secondary side is a crossed connection
      else {
        beginShape();
        vertex(s/3, x);
        vertex(s*2/3+x, x);
        vertex(s, s/3);
        vertex(s/3, s/3);
        endShape(CLOSE);
      }
    } 

    // primary side is a stright connection
    else if (sides[quart] == 1) {
      // secondary side is a solid boundary
      if (sides[(quart+1)%4] == 0) {
        beginShape();
        vertex(s*2/3, 0);
        vertex(s-x, 0);
        vertex(s-x, s/3);
        vertex(s*2/3, s/3);
        endShape(CLOSE);
      } 
      // secondary side is a straight connection
      else if (sides[(quart+1)%4] == 1) {
        beginShape();
        vertex(s*2/3, 0);
        vertex(s-x, 0);
        vertex(s-x, x);
        vertex(s, x);
        vertex(s, s/3);
        vertex(s*2/3, s/3);
        endShape(CLOSE);
      } 
      // secondary side is a crossed connection
      else {
        beginShape();
        vertex(s*2/3, 0);
        vertex(s-x, 0);
        vertex(s-x, s/3-x);
        vertex(s, s/3);
        vertex(s*2/3, s/3);
        endShape(CLOSE);
      }
    }

    // primary side is a crossed connection
    else {
      beginShape();
      vertex(s/3, 0);
      vertex(s*2/3, 0);
      vertex(s/3, s/3);
      endShape(CLOSE);
      // secondary side is a solid boundary
      if (sides[(quart+1)%4] == 0) {
        beginShape();
        vertex(s*2/3+y, y);
        vertex(s-x, s/3-x);
        vertex(s-x, s/3);
        vertex(s*2/3, s/3);
        vertex(s/2+y, s/6+y);
        endShape(CLOSE);
      }
      // secondary side is a straight connection
      else if (sides[(quart+1)%4] == 1) {
        beginShape();
        vertex(s*2/3+y, y);
        vertex(s*2/3+x, x);
        vertex(s, x);
        vertex(s, s/3);
        vertex(s*2/3, s/3);
        vertex(s/2+y, s/6+y);
        endShape(CLOSE);
      }
      // secondary side is a crossed connection
      else {
        beginShape();
        vertex(s*2/3+y, y);
        vertex(s, s/3);
        vertex(s*2/3, s/3);
        vertex(s/2+y, s/6+y);
        endShape(CLOSE);
      }
    }
  }
}



