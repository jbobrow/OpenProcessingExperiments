
float angle=0;
float g=0;
float i;
float radio=0;
void setup(){
  size(500,500);
  frameRate(30);
}
void draw(){
  translate(250,250);
  background(255,255,255);
  line(240,0,-240,0);
  line(0,240,0,-240);
for(i=0;i<=250;i=i+0.3){
  i=i+2*PI;
  radio=0.8*i;
  fill(0,0,500);
  rotate(g);
  ellipse(cos(i)*radio,sin(i)*radio,3,3);
  g += 0.00001;
}
}

