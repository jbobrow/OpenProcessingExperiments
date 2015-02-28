
int num = 10;
float[] start_diam = new float[num];
float[] diam= new float[num];
float incr_diam;
float x, y, sd;

void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  noFill();
  x = width/2;
  y = height/2;
  incr_diam = width/num*2;
  strokeWeight(20);

  for (int i=0; i<num; i++) {
    start_diam[i]= diam[i] = sd;
    sd += incr_diam;
  }
}

void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    stroke(0);
    ellipse(x, y, diam[i], diam[i]);
    stroke(255);
    ellipse(x-incr_diam/2, y-incr_diam/2, diam[i], diam[i]);
    diam[i]+=1;
    if (diam[i]>(start_diam[i]+incr_diam)) diam[i]=start_diam[i];
  }

}

