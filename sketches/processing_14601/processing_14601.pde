
void setup(){
size(200,200);
}
void draw(){
  for (int i = 0; i < 150; i = i+1) {
  for (int j = 0; j < 150; j = j+1) {
    line (j*11,i*11,j*11+i,i*11);
  }
}
}
