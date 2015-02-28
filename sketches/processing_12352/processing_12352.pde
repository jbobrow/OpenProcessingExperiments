
int a, b, c, d, e, f, p, w, w1, w2;
int [][] maze;
int [] mz, path = new int [4];
void setup() {
  size(420,420);
  background(0);
  noStroke();
  frameRate(1800);
  w = 5;
  w1 = w - 1;
  w2 = 2*w - 1;
  f = width/w;
  c = f/2;
  d = c;
  e = f-1;
  maze = new int [f][f];
}
void draw(){
  p = 0;
  // make list of directions maze hasn't filled yet.
  if (c > 0) { if (maze[c-1][d] == 0) {    path[p++] = 1;  }}
  if (d > 0) { if (maze[c][d-1] == 0) {    path[p++] = 2;  }}
  if (c < e) { if (maze[c+1][d] == 0) {    path[p++] = 4;  }}
  if (d < e) { if (maze[c][d+1] == 0) {    path[p++] = 8;  }}
  // select one and go there
  if (p > 0) {
    p = path[floor(random(p))];
    maze[c][d] += p;
    switch(p) {
    case 1:
      maze[--c][d] = 4;
      rect(c*w+1, d*w+1, w2, w1);
      break;
    case 2:
      maze[c][--d] = 8;
      rect(c*w+1, d*w+1, w1, w2);
      break;
    case 4:
      rect(c*w+1, d*w+1, w2, w1);
      maze[++c][d] = 1;
      break;
    case 8:
      rect(c*w+1, d*w+1, w1, w2);
      maze[c][++d] = 2;
      break;
    }
  } else {
    // dead-end so try somewhere else
    p = 0;
    while (p == 0) {
      c = floor(random(f));
      d = floor(random(f));
      p = maze[c][d];
    }
  }
}
 
void mouseClicked() {
  background(0);
  c = f/2;
  d = c;
  for (a=0;a<f;a++) {
    mz = maze[a];
    for (b=0;b<f;b++) {
      mz[b] = 0;
    }
  }
}

