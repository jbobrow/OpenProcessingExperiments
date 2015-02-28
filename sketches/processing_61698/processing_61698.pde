
int k=width/2;
int l=height/3;
float r=random(255);
float j=random(400);
void setup(){
  size(400, 400);
  background(0);
}
void draw(){
  frameRate(30);
  for(int i=0; i<400; i=i+15){
  womp(int (random(400)), int (random(400)));

  }
}
void womp (int k, int l){
  noStroke();
  smooth();
  noFill();
  fill(k, l, r, k);
  ellipse(l, l, k, 5);
  k=k*k+k*2+25;
l=l+k+10;
  }


