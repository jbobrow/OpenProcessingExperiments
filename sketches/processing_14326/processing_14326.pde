
void setup() {
  size(600,600);
  smooth();
  background(255);
}

int f=0;

void draw() {

  if (mousePressed && mouseButton == LEFT && f%3==0) {
    int i = mouseX;
    int j = mouseY;
    fill(random(255),random(255),random(255), random(255));
    float t = random(random(4)*sqrt(j));
    float s = random(random(4)*sqrt(i));
    stroke(random(255),random(255),random(255), random(255));
    //          rotate(random(360));
    ellipse(i, j, t, s);
    ellipse(i, j, t+1,s+1);
  }
  if (mousePressed && mouseButton == RIGHT) {
    background(255);
  }
  f++;
}
                
