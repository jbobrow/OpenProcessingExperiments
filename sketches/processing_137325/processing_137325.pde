
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/137099*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
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

float a;
float b;
float c;
float d;
float e;
float f;

int whichOne=0;


boolean makeFirstTriangle=true;



void setup(){
  size(800,600);
  colorMode(HSB,360,100,100);
  colorDiff= startingHue - endingHue;
  colorDiff3=startingHue3-endingHue3;
}

void draw(){
}


void mouseClicked () {
  
  if(makeFirstTriangle){
    makeFirstTriangle=false;
  drawFirstTriangle();
  }else{
  
 /* if keyPressed {
  if (key == CODED) {
    if (keyCode == UP) {
       drawTriangle();
  }
  
  if keyPressed{
    if (key == CODED) {
    if (keyCode == DOWN) {
       drawTriangle2();
  }*/
   if(whichOne==0){
     drawTriangle();
   }else if(whichOne==1){
     drawTriangle2();
    } 
  
// drawTriangle();
  //drawTriangle2();
  //drawTriangle3();
 

  
  randomNum= floor(random(colorDiff));
  randomHue= randomNum + startingHue;
  
  randomNum3= floor(random(colorDiff3));
  randomHue3= randomNum3 + startingHue3;
  
  whichOne++;
  if(whichOne>2) {
  whichOne=0;
  }
  }
  }



void  drawFirstTriangle(){
  
  noStroke();
  fill(randomHue,65,86,random(5,200));
  
  a=mouseX+random(-30,30);
  b=mouseY+random(-30,30);
  c=mouseX+random(100);
  d=mouseY+random(100);
  e=mouseX;
  f=mouseY;
triangle(a,b,c,d,e,f);
}

void drawTriangle() {
  
noStroke();
fill(randomHue,65,86,random(5,200));
    
triangle(e,f, mouseX, mouseY,c,d);
c=e;
d=f;
e=mouseX;
f=mouseY;

 
}

void drawTriangle2() {
  
noStroke();
fill(randomHue3,72,99,random(5,200));

  float x1 = mouseX + random(20);
  float y1 = mouseY + random(20);
  
triangle(a,b, mouseX, mouseY, e, f); 
e=a;
f=b;
a=mouseX;
b=mouseY;
}


/*void drawTriangle3() {
noStroke();
fill(randomHue,72,99,random(5,200));

  int i=mouseX+random(-200,300);
  int a=mouseY+random(-200,200);

  float x = i + random(20);
  float y = a + random(20);
  
  float x2 = x + random(-50,50);
  float y2 = y + random(-50,50);

triangle(a,i,x,y,x2,y2); 
}*/



