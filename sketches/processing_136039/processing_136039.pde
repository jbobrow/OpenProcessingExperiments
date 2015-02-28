
void setup() {
  size (1000, 100);
  background(0);
}

float t = 0.;
int x = 0;

void draw() {
    strokeWeight(2);
    stroke(map(noise(t),0.,1.,0,255), 0, 0);
    line(x % width, 0 , x % width , 100);
    t = t+0.01;
    x++;
}

