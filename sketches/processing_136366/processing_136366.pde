
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
  strokeWeight(25);

  for (int i=0; i<num; i++) {
    start_diam[i]= diam[i] = sd;
    sd += incr_diam;
  }
}

void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    ellipse(x, y, diam[i], diam[i]);
    diam[i]++;
    if (diam[i]>(start_diam[i]+incr_diam)) diam[i]=start_diam[i];
  }
  
  //if (frameCount%3==0 && frameCount>50 && frameCount<185) saveFrame("image-###.gif");
  
}

