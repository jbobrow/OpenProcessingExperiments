
void setup(){
size (600, 600);
colorMode (HSB);
}
void draw(){
for (int i= 500; i>0; i=i-2) {

  ellipse(300, 300, i, i);
  stroke((1/2)+(mouseX/3),255,255);
}
}

