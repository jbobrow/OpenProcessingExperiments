
int rs, num=100;
float szS, szB, angle, theta;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  rs = int(random(1000));
  szS = width*.8;
  strokeCap(SQUARE);
}

void draw() {
  randomSeed(rs);
  background(0, 0, 90);

  noFill();
  stroke(#290350);
  strokeWeight(100);
  ellipse(width/2, height/2, szS, szS);

  angle=0;
  for (int i=0; i<num; i++) {
    szB = width/2;
    float xo = width/2;
    float yo = height/2;
    float x = xo+sin(angle)*szB;
    float y = yo+cos(angle)*szB;
    strokeWeight(random(10, 15));
    stroke(0, 0, 90);
    point(x, y);
    PVector loc = new PVector(x, y);
    PVector center = new PVector(xo, yo);
    PVector dir = PVector.sub(center, loc);
    dir.normalize();
    float m = random(100, 150);
    float offSet = TWO_PI/num*i;
    float mu = map(sin(theta+offSet*3),-1,1,m,m/2);
    dir.mult(mu);
    line(loc.x, loc.y, loc.x+dir.x, loc.y+dir.y);
    strokeWeight(30);
    ellipse(xo, yo, width, height);   
    angle += (TWO_PI/num);
  } 
  theta += 0.0523;
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.jpg");
}

