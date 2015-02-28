


void setup() {
  size(700, 700);
  noStroke();
  smooth();
}

void draw() {
  for(int i=0;i<35;i++){
    for(int j=0;j<35;j++){
      fill(50);
      rect(i*20, j*20, 20, 20);
      make(i*20,j*20);
    }
  }
}
void make(int x,int y){
 
  //rect(x+4, y+4, 2, 2);
  for(int i=0;i<3;i++){
    int a = (int)random(1, 5);
    int b = (int)random(1, 5);
    int c = (int)random(1, 5);
    int d = (int)random(1, 5);
    fill(200);
    //fill(20*(a+b+c+d));
    rect(x+4+a+a, y+4+b+b, c, d);
  }
}
