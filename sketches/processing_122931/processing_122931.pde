
int numDots = 600;

int[]ArrayX = new int[numDots];
int[]ArrayY = new int[numDots];
int[]ArrayX2 = new int[numDots];
int[]ArrayY2 = new int[numDots];

void setup() {
  size (1024, 768);
  for (int i = 0; i < numDots; i++) {
    ArrayX[i] = (int) random(-width, width); // (int) random(0, 10) + i*10;
    ArrayY[i] = (int) random(-height, height); // (int) random(0, 10) + j*10;
    ArrayX2[i] = (int) random(ArrayX[i]+10, ArrayX[i]+50); // (int) random(0, 10) + i*10;
    ArrayY2[i] = (int) random(ArrayY[i]+10, ArrayY[i]+50); // (int) random(0, 10) + j*10;
  }
  noLoop();
  smooth();
}
void draw() {
  background(255);
  
                      
  for (int i = 0; i < numDots; i++) {
    fill(0);
    noStroke(); 
    quad(ArrayX[i]+random(0,10), ArrayY[i]+random(0,10), ArrayX2[i]+random(0,50), ArrayY2[i]+random(0,50),ArrayX[i]-random(0,10), ArrayY[i]-random(0,10), ArrayX2[i]-random(0,50), ArrayY2[i]-random(0,50));

  }
  //save("pattern1.png");
}


