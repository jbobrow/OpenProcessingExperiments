
int x = 0;
int sens=2;

void setup() {
  noStroke();
  size(400,200);
  fill(255);
  rect(0,0,200,200);
  fill(0);
  rect(200,0,400,400);
}

void draw() {
  background(255);
  fill(0);
  rect(200,0,400,400);
  x=x+sens;
  if(x>200) {
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(x,100,20,20);
  if(x>400) {
    sens=-2;
  }
  if(x<0) {
    sens=2;
  }
}

void keyPressed () {
  saveFrame("export-###.png");
}


