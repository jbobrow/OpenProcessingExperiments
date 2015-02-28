
int[] X = {-50,-50,50,50,0,-50};
int[] Y = {-50,50,50,-50,0,-50};

void setup() {
  size(400,400);
}

void draw() {
  for(int i = 0; i < 400; i++) {
    stroke(i/2+40);
    line(0,i,400,i);
  }
  for(int i = 0; i < 400; i+=40) {
    stroke(0);
    line(0,i,400,i);
  }
  for(int i = 0; i < 400; i+=40) {
    stroke(0);
    line(i,0,i,400);
  }
  poly(200,200,0);
  poly(100,100,1.9);
  poly(300,100,2.9);
  poly(300,300,3.9);
  poly(100,300,4.9);
}

void poly(int x,int y,float r){
  pushMatrix();
  translate(x,y);
  rotate(r);
  beginShape();
  for(int i = 0; i < 6; i++){
    vertex(X[i],Y[i]);
  }
  endShape();
  popMatrix();
}



