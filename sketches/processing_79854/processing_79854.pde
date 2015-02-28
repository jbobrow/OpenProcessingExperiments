
void setup() {
size(200, 200);
background(0);
frameRate(100);
}
int a = 0;
int b=200;
int g=255;
void draw(){
  noStroke();
  fill(0,0,0);
  rect(0,0,200,200);
  strokeWeight(20);
  stroke(g--,255,g--);
  line(a++,0,b--,200);
  line(0,a,200,b);
  line(0,b,200,a);
  line(b,0,a,200);
  if(b<0){
    g=255;
    a=0;
    b=200;
}
}



