
int gs = 8, imax = 15, jmax = 15;
boolean[][] mat = new boolean[imax][jmax];
void setup(){
  smooth();
  size(gs * (3 * imax - 1), int(gs * sqrt(3) * (2 * jmax - 1)));
  stroke(63, 63, 255);
  for(int i = 0; i < imax; i ++){
     for(int j = 0; j < jmax; j ++){
       mat[i][j] = false;
     }
  }
  drawgrid();
}
void draw(){
}

void drawHex(float x, float y){
  beginShape();
  vertex(x - gs, y - sqrt(3) * gs);
  vertex(x + gs, y - sqrt(3) * gs);
  vertex(x + 2 * gs, y);
  vertex(x + gs, y + sqrt(3) * gs);
  vertex(x - gs, y + sqrt(3) * gs);
  vertex(x - 2 * gs, y);
  endShape(CLOSE);
}
void drawgrid(){
  for(int i = 0; i < imax; i ++){
     for(int j = 0; j < imax; j ++){
       if (mat[i][j]){
         fill(63, 63, 255);
       } else {
         fill(255);
       }
       drawHex(gs * (3 * i + 1) , gs * sqrt(3) * (i % 2 + 2 * j));
     }
  }
}
void mousePressed(){
  int i = (mouseX / gs - 1) / 3;
  int j = int((mouseY / sqrt(3) / gs + (i + 1) % 2 ) / 2);
  float d = dist(mouseX, mouseY, gs * (3 * i + 1) , gs * sqrt(3) * (i % 2 + 2 * j));
  int n = 0;
  if (dist(mouseX, mouseY, gs * (3 * i + 4), gs * sqrt(3) * ((i + 1) % 2 + 2 * j)) < d){
    d = dist(mouseX, mouseY, gs * (3 * i + 4), gs * sqrt(3) * ((i + 1) % 2 + 2 * j));
    n = 1;
  }
  if (dist(mouseX, mouseY, gs * (3 * i + 4), gs * sqrt(3) * ((i + 1) % 2 + 2 * (j + i % 2 * 2 - 1))) < d){
    d = dist(mouseX, mouseY, gs * (3 * i + 4), gs * sqrt(3) * ((i + 1) % 2 + 2 * (j + i % 2 * 2 - 1)));
    n = 2;
  }
  switch (n){
    case 0:
    mat[i][j] = ! mat[i][j];
    break;
    case 1:
    mat[i + 1][j] = ! mat[i + 1][j];
    break;
    case 2:
    mat[i + 1][j + i % 2 * 2 - 1] = ! mat[i + 1][j + i % 2 * 2 - 1];
    break;
  }
  drawgrid();
}

