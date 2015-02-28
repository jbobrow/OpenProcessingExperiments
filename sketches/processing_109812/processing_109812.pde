
int howMany = 400;
float[] x = new float[howMany];
float[] y = new float[howMany];
float[] speed = new float[howMany];
 
void setup() {
  size(200, 800);
  background(255,248,21);
  noStroke();
  smooth();
 
  int i = 0;
  while (i<howMany) {
    x[i] = random(0, width);
    y[i] =random(0, height);
    speed[i] = random(1,5);
    i +=1;
  }
}
 
void draw() {
  //background(0);
  fill(188,27,247,3);
  rect(0,0,width, height);
 
  int i = 0;
  while (i < howMany) {
    fill(10,182,203,80*speed[i]);
    ellipse(x[i], y[i],speed[i],speed[i]);
    y[i] += speed[i]/4;
    if (y[i] > height) {
      y[i] = 0;
    }
    i +=1;
  }
}



