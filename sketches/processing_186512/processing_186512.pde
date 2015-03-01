
float b=0;
void setup() {
  size(800,800);
  colorMode(HSB);
}
void draw() { 
  b=b+0.02;
  float fondo = (127*sin(b))+127;
  background(fondo);
  fill(fondo,255,255);
  rect (225,200,300,300);
  for (int i = 60;i>0;i=i-1) {
 //   println(i);
    ellipse(300, 300, i, i);
    ellipse(450,300,i,i);
    fill((i/2)+(mouseX/3), 255, 255);
    rect (280,400,200,50);
    stroke((i/2)+(mouseX/3), 255, 255);
  }
}

