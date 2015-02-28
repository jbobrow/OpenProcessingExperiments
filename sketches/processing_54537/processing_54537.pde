
// a 2-dimensional array
boolean state[][] = new boolean[8][8];

void setup() {
  size(300, 300);
  //state[0][0] = true;
  //state[6][3] = true;
  for (int i=0; i < 8; i++) {
    for (int j=0; j < 8; j++) {
       if ( random(1) > 0.5 ) state[i][j] = true;
    }
  }
}

void draw() {
  for (int i=0; i < 8; i++) {
    for (int j=0; j < 8; j++) {
      if (state[i][j] == true) fill(255);
      else fill(0);
      float w = width/8.0;
      float x = i*w;
      float y = j*w;
      rect(x, y, w, w);
    }  
  }
}
