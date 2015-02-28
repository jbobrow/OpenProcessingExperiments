
int num = 7;
PVector[] points = new PVector[num];
float x, y, destx, desty, r;
int i=0;

void setup() {
  size(500, 500);
  background(#202020);
  rectMode(CENTER);
  float radius = width/6;

  for (int i=0; i<num; i++) {
    float a = TWO_PI/num;
    float px = width/2 + sin(i*a)*radius;  
    float py = height/2 + cos(i*a)*radius;  
    points[i] = new PVector(px, py);
  }

  x = points[0].x;
  y = points[0].y;

  destx = points[0].x;
  desty = points[0].y;
}
void draw() {
  stroke(255, 200);

  float sz = map(sin(r), -1, 1, width/10, width/5);
  float v = 5;
  //println(frameCount); 221

  x = lerp(x, destx, 0.1);
  y = lerp(y, desty, 0.1);

  float d = dist(x, y, destx, desty);
  if (d < 1) {
    x = destx;
    y = desty;
    i++;
    destx = points[i%num].x;
    desty = points[i%num].y;
  }


  pushMatrix();
  translate(x, y);
  rotate(r);
  if (random(1)>.7) {
    fill(#DAD782, 100);
  } 
  else {
    fill(#BA3088, 150);
  }
  rect(10+random(-v, v), -20+random(-v, v), sz, sz, sz/10);  
  popMatrix();

  r += 0.0523*2;

  //if (frameCount % 4 == 0) saveFrame("image-####.gif");
}

void keyPressed() {
  save(random(2323)+".png");
}

