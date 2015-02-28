
int sizeA,sizeB;

void setup() {
  size(400,400);
  background(255);
  fill(0);
  noStroke();
  smooth();
  setSizes();
  //size for circle 1
}

void draw() {
  background(255);
  //draws circles
  ellipse(width*.25,height/2,sizeA,sizeA);
  ellipse(width*.75,height/2,sizeB,sizeB);
}

void setSizes() {
  sizeA =  int(random(20,width));
  sizeB =  int(random(20,width));
  println(sizeA + " " + sizeB);
}

void keyPressed() {
  if(key == 's') {
    saveFrame("thumb.jpg"); 
  } else {
    setSizes(); 
  }
}

