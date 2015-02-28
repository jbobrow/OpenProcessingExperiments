
//Figures separate and move over time

int num = 300; //number of figures

float[] sizes = new float[num];
float[] y = new float [num];
float[] speed = new float [num];
color[] myColor = new color [3];


void setup() {
  size(300, 300);


  myColor[0] = color(0, 50, 100); //blue
  myColor[1] = color(255, 205, 0);  //yellow
  myColor[2] = color(29, 203, 39); //green

  // seed the array
  for (int i=0; i< num;i++) {
    y[i] = random(width, 10);
    speed[i] = random (4, -8);
    sizes[i] = random(-50, 25);
  }
}



void draw() {
  background(255);

  for (int i=0; i < num; i++) {

    if (height/num > 1) {
      fill (myColor[1]);
      rect (height/num * i + height/num, y[i], sizes [i], sizes [i]);
      y[i] = y[i] + speed[i];
    }
    else {
      fill (myColor[0]);
      rect (height/num * i + i * .5 + height/num, y[i], sizes [i], sizes [i]);
      y[i] = y[i] + speed[i];
    }
    if (y[i] > width + abs(sizes[i]/2)) y[i] = abs(-sizes[i])/2;
    if (y[i] < -abs(sizes[i]/2)) y[i] = width - +abs(sizes[i]/2);
  }
}


