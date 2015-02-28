

void setup(){
  size(400, 400);
  background(0);
  smooth();
}
void draw(){
  frameRate(30);
for (int i=0; i<=400; i++){
  womp(i, i++);
}
for (int i=400; i>=200; i--){
  womp (i, i--);
}
}

void womp (int x, int y){
  float r=random(400);
  float j=random(400);
  float k=random(255);
  float l=random(255);
  noStroke();
  fill(j, r, l, k);
  ellipse(x, y, r, j);
}

