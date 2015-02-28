
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/136404*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int startingHue=172;
int endingHue=120;
int randomNum;
int randomHue;
int colorDiff;//difference between hues
int ay;
int xy;
int bx;
int by;
int cx;
int cy;



void setup(){
  size(800,600);
  colorMode(HSB,360,100,100);
  ax = random(800);
  ay = random(600);
  bx = mouseX+random(100);
  by = mouseY+random(100);
  colorDiff= startingHue - endingHue;
}

void draw(){
}


void mouseClicked () {
  drawTriangle();
  drawTriangle2();
  drawTriangle3();
  
  randomNum= floor(random(colorDiff));
  //println("randomNum:"+randomNum);
  randomHue= randomNum + startingHue;
  //println("randomHue:"+randomHue);

}

void drawTriangle() {
noStroke();
fill(randomHue,65,86,random(5,200));

  float x = ax + random(50,100);
  float y = ay + random(50,100);
  
triangle(ay,xy, mouseX, mouseY,x,y);
}

void drawTriangle2() {
noStroke();
fill(randomHue,65,86,random(5,200));

  float x1 = bx + random(30, 100);
  float y1 = by + random(30,100);
  
triangle(ax,ay, mouseX, mouseY, x1, y1); 
}

void drawTriangle3() {
noStroke();
fill(randomHue,65,86,random(5,200));

  float x2 = cx + random(50, 100);
  float y2 = cy + random(50,100);
  
triangle(ax,ay, mouseX, mouseY, x2, y2); 
}


