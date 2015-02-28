


int xMin = 0;
int yMax,xMax;
int yMin = 0;

void setup() {
  smooth();
  size(700,500);
  yMax = height;
  xMax = width;
  frameRate(5);
}

void draw() {
  randomFlower();
}

void randomFlower() {
  
  color clr = color(random(20,230),random(20,230), random(20,230));
  float trans = random(190, 250);
  fill(clr,trans);
  //position of center of flower can be varied by translate
  translate(random(xMin,xMax),random(yMin, yMax));
  //number of petals (numPetals) can be varied
  float numPetals = random(9, 20);
  float petalLength = random(30, 100);
  println("Petal length = " + petalLength);
  for (float rot = 0; rot < (2 * PI); rot += (2 * PI) / numPetals) {
    pushMatrix();
    rotate(rot);
    beginShape();
    vertex(10,10);
    //petal length = distance between x,y params (1st 2 and last 2) below
    bezierVertex(10,10,50,20,10 + petalLength,10 + petalLength);
    // to make the petals fatter, increase the 3rd param below
      //petal length = distance between x,y params (1st 2 and last 2) below
    bezierVertex(10 + petalLength ,10 + petalLength,20,60,10,10);
    endShape();
    
    popMatrix();
  }
  //center size - change below
  ellipse(0,0,25,25);
}

