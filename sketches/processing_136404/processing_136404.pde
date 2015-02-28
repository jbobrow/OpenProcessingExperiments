
int startingHue=172;
int endingHue=120;
int randomNum;
int randomHue;
int colorDiff;//difference between hues
int ay;
int xy;




void setup(){
  size(800,600);
  colorMode(HSB,360,100,100);
  colorDiff= startingHue - endingHue;
  ax = width/2;
  ay = height/2;
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
noStroke();
fill(randomHue,65,86,random(200));

  float x = ax + random(100,100);
  float y = ay + random(100,100);
  
triangle(ay,xy, pmouseX,pmouseY,x,y);
}

