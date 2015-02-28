

void setup(){

  size (800,600);
  noLoop();

}


void draw(){

  background(255);
  randomSeed(0);
  for (int i=35; i<width; i+=25){
    int gray = int(random(0,10));
    float scalar = random (0.1,1.0);
   dresser(i, 80, gray, scalar); }

}

void dresser(int x, int y, int g, float s) {

  pushMatrix();
  translate (x, y);
    //dresser
  fill(0);
  rect(0, 0, 190, 100);
  fill(255);
  rect(10,10, 50,10);
  ellipse(35,15,3,3);
  rect(10,30, 50,20);
  rect(10,60, 50,20);
  rect(70,10, 50,10);
  ellipse(95,15,3,3);
  rect(70,30, 50,20);
  rect(70,60, 50,20);
  rect(130,10, 50,10);
  ellipse(155,15,3,3);
  rect(130,30, 50,20);
  rect(130,60, 50,20);
}


