
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/136836*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/136404*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int startingHue=172;
int endingHue=120;
int randomNum;
int randomHue;
int startingHue2=15;
int endingHue2=6;
int randomNum2;
int randomHue2;
int startingHue3=358;
int endingHue3=279;
int randomNum3;
int randomHue3;
int colorDiff;//difference between hues
int colorDiff2;
int colorDiff3;




void setup(){
  size(800,600);
  colorMode(HSB,360,100,100);
  colorDiff= startingHue - endingHue;
  colorDiff3=startingHue3-endingHue3;
}

void draw(){
}


void mouseClicked () {
  drawTriangle();
  //drawTriangle2();
  //drawTriangle3();
  
  randomNum= floor(random(colorDiff));
  randomHue= randomNum + startingHue;
  
  randomNum3= floor(random(colorDiff3));
  randomHue3= randomNum3 + startingHue3;

}

void drawTriangle() {
  
noStroke();
fill(randomHue,65,86,random(5,200));

  int i=mouseX+random(-200,300);
  int a=mouseY+random(-200,200);

  float x = i + random(100);
  float y = a + random(100);
    
triangle(i,a, mouseX, mouseY,x,y);
 
}

void drawTriangle2() {
  
noStroke();
fill(randomHue3,72,99,random(5,200));
  
  bx = mouseX+random(-80,80);
  by = mouseY+random(-80,80);

  float x1 = bx + random(20);
  float y1 = by + random(20);
  
triangle(bx,by, mouseX, mouseY, x1, y1); 
}


void drawTriangle3() {
noStroke();
fill(randomHue,72,99,random(5,200));

  int i=mouseX+random(-200,300);
  int a=mouseY+random(-200,200);

  float x = i + random(20);
  float y = a + random(20);
  
  float x2 = x + random(-50,50);
  float y2 = y + random(-50,50);

triangle(a,i,x,y,x2,y2); 
}


