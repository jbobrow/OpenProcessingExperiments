
int frames=30, num=400;
float theta, sz=2;

void setup() {
  size(540, 540);
  noStroke();
}

void draw() {
  randomSeed(125);
  background(20);
  float r=0;
  noStroke();
  fill(255, 50);
  for (int i=0; i<=num; i++) {
    float offSet=TWO_PI/num*i;
    pushMatrix();
    translate(width/2, height/2);
    rotate(r);
    float d =  map(sin(theta-offSet*2), -1, 1, 5, 40);
    d=0;
    for (int j=0; j<150; j++) {
      float x = random(20, 200);
      float distance = dist(0,0,x,0);
      float maxsz = map(distance,0,150,10,0);
      sz = map(sin(theta),-1,1,0,maxsz);
      ellipse(x+d, 0, sz, sz);
    }
    r+=TWO_PI/num;
    popMatrix();
  }
  stroke(255);
  theta += TWO_PI/frames;
  //if (frameCount> 100 && frameCount<=100+frames) saveFrame("image-###.gif");
}

