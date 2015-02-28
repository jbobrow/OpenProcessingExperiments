
//Tracy Carlin
//Final Project for Computational Expression
//March 31, 2012

//global variables here
PImage sox = loadImage("HangingSox.png");
Shooter soxy= new Shooter(50,height/2,50);
int targetNum= 5;

void setup () {
  size(800,600);
smooth();
background(240);
makeBG();
frameRate(10);
}

void draw () {
  //makeBG();
  background(255);
   populateTargets();
 soxy.make(); //initally draws the shooter
 if (keyPressed) { //uses keys for slower more precise movements
  if (key == 'q' || key == 'Q') {
  soxy.scrollUp(); 
 } 
 else if (key == 'a' || key == 'A') {
   soxy.scrollDown();
 }
 }
}

void mouseMoved() { //faster movemetn control w/ the mouse
 soxy.dash(); 
}

void makeBG(){
  color colorA = #C42626;
  color colorB = #740000;
  int bgNum = int(random(5,20));
  Flower[] bg; //declaring an object array
bg = new Flower[bgNum]; //declaring the dimension
for (int p=0;p<bgNum;p++) { //filling in variables with random information
  bg[p] = new Flower(random(1,10),random(15,width-15),random(15,height-15),colorA,colorB);
}

for(int i=0; i<bgNum;i++) { //placing the flowers on the screen
 bg[i].blossom(); 
}
}

void populateTargets () {
  //targets here
Target[] skeet; //declaring an object array
skeet = new Target[targetNum]; //declaring the dimension
for (int p=0;p<targetNum;p++) { //filling in variables with random information
  skeet[p] = new Target(700,100+100*p,random(50,100));
  skeet[p].generate();
  
}
if(frameCount%5000 == 0) {
  for (int f=0;f<targetNum;f++) { //filling in variables with random information
  skeet[f] = new Target(700,100+100*f,random(50,100));
  skeet[f].rearrange();
}
}
}


