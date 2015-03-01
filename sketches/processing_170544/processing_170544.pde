
float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;

float counter;

PImage face;
boolean totheleft=false;

int x=65;

float posA = 0;
float posB = 0;
float posC = 0;
float posD = 0;
float wordspeed = 4;

void setup(){
  size(600, 600);
  face=loadImage("face.png");
  
}
  
void draw(){
  background(pathR,pathG,pathB);
  pathR=centerR+R*sin(a);
  a=a+.03;
   
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
   
  pathB=centerB+B*sin(a2);
  a2=a2+.03;


counter = millis()/1000;

if (counter>=1 && counter<=2) {
 textSize(32);
fill(#47C6EA);
text("Boring?", 250, 200);
}
if (counter>=2 && counter<=4){
  textSize(32);
  fill(#47EAC8);
text("Goofy?", 255, 300);  
}
if (counter>=4 && counter<=6){
  textSize(32);
  fill(#47EA61);
text("Insane!?", 250, 400);
}
if (counter>=6 && counter<=9){
  image(face, 75, 2);
}

if (counter>=9){
image(face, 75, 2);

if (x==70){
  totheleft=true;
}
if (x==67){
  tothelft=false;
}
 if(totheleft){
   x=x-1;
 }
  else {
   x=x+1;
  }
 }
if (counter>=10){
  posA = posA + wordspeed;
  textSize(32);
  fill(#F75284);
  text("Creative", posA, 300);
}
if(counter>=11){
  posB = posB + wordspeed;
  textSize(32);
  fill(#EA47D5);
  text("Hard-Working", posB, 500);
}
if(counter>=12){
 posC = posC + wordspeed;
 textSize(32);
 fill(#8547EA);
 text("Caring", posC, 150);
}

if(counter>=13){
 posD = posD + wordspeed;
 textSize(32);
 fill(#4947EA);
 text("Trustworthy", posD, 400);
}

if (counter>=16){
  frameRate(10);
  fill(random(255),random(255),random(255));
  text("Not Everything is as it Seems" + char( int( random(33,126) ) ), random(width), random(height) );
 }
}


