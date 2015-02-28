
Bug[] myBugs = new Bug[200];

void setup() {
  size(400,400);
  smooth();
  noStroke();
  fill(255);
  for (int i = 0; i < myBugs.length; i++) {
    float x = width/2 + cos(i) * i;
    float y = height/2 + sin(i) * i;
    myBugs[i] = new Bug(x,y,0.05 + (i/1000.0));
  }
}
void draw() {
  background(150,0,0);
  for (int i = 0; i < myBugs.length; i++) {
    myBugs[i].live();
  }
}

