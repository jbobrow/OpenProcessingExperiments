
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
int colorDiff;//difference between hues


int startingHue2=15;
int endingHue2=6;
int randomNum2;
int randomHue2;
int colorDiff2;

int startingHue3=358;
int endingHue3=279;
int randomNum3;
int randomHue3;
int colorDiff3;

float a;
float b;
float c;
float d;
float e;
float f;

int whichOne=0;


boolean makeFirstTriangle=true;

//control buttons//
boolean buttonOne=false;
//boolean buttonTwo=false;
//boolean buttonThree=false;



void setup(){
  size(800,600);
  colorMode(HSB,360,100,100);
  
  colorDiff= startingHue - endingHue;
  colorDiff2=startingHue2-endingHue2;
  colorDiff3=startingHue3-endingHue3;
  
  background(29,6,94);
    for (int y= 0; y<height; y+=3){
    for (int x=0; x<width; x+=4){
   line(x,y,x,y);
   stroke(29,31,61,50);
    }
    }
    for (int y= 0; y<height; y+=2){
    for (int x=0; x<width; x+=3){
   line(x,y,x,y);
   stroke(29,31,61,50);
    }
    }
    
    
}

void draw(){

drawBorder();
drawButtons();

if(mouseX<60 && mouseX>0 && mousePressed == true){//small
    buttonOne==true;
     }
    

  
}


void mouseClicked () {
  
  if(makeFirstTriangle){
  makeFirstTriangle=false;
  drawFirstTriangle();
  }else{
    
    if(buttonOne==true){
    drawTriangle();
    }
    /*if (keyPressed){
    if (key == CODED) {
    if (keyCode == UP) {
       drawTriangle();
        }
      }
    }*/
  
  if (keyPressed){
    if (key == CODED) {
    if (keyCode == DOWN) {
       drawTriangle2();
      }
    }
  }

  if (keyPressed){
    if (key == CODED) {
    if (keyCode == RIGHT) {
       drawTriangle3();
      }
    }
  }

 

 }
 }

//draws first triangle to start composition
void  drawFirstTriangle(){
  
  noStroke();
  fill(whichOne,65,86,random(5,200));
  
  a=mouseX+random(-30,30);
  b=mouseY+random(-30,30);
  c=mouseX+random(100);
  d=mouseY+random(100);
  e=mouseX;
  f=mouseY;
triangle(a,b,c,d,e,f);

 if(whichOne==0){
    randomHue();
   }else if(whichOne==1){
      randomHue2();
    }else if(whichOne==2){
        randomHue3();
    }

  
 whichOne++;
 if(whichOne>2) {
  whichOne=0;

 }
}

void drawTriangle() {
  
noStroke();
fill(whichOne,65,86,random(5,200));
    
triangle(e,f, mouseX, mouseY,c,d);
c=e;
d=f;
e=mouseX;
f=mouseY;

   if(whichOne==0){
    randomHue();
   }else if(whichOne==1){
      randomHue2();
    }else if(whichOne==2){
        randomHue3();
    }

  
 whichOne++;
 if(whichOne>2) {
  whichOne=0;

 }
}

void drawTriangle2() {
  
noStroke();
fill(whichOne,72,99,random(5,200));
  
triangle(a,b, mouseX, mouseY, e, f); 
e=a;
f=b;
a=mouseX;
b=mouseY;
}


void drawTriangle3() {
noStroke();
fill(whichOne,72,99,random(5,200));

  float x1 = mouseX + random(-40);
  float y1 = mouseY + random(-40);

triangle(c,d,mouseX,mouseY,x1,y1); 
c=mouseX;
d=mouseY;

   if(whichOne==0){
    randomHue();
   }else if(whichOne==1){
      randomHue2();
    }else if(whichOne==2){
        randomHue3();
    }

  
 whichOne++;
 if(whichOne>2) {
  whichOne=0;

 }
}

void randomHue(){
  randomHue
  randomNum= floor(random(colorDiff));
  randomHue= randomNum + startingHue;
}

void randomHue2(){
  randomHue2
  randomNum2= floor(random(colorDiff2));
  randomHue2= randomNum2 + startingHue2;
}

void randomHue3(){
  randomHue3
  randomNum3= floor(random(colorDiff3));
  randomHue3= randomNum3 + startingHue3;
}

void drawBorder(){
  fill(255,0,99);
  noStroke();
  rectMode(CORNER);
  rect(0,550,width,height/6);
  rect(0,0,width/30,height);
  rect(775,0,width/30,height);
  rect(0,0, width,height/25);
}

void drawButtons(){

fill(0,0,85);
triangle(50,565,40,585,60,585);

fill(0,0,70);
triangle(100,565,90,585,110,585);

fill(0,0,55);
triangle(150,565,140,585,160,585);

textSize(15); //save
  fill(0,0,70);
  text("SAVE", 710, 580);


}


