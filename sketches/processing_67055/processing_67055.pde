
/*
  Arrays - Ultra Intro
  
  With just one array
  
*/
int number = 10;
int spacing = 30;

float[] circleY = new float[number];
float[] vels = new float[number];
float[] accs = new float[number];

void setup() {
 size(300, 700);
 frameRate(12);
 smooth();
 noStroke();
 for(int i = 0; i<number; i++){ // setting all the balls' initial values to 0
   circleY[i] = 0;
   vels[i] = random(0, 5);
   accs[i] = random(2, 2);
   

}
  }

void draw() {
background(0, 22, 255);
for (int i = 0; i < number; i++) {
fill(255, i*50, 188);
rect((i*spacing), circleY[i], 20, 60);
accs[i] = random(2, 2);
vels[i] = vels[i] + accs[i];
 circleY[i] = circleY[i] + vels[i];

  }
}



