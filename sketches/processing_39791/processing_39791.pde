

int  num=100;
float[] x= new float[num];  //x coordinate
float[] y= new float[num]; // y coordinate
float[] speed= new float[num];  // controls the spead of the bugs

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int b=0; b< num; b++) {  //see the array
    x[b]= random(width); //at each index the x coordinate will be a random number from 0-300
    y[b]= b*(height/10); //at each index the y coordinate will be height/10 of it
    speed[b]=random(.5, 2); //sets up the speed of the bugs
  }
}


void draw() {
  background(113, 128, 170);
  for (int b=0; b<num; b++) {

    lbug(x[b], y[b]);

    x[b]=x[b]+speed[b]; //update the car's variables in the array?
    if (x[b]>width+10) {
      x[b]=-10;
    }
  }
}


void lbug(float x, float y) { //function to create the lighting bugs
  pushMatrix();
  translate(x, y);
  if (random(20)>18) {
    fill(234, 228, 28);
    ellipse(0, 0, 40, 10);
    fill(40);
    ellipse(x+30, 0, 10, 40);
  }
  else {
    fill(40);
    ellipse(0, 0, 50, 20);
    fill(40);
    ellipse(x+20, 0, 50, 20);
  }
  popMatrix();
}


