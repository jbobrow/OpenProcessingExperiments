
float x, y, dx, dy;
int radius;
float[] top;
float[] bottom;
float[] left;
float[] right;
float damage;

void setup() {
  size(400,400);
  x = 200;
  y = 150;
  dx = 4;
  dy = 4;
  radius = 10;
  damage = 1;
  top = new float[width];
  bottom = new float[width];
  left = new float[height];
  right = new float[height];
  for (int i = 0; i < top.length; i++) {
    top[i] = 0;
    bottom[i] = 0;
  }
  for (int i = 0; i < left.length; i++) {
    left[i] = 0;
    right[i] = 0;
  }
  background(#9ABCD1);
  frameRate(120);
}

void draw () {
  //background(255);
  walls();
//  noStroke();
  fill(255, 20);
  ellipse(x,y,radius*2,radius*2);
  x += dx;
  y += dy;
  collide_check();
}

void collide_check() {
  if (x - radius < 0 ) {
   dx = -dx;
   dy += left[int(y)];
   left[constrain(int(y),0,left.length)] += random(damage);
  }
  if (x > width - radius) {
   dx = -dx;
   dy += right[int(y)];
   right[constrain(int(y), 0, right.length)] += random(damage);
  }
  if (y - radius < 0 ) {
   dy = -dy;
   dx += top[int(x)];
   top[constrain(int(x), 0, top.length)] += random(damage);
  }
  if (y > height - radius) {
    dy = -dy;
    dx += bottom[int(x)];
    bottom[constrain(int(x), 0, bottom.length)] += random(damage);
  }
}
 
void walls(){
  strokeWeight(3);
  for (int i = 0; i < top.length; i++) {
    stroke(255 - top[i]*100);
    point(i, 0);
  }
  for (int i = 0; i < bottom.length; i++) {
    stroke(255 - bottom[i]*100);
    point(i,height-2);
  }
  for (int i = 0; i < right.length; i++) {
    stroke(255 - right[i]*100);
    point(width-2, i);
  }
  for (int i = 0; i < left.length; i++) {
    stroke(255 - left[i]*100);
    point(0+1,i);
  }
  strokeWeight(1);
  stroke(0);
}
