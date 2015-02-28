
 float i=1;
  float x=1;
void setup(){
  size(800,600);
  smooth();
  strokeWeight(10);
  background(0);
}

void draw(){
  background(0);
  stroke(255);
  line(x,0,x,600);
 filter(BLUR,1);
  x+=i;
  i=i*1.2;
  if(x>800){x=1;i=1;}
}

