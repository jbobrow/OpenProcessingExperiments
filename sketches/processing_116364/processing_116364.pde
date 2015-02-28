
//int x = 160;
//int y = 50;
float a, b;
float z;
int xs = 2;
int ys = 2;
int count;
float[] num = new float [0];
float[] num2 = new float [0];
boolean doclean = true;


void setup() {

  size(300, 300);
}

float rannum() {
  float x = random(0, 300);
  return x;
} 


void draw() {
  background(0, 0, 0);
  text("press s for 7 sec then press b to see the flash!", 2, 50);

  if (keyPressed) {
    if ( key == 'b' || key == 'B') {
      bgchange();
    }
    if ( key == 's' || key == 'S') {
      num = append(num, rannum());
      num2 = append(num2, rannum());
      count = count +1;
      doclean = false;
    }
  }
if (doclean)
  clean();
  
  for (int i =0; i<count;i++) {
    drawrect(num[i], num2[i] );
  }
} 




void drawrect(float x, float y) {
  noStroke();
  float  g = random(0, 255);
  fill(g,x ,y );
  rect(x, y, x-100, y-100);


}
void bgchange(){
  background(random(0,255),random(0,255),random(0,255));
}
void clean() {
  a = random(0, 300);
  b = random(0, 300);
  
  for (int i= 0; i < 1000; i++) {
    rect(a, b, b, b);
    fill(a, 100, b);
    a = a + xs*i;
    b = b + ys*i;
  }
}


