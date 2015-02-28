
PImage boonmee;
int time;
float ss = 35;


void setup(){
  size(800,500);
  background(0);
  noStroke();
  smooth();
  boonmee = loadImage ("boonmee.png");
  time = millis();
}

void draw(){
  //BACKGROUND
  float bgcR = map(mouseY,0,height,21,75);
  float bgcG = map(mouseX,0,width,52,100);
  float bgcB = map(mouseY,0,height,3,45);
  fill (0,bgcG,bgcB);
  rect (0,0,width,height);
  fill (37,73,160,150);

  //COLORFUL PLEASE!!
  //count to ten
float moonX = map(mouseX,0,width,572,592);
float moonY = map(mouseY,0,height,168,188);
  
  if (second()%10==9){
  //get bigger circle
    ss*=1.5;
    ellipse(moonX,moonY,ss,ss);
    fill(0,150);
    ellipse(moonX,moonY,ss*.7,ss*.7);
    ellipse(moonX,moonY,ss*.5,ss*.5);
    ellipse(moonX,moonY,ss*.25,ss*.25);
  }
  if (second()%10==8){
    ss=1;
  }
  fill(0,50);
  ellipse(moonX,moonY,300+second()*3,300+second()*3);
  ellipse(moonX,moonY,500+second()*7,500+second()*7);
  fill(255,218,2);
  ellipse(moonX,moonY,120+second(),120+second());
  
  //COUNT
  fill(0);
  PFont Font1;
  Font1 = loadFont("Megrim-48.vlw");
  textFont(Font1,70);
  text(second()%10,moonX-20,moonY+20);
    
  //IMAGE
  image(boonmee,0,0);
  
  //EYES
  //setup eye fill
  fill (255,0,0);
  //setup eye size
  
  float eyeS = map(second()%10,0,10,3,13);;
  //eye1
  float eye1X = map(mouseX,0,width,236,226);
  float eye1Y = map(mouseY,0,height,216,208);
  ellipse(eye1X,eye1Y,eyeS,eyeS);
  //eye2
  float eye2X = map(mouseX,0,width,262,254);
  float eye2Y = map(mouseY,0,height,219,212);
  ellipse(eye2X,eye2Y,eyeS,eyeS);
  //eye3
  float eye3X = map(mouseX,0,width,116,125);
  float eye3Y = map(mouseY,0,height,260,267);
  ellipse(eye3X,eye3Y,eyeS,eyeS);
  //eye4
  float eye4X = map(mouseX,0,width,144,152);
  float eye4Y = map(mouseY,0,height,262,269);
  ellipse(eye4X,eye4Y,eyeS,eyeS);
  //eye5
  float eye5X = map(mouseX,0,width,326,335);
  float eye5Y = map(mouseY,0,height,250,255);
  ellipse(eye5X,eye5Y,eyeS,eyeS);  
  //eye6
  float eye6X = map(mouseX,0,width,355,360);
  float eye6Y = map(mouseY,0,height,255,260);
  ellipse(eye6X,eye6Y,eyeS,eyeS);  
}

