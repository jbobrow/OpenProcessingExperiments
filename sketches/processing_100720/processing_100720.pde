
int seed = int(10);
int size;
int id;
void setup() {
  size(500,500);
  smooth();
}
void draw() {
  background(0);
  translate(width/2,height/2);
  id=0;
  recCircle(0,0);
  size=width/10;
}

void recCircle(int level, int num) {
  noStroke();
  randomSeed(seed+id);
  id++;
  fill(random(255),random(255),random(255),100);
  ellipse(0,0,size/2,size/2);
  if(level<=5) {
    for(int i=0; i<3; i++) {
      pushMatrix();
      float t = level*float(millis())/4000;
      translate(size*sin(TWO_PI*i/3+t),size*cos(TWO_PI*i/3+t));
      recCircle(level+1,i);
      popMatrix();
    }
  }
}


