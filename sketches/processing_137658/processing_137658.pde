
//int i = 0;

void setup() {
  background(0,0,255);
 size(1000,500);
 smooth();
 fill(124,92,210);
 //noLoop();
}

void draw() {
  //translate();
 copy();
}

void copy() {
  translate(width/2, height/2);
 // for (int i=0; i<15000; i += ((int) random(10))) {
    
    rotate(PI/64);
    //scale(1.001);
    
    ellipse(50, 50, 100+(int)random(40), 30+(int)random(40));
  //}
}
