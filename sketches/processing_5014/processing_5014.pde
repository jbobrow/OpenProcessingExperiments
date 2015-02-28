
void setup() {
  size(400,400);
  background(255,20,147);
  smooth();
}

void draw() {
  //poten
  line(200,200,220,100);
  line(200,200,260,120);
  line(200,200,290,130);  
  line(200,200,180,100);
  //lijf
  fill(0,255,0);
  ellipse(200,200,100,100);
  //hoofd
  fill(0,250,154);
  ellipse(150,200,60,50);
  //oog
  fill(0);
  ellipse(140,210,5,5);
}

