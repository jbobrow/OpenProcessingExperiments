
int xspacing = 1; 
int w;            
float counter;
  int superCount = 0;
float theta = 0.0;  
float amplitude = 200.0;  
float period = 600.0;  
float dx;  



float[] yvalues;  
int firsttime;
int secondtime;
int thirdtime;
int finaltime;



  
color a = color(225,random(180, 210),0,random(20,35));
color b = color(0,random(104,158),142,random(20,35));
color c = color(0,255,108,random(20,35));
color d = color(159,238,8,random(20,35));
color e = color(245,0,0,random(5,19));
color f = color(113,9,170,random(20,35));
color g = color(159,124,238,random(20,35));
color h = color(255,255,183,random(20,35));
color i = color(255,204,115,random(20,35));
color clear = color(9,4,13,random(9,12));


float startAngle = 0;
float angleVel = -0.1;
  
 
void setup(){
size(1920, 1080);
background(9,4,13);
smooth();
w = width*2;
dx = (TWO_PI / period) * xspacing*2;
yvalues = new float[w/xspacing];
frameRate(60);
}
  
void draw (){
  
  
  
countMe();
calcWave2();
renderWave2();
calcWave3();  
renderWave3();
calcWave4();  
renderWave4();
calcWave5();  
renderWave5();

}
void countMe(){

   int oneTime = 300;
  firsttime = oneTime;
  secondtime = oneTime+oneTime;
  thirdtime = secondtime+oneTime;



if(superCount == 1){
   a = d;
   b = e;
   c = f;
  }
  if(superCount == 2){
   a = g;
   b = h;
   c = i;
  }
  if(superCount == 3){
   a = color(225,random(180, 210),0,random(20,35));
 b = color(0,random(104,158),142,random(20,35));
 c = color(0,255,108,random(20,35));
 superCount=0;
  }

    if (counter < thirdtime+250){
      counter++;
    }
    else {
      counter = 0; 
      superCount++;
  }

}

//top
 void colorCycle2() {
 if (counter<firsttime){
    fill(a);
  }
  else if (counter < secondtime) {
fill(b);
  }
   else if (counter < thirdtime){
     fill(c);
  }
  else{
    fill(clear);
    
  }
}

 void colorCycle3() {
if (counter<firsttime){
    fill(b);
  }
   else if (counter < secondtime) {
fill(c);
  }
   else if (counter < thirdtime){
     fill(a);
  }
  else if (counter < thirdtime){
    fill(clear);
  }
}
 void colorCycle4() {
    if (counter<firsttime){
    fill(c);
  }
   else if (counter < secondtime) {
fill(a);
  }
   else if (counter < thirdtime){
     fill(b);
  }
  else {
    fill(clear);
  }
}

void colorCycle5() {
if (counter<firsttime){
    fill(b);
  }
   else if (counter < secondtime) {
fill(c);
  }
   else if (counter > thirdtime){
     fill(a);
  }
}




// top wave
//
//
void calcWave2() {
  theta += -0.02; //angle velocity
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx/6;
  }
}


void renderWave2() {
  noStroke();
  colorCycle2();
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing, height/3+yvalues[x], 5, 5);
  }
}


//middle wave
//
//
void calcWave3() {
  theta += 0.02/4;    
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)/2*amplitude;
    x+=dx/6*3;
  }
}

void renderWave3() {
    noStroke();
    colorCycle3();
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing+2, height/2+yvalues[x], 5,5);
  }
}



//bottom wave
//
//
void calcWave4() {
  theta += 0.02;
  float x = theta; 
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    colorCycle4();
    x+=dx/6;
  }
}

void renderWave4() {
    noStroke();
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing+1.5, height/1.5+yvalues[x], 5, 5);
  }
}


//mini waves
//
//
void calcWave5() {
  theta += 0.02;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)/random(5, 22)*amplitude;
    x+=dx*6;
  }
}

void renderWave5() {
    noStroke();
    colorCycle5();
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing+1, height/1.1+yvalues[x], 2, 19);
    rect(x*xspacing+1, height/13+yvalues[x], 2, 19);
  }
  }
  
  boolean sketchFullScreen() {
  return true;
}







