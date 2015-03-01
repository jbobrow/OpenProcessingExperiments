
int[][] arr;
int[][] rec;
int a;
int b;
int[][] ids;
int reg;

void setup() {
  size(580, 580);
  a = 20;
  b = 20;
  arr = new int[a][b];
  fillRandom(arr);
  rec = new int[a][b];
  reset(rec, 0);
  ids = new int[a][b];
  reset(ids, 0);
  reg = 1;
}

void fillRandom(int[][] A) {
  for (int i=0; i<a; i++)
    for (int j=0; j<b; j++) {
      A[i][j] = (int)random(4);
    }
}
void reset(int[][] A, int r) {
  for (int i=0; i<a; i++)
    for (int j=0; j<b; j++) {
      A[i][j] = r;
    }
}
void replace(int[][] A, int f, int r) {
  for (int i=0; i<a; i++)
    for (int j=0; j<b; j++) {
      if (A[i][j] == f)
        A[i][j] = r;
    }
}

void draw() {
  for (int i=0; i<a; i++)
    for (int j=0; j<b; j++) {
      int x = 40+ i*25;
      int y = 40+ j*25;

      stroke(0);
      // DRAW BOX
      strokeWeight(1);
      /* if (rec[i][j] == 0)      // BOX FILL COLOR
       fill(255);
       else if (rec[i][j] == 1)
       fill(250,80,80);
       else if (rec[i][j] == 3)
       fill(250,80,80);
       else if (rec[i][j] == 2)
       fill(150,100,80);
       else if (rec[i][j] == 4)
       fill(200,200,80);
       else if (rec[i][j] == 5)
       fill(80,200,80);
       */
      if (ids[i][j] == 0)
        fill(255);
      else {
        int q = ids[i][j];
        int c1 = (q*67)%120;
        int c2 = (q*31+80)%120;
        int c3 = (q*13+107)%120;
        if (rec[i][j] == 1)              // recent path
          fill( c1+60, c2+60, c3+60 );
        else if (rec[i][j] == 2)         // old path
          fill( c1+110, c2+110, c3+110 );
        else if (rec[i][j] == 4)         // recent final
          fill( c1+40, c2+40, c3+40 );
        else if (rec[i][j] == 5)         // old final
          fill( c1+20, c2+20, c3+20 );
      }
      rect(x-10, y-10, 20, 20);

      // DRAW ARROWS
      strokeWeight(2);
      if (arr[i][j] == 0)  // DOWN
      {
        line(x, y-8, x, y+5);
        line(x, y+5, x-5, y);
        line(x, y+5, x+5, y);
      }
      if (arr[i][j] == 1)  // RIGHT
      {
        line(x-8, y, x+5, y);
        line(x+5, y, x, y+5);
        line(x+5, y, x, y-5);
      }
      if (arr[i][j] == 2)  // UP
      {
        line(x, y+8, x, y-5);
        line(x, y-5, x+5, y);
        line(x, y-5, x-5, y);
      }
      if (arr[i][j] == 3)  // LEFT
      {
        line(x+8, y, x-5, y);
        line(x-5, y, x, y-5);
        line(x-5, y, x, y+5);
      }
    }//for

  int mI = (int)((mouseX-30)/25);
  int mJ = (int)((mouseY-30)/25);
  if ( (0 <= mI && mI < a) && (0 <= mJ && mJ < b) ) {
    int x = 40+ mI*25;
    int y = 40+ mJ*25;
    fill(200, 200, 50, 100);
    noStroke();
    rect(x-10, y-10, 20, 20);

    if (mousePressed) {
      replace(rec, 1, 2);
      replace(rec, 4, 5);
      cascade(mI, mJ);
      println();
    }
  }//mouse
}

int cascade(int i, int j) {
  if (i < 0 || i >= a)
    return -1;
  if (j < 0 || j >= b)
    return -1;

  if (rec[i][j] == 4)
    return ids[i][j];
  if (rec[i][j] == 3)
    rec[i][j] = 4;
  if (rec[i][j] == 5) {
    rec[i][j] = 4;
    return ids[i][j];
  }
  if (rec[i][j] == 1)
  {
    rec[i][j] = 3;
    register(i, j);
  }
  if (rec[i][j] == 0 || rec[i][j] == 2)
    rec[i][j] = 1;

  print(arr[i][j] +" ");
  int id=0;
  if (arr[i][j] == 0)  // DOWN
    id = cascade(i, j+1);
  if (arr[i][j] == 1)  // RIGHT
    id = cascade(i+1, j);
  if (arr[i][j] == 2)  // UP
    id = cascade(i, j-1);
  if (arr[i][j] == 3)  // LEFT
    id = cascade(i-1, j);
  
  if (id == -1) {
    rec[i][j] = 4;
    return register(i,j);
  }
  ids[i][j] = id;
  return id;
}//cascade

int register(int i, int j) {
  ids[i][j] = reg;
  reg++;
  return ids[i][j];
}



