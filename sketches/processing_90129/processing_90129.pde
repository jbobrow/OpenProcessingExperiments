
int n=30, minSize=1,maxSize=10, step=20;
float G = 500, EPS = 100;
PVector [] nodesLocation = new PVector [n];
float [] mass = new float [n];

void setup(){
  size(700,600);
  noStroke();
  initialize();
}

void initialize() {
for (int i=0; i< n; i++) {
  nodesLocation[i] = new PVector(random(width),random(height));
  mass[i] = random(minSize,maxSize);
  strokeWeight(1);
  stroke(199, 203, 189, 200);
  fill(100);
  ellipse(nodesLocation[i].x,nodesLocation[i].y,mass[i],mass[i]);
}
}

void draw(){
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  move();
  if (mousePressed & mouseButton == RIGHT){initialize();}
}

void move() {
  if (mousePressed & mouseButton == LEFT){
  for (int i=0; i < n; i = i+1) {
    for (int j=0; j < n; j = j+1) {
        bodyInteraction(i,j);
        strokeWeight(1);
        stroke(199, 203, 189,200);
        fill(100,200);
        ellipse(nodesLocation[i].x,nodesLocation[i].y,mass[i],mass[i]);
    }
  }  
}
else
{
  for (int i=0; i < n; i = i+1) {
  strokeWeight(1);
  stroke(199, 203, 189,200);
  fill(100,200);
  ellipse(nodesLocation[i].x,nodesLocation[i].y,mass[i],mass[i]);}
}
}


void bodyInteraction(int i, int j) {
  float mj = mass[j];
  PVector r = PVector.sub (nodesLocation[i], nodesLocation[j]);
  float d = PVector.dist (nodesLocation[i],  nodesLocation[j]);
  float invDistCube = 1 / pow (sq(d) + sq(EPS), 1.5) ;
  float s = G * mj * invDistCube;
  PVector ai = new PVector(-s * r.x, -s * r.y);
  nodesLocation[i].add(ai);
}





