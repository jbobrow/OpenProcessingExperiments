
void setup() {
  setup2 () ;
  size(600,600);


}

int x;
int y;
int z;
int a;
int b;
void draw() {
background(123456);
  fill(0,0,255);
  a=mouseX;  b=height-50;
  triangle(a,b-80,a-80,b+40,a+80,b+40);
  draw2();
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      b=(b-5);
    }
    if (keyCode == DOWN) {
      b=(b+5);
    }
     if (keyCode == LEFT) {
      a=(a-5); 
     }
     if (keyCode == RIGHT) {
     a=(a+5);
     }
    
  }
}

