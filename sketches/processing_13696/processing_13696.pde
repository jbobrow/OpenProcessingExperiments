
float x;
float i=0.2;
PImage skyline;
PImage night;
PImage westside;
PImage phantom;
PImage south;
PImage inception;
PImage hair;
PImage wicked;
PImage statue;
PImage leverage;
PImage fireworks;
PImage bridge;
PFont americanTypewriter;

void setup(){
  size(600,600);
  smooth();
  skyline=loadImage("skyline.png");
  image(skyline,0,0);
  background(skyline);
  night=loadImage("night.png");
  image(night, 0,0);
 
}

 void draw(){

if (mousePressed== true){
  if (mouseButton==LEFT){
     x=map(i,0,5,0,mouseX);
  filter(DILATE);
  }else{
    noFill();
  if (mouseButton==RIGHT){
     x=map(i,0,5,0,mouseX);
  filter(POSTERIZE, x+20);
  }
  }}
//scene 1    

if (keyPressed){
  
  if (key==' '){
  night=loadImage("night.png");
  image(night, 0,0);}

 if (key=='1'){
     westside=loadImage("westside.png");
     image(westside,100,200);
 }
  if (key=='2'){
     phantom=loadImage("phantom.png");
     image(phantom,200,300);
  }
  if (key=='3'){
     south=loadImage("south.png");
     image(south,400,100);
 }
  if (key=='4'){
     inception=loadImage("inception.png");
     image(inception,400,0);
 }
  if (key=='5'){
     hair=loadImage("hair.png");
     image(hair,0,0);
 }
  if (key=='6'){
     wicked=loadImage("wicked.png");
     image(wicked,200,200);
 }
   if (key=='7'){
     statue=loadImage("statue.png");
     image(statue,300,10);
 }
    if (key=='8'){
     leverage=loadImage("leverage.png");
     image(leverage,0,400);
    }
    
//scene 2

}
if (keyPressed){
 if (key=='s'){
   background(skyline);

  filter(POSTERIZE,X+20);
 }
if (key=='f'){
  fireworks=loadImage("fireworks.png");
  image(fireworks, 0,0);
  fill(0,0,0,100);
}

if (key=='b'){
  bridge=loadImage("bridge.png");
  image(bridge,0,200);
   
  }
//text
textAlign(CENTER);

americanTypewriter=loadFont("AmericanTypewriter-48.vlw");
textFont(americanTypewriter, 100);
fill(255);

if ((key=='n')){
  text("NEW YORK", 300,200);
  text("NEW YORK", 300,400);
  text("NEW YORK", 300,600);
 
}

}
 }

