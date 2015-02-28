
int num=20;
int[] dx = new int [num];
int[] dy = new int [num];
void setup() {
  size (850,220);
  for (int i=0; i< num; i++){
    dx[i] =i * 5;
    dy[i] =12 + (i * 6);
}
}

void draw() {
  background(250,250,250);

  for (int i=0; i < num; i++){
    dx[i] = dx [i] +1;
    if (dx[i] >500) {
      dx[i]= -80;
}
  diagonals(dx[i],dy[i]);
}
}
void diagonals(int x, int y) {
  ellipse(x,y,x+60,y-60);
  ellipse(x-40,y,x+60,y-60);
  ellipse(x+40,y,x+60,y-60);
  ellipse(x+40,y,x+60,y-60);
    fill(10,237,178);
}

