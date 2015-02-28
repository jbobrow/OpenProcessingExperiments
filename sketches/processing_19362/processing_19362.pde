
void setup() {
  size(300,300);
  rectMode(CENTER);
  background(255);
  colorMode(RGB,width);
}

//custom function:
void cir(float x, float y,float z) {
  noFill();
  stroke(250,250,x);
  strokeWeight(random(1,3));
  ellipse(x,y,z,z);
  stroke(250,y,250);
  ellipse(x,y,z/2,z/2);
}
int m=0;
void draw() {
  for (int n=0;n<10;n++){
    cir(random(6)*50,random(6)*50,random(5,50));
  }
m++;
if (m>12){
  noLoop();
}
}



