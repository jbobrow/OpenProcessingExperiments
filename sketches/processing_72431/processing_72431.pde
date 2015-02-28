
float dy, t, b, r;
int k;

void setup() {
  size(600, 600); 
  frameRate(100);
  dy = 0;
  k = 0;
  t = 0.0;
  b = 0.0;
  r = 12;
  //r = 3;

  background(255);
}

void draw() {

  stroke(0, 40);

  float x = width/4*sin(t+k-b)+width/2;
  float y = (3*height/8)*cos(t+k)+height/2+dy;
  float x2 = (3*height/8)*tan(t+10)+width/2;
  float y2 = width/4*cos(t+2)+height/2+dy;

  x = constrain(x, 0, width-1);
  y = constrain(y, 0, height-1);
  x2 = constrain(x2, 0, width-1);
  y2 = constrain(y2, 0, height-1);

  line(x, y, x2, y2);

  t += .1;
  dy += 0;
  b = random(-r, r);
  if (r > 0)
    r -= 0.01;
    println(r);
  k+=1;
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("output/wrapping_paperI-####.png");
    println("saved");
  }
}
