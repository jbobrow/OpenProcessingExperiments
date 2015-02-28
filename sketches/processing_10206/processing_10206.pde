
/**
<pre>
MatrixCA
David Bollinger 05/2010 P1.0.9
A 256-state 2-D cellular automata that vaguely resembles
the "green screen" displays from the movie "The Matrix".

Rules:
For each cell consider its four cell orthogonal neighborhood.
If the sum of the cells above and below is not zero then
update the state of the cell to the sum of its left/right
neighbors modulo the sum of it above/below neighbors.  Otherwise
add the sum of its left/right neighbors to the current state.

Press 1-7 to select ca rule variations
(1 is the default rule as described above)

Press mouse to repopulate randomly.
</pre>
*/

int W = 400; // screen Width (should be evenly divisible by S)
int H = 300; // screen Height (should be evenly divisible by S)
int S = 2; // ca cell Size or Scale in pixels when rendered
int C = W / S; // number of Columns in the ca
int R = H / S; // number of Rows in the ca
int mode=1; // which "variation" is currently active
int [][] curr; // current generation of ca
int [][] prev; // previous generation of ca
color [] palette; // 256 colors

void setup() {
  size(W,H,P2D);
  frameRate(30);
  background(0);
  noStroke();
  textFont(createFont("",12));
  textMode(SCREEN);
  curr = new int[R][C];
  prev = new int[R][C];
  populate();
  palette = new int[256];
  for (int i=0; i<256; i++) {
    int g = (int)(pow(i/256.0,2.2)*255.0);
    palette[i] = color(g/6,g,g/3);
  }
}

void populate() {
  for (int r=0; r<R; r++) {
    for (int c=0; c<C; c++) {
      prev[r][c] = curr[r][c] = (int)random(256);
    }
  }
}

void update() {
  for (int r=0; r<R; r++) {
    for (int c=0; c<C; c++) {
      int state = curr[r][c];
      int lr = prev[r][(c-1+C)%C] + prev[r][(c+1)%C];
      int tb = prev[(r-1+R)%R][c] + prev[(r+1)%R][c];
      // here's the "one-liner" version for mode 0:
      //curr[r][c] = (tb==0) ? (state+lr)&0xff : (lr%tb)&0xff;
      // the first equation above adds new "life" to the ca
      // the second equation gives the "matrix"-y effect
      
      // here's the version that supports the various modes:
      int breed = 0;
      switch(mode) {
        // default rule:
        case 1 : breed = (state+lr)&0xff; break; // quite active
        // other modes to experiment with:
        case 2 : breed = ((state+lr))&0xf; break; // similar to 1 and perhaps even more "matrix"-y, discards high bits, develops slower
        case 3 : breed = (state+1)&0xff; break; // increment, slow development
        case 4 : breed = (state+3)&0xff; break; // bigger increment, faster development
        case 5 : breed = ((state+lr)>>5)&0xff; break; // similar to 1, but discards low bits
        case 6 : breed = (state*2)&0xff; break; // but lots of "wraping" occurs, slow development
        case 7 : breed = (state+255)&0xff; break; // decrement, noisy development
        // et cetera...
      }
      curr[r][c] = (tb==0) ? breed : (lr%tb)&0xff;
    }
  }
}

void render() {
  for (int r=0,y=0; r<R; y+=S,r++) {
    for (int c=0,x=0; c<C; x+=S,c++) {
      fill(palette[curr[r][c]]);
      rect(x,y,S,S);
    }
  }
}

void swap() {
  int [][] temp = curr;
  curr = prev;
  prev = temp;
}

void ui() {
  fill(85,255,42,192);
  text("mode: " + mode, 5, H-5);
}

void draw() {
  update();
  render();
  ui();
  swap();
}

void keyPressed() {
  if ((key>='1') && (key<='7'))
    mode = key - '0';
}

void mousePressed() {
  populate();
}


