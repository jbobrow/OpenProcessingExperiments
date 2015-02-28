
void setup() {
  size (400, 400);
  colorMode(HSB,150);
}

void draw(){ 
  for (int j=25; j<height; j+=175) {
  for (int i=50; i<width; i+=100) {
    float r = random(4);
    if (r>1) {
      figure2(i,j);
    }
    else {
   figure1(i,j);
}
  }
  }
  noLoop();
}

void figure1 (float x,float y){
  pushMatrix();
  translate(x,y);
  rectMode(CENTER);
  rect(-25,0,50,50);
  rect(-25,50,50,50);
  fill(29,203,39);//green figure
  rect(-25,-50,50,50);
  popMatrix();
}

void figure2(float x, float y) {
  pushMatrix();
  translate(x,y);
  fill(255);
  rect(-50,50,50,50);
  popMatrix();
}

