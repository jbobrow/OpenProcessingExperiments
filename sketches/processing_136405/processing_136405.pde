
int startingHue=172;
int endingHue=120;
int randomNum;
int randomHue;
int colorDiff;//difference between hues
float ax;
float ay;
int distance = 80;
//controls how many lines are drawn
int maxPoints = 2;
PVector[] vectors = new PVector[maxPoints];
int ctr = 0;
int tctr = 0;



void setup(){
  size(800,600);
  colorMode(HSB,360,100,100);
  background(255,0,99);
  colorDiff= startingHue - endingHue;
  //defines variables
  ax = width/4;
  ay = height/4;
}

void draw(){
}


void mouseClicked () {
  drawTriangle();
  randomNum= floor(random(colorDiff));
  //println("randomNum:"+randomNum);
  randomHue= randomNum + startingHue;
  //println("randomHue:"+randomHue);

}

void drawTriangle () {
stroke(randomHue,65,86);
  //makes random x and y values
  float x = ax + random(-distance,distance);
  float y = ay + random(-distance,distance);


  for (int i = 0; i < min(tctr, maxPoints); ++i) {
    line(vectors[i].x,vectors[i].y,x,y);
   }
  //moves composition from one spot to another
  vectors[ctr] = new PVector(x,y);
  ctr = (ctr + 1) % maxPoints;
  tctr += 1;
  ax = x;
  ay = y;
}


