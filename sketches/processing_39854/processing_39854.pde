
int num = 50; 

float[] x = new float[num]; 
float[] y = new float[num]; 



void setup() {
  size(300, 300);
  background(50);
  frameRate(2);

  for (int i=0; i < num;i++) {
    x[i] = random(width/2); //width/2 so as to keep the composition weighted on the left side of the canvas
    y[i] = random(height/2);//height/2 so as to keep the composition weighted to the top of the canvas
  } // overall result is a composition strictly contained in the top left corner of canvas
}

void draw() {
  background(100);

  for (int i=0; i < num; i++) {

    rectMode(CENTER);
    stroke(0);
    fill(random(255));
    rect(x[i], y[i], 30, random(5, 150));
  }
}







