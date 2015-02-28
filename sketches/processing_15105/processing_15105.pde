
void setup() {
  size(200,200);
  background(#ffffff);
}
void draw() {
  for( int x=0; x<200;  x=x+20){
    for( int y=0; y<200;  y=y+20){
      pushMatrix();
      fill(#ffffff);
      translate(x,y);
      ellipse(10,10,10,10);
      popMatrix();
    for( int a=0; a<200;  a=a+20){
    for( int b=0; b<200;  b=b+20){
      pushMatrix();
      fill(#000000);
      translate(a+a,b+b);
      ellipse(10,10,10,10);
      popMatrix();
      pushMatrix();
      translate(a+a+20,b+b+20);
      ellipse(10,10,10,10);
      popMatrix();
    }
  }
}
  }
}
