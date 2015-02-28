
  int a;
  int b;
  int i;
  int x;
  float c;
  float h;
  float f;
  void setup(){
  size(500,500);
  background(0,0);
  smooth();
}

void draw(){
  c=random(0,180);
  h=random(180,450);
  f=random(0,255);
 smooth();
 strokeWeight(2);
 stroke(f,f,f);
 a += 1;
 b += .5;
 fill(255,a,0,0);
 for (int i = 10; i < 500; i += 80) {
   for (int x = 10; x <= width; x += 80){
 arc(i, x, a, a,radians(c), radians(h));
 if (a >400){
    a=0;
 }
  if (f >255){
    f=0;
 }

 }
}
}


