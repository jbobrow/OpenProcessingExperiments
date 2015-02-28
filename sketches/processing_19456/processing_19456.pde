


void setup(){
  size(250, 250);
  smooth();
}

void draw(){
  background(18,189,30);
  for (int x= 10; x< width; x+=10) {
    float mx=mouseX/10;
    float offsetA = random (-mx, mx);
    float offsetB = random(-mx, mx);
   line(x+offsetA,20,  x - offsetB, 100);
   //line(x+offsetA, 100, X- offsetB, 80);
   line(x+offsetB, 200, x-offsetA, 40);
   line(x+offsetA, 100, x-offsetB, 200);
 }
}




