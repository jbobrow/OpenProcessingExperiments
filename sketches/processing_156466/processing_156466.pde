
float humanX;
float humanY;
float robotX;
float robotY;

float hellyesX;
float hellyesY;

float mehX;
float mehY;

float sadX;
float sadY;

float leftieX;
float leftieY;

float rightieX;
float rightieY;

float otherX;
float otherY;

PImage pbj;
PImage cheese;

float diameter=155;
PFont font;

boolean state1;
boolean state2;
boolean state3;
boolean state4;
boolean state5;
boolean state6;
boolean state7;

void setup(){
  background(250);
  size  (900,900);
  noStroke();
  humanX = width/4;
  humanY = 150;
  
  robotX = 3*width/4;
  robotY = 150;
  
  hellyesX = width/5.5;
  hellyesY = 400;
  
  mehX = width/2;
  mehY = 400;
  
   sadX = width/2;
  sadY = 400;
  
  leftieX = width/8;
  leftieY = 600;
  
  rightieX = width/2;
  rightieY = 600;
  
  otherX = width/1.15;
  otherY = 600;
  
  pbj = loadImage("pbj.png");
  cheese = loadImage("cheese.png");
  
  font = loadFont("AbadiMT-CondensedExtraBold-48.vlw");
  textFont (font, 48);
}

void draw(){
  background(248,177,7);
  
  fill(251,250,248);
  text("Are you....",width/4, 50);
  ellipse(humanX,humanY,diameter,diameter);
  fill(139, 139, 139);
   text("HUMAN", humanX/1.39, humanY*1.09);
   
   fill(251,250,248);
  ellipse(robotX,robotY,diameter,diameter);
   fill(139, 139, 139);
   text("a robot", robotX/1.11, robotY*1.09);
  
  if (state1==true){
    fill(255,0,0);
   ellipse(humanX, humanY, diameter*1.5, diameter*1.5);
  
  fill(251,250,248);
  text("Do you like sandwiches?", 50, 200);
  
  fill(251,250,248);
  ellipse(hellyesX, hellyesY, diameter*1.5, diameter*1.5);
  
  fill(139, 139, 139);
  text("Hell yes!", width/9, 420);
  
  fill(251,250,248);
  ellipse(mehX, mehY, diameter*.5, diameter*.5);
  
  fill(139, 139, 139);
  text("Meh", width/2.19, 420);
  }
  if (state2==true){
    fill(255,0,0);
   ellipse(robotX, robotY, diameter*1.5, diameter*1.5);
   
   fill (0);
   text("robots don't eat sandwiches",robotX/2.25, robotY);
   
  }
  if (state3==true){
    fill(255,0,0);
   ellipse(mehX, mehY, diameter, diameter);
   
   fill (0);
   text("you are not human",mehX/1.25, mehY);
  
}

  if (state4==true){
    fill(255,0,0);
   ellipse(hellyesX, hellyesY, diameter*1.5, diameter*1.5);
   
   fill(251,250,248);
   text("Which sandwich is best",hellyesX, 500);
  
  fill(251,250,248);
  ellipse(leftieX, leftieY, diameter, diameter);
  
   fill(139, 139, 139);
  text("PB&J", leftieX/2, 625);
  
  fill(251,250,248);
  ellipse(rightieX, rightieY, diameter, diameter);
  
   fill(139, 139, 139);
  text("CHEESE", rightieX/1.2, 625);
  
   fill(251,250,248);
  ellipse(otherX, otherY, diameter*.5, diameter*.5);
  
   fill(139, 139, 139);
  text("other", otherX/1.07, 625);
  
}
 if (state5==true){
   fill(255,0,0);
   ellipse(leftieX, leftieY, diameter, diameter);
   
   image(pbj, leftieX/6, 550);
}

if (state6==true){
    fill(255,0,0);
   ellipse(rightieX, rightieY, diameter, diameter);
    image(cheese, rightieX/1.8, 500);
}

if (state7==true){
   fill(255,0,0);
   ellipse(otherX, otherY, diameter, diameter);
  fill (0);
   text("you are a robot",otherX/1.5, otherY);
}
}
void mousePressed(){
  
  if (dist(mouseX, mouseY, humanX, humanY)<150/2){
      state1=true;
  }
  if (dist(mouseX, mouseY, robotX, robotY)<150/2){
      state2=true;
  }
    if (dist(mouseX, mouseY, mehX, mehY)<150/2){
      state3=true;
  }
     if (dist(mouseX, mouseY, hellyesX, hellyesY)<150/2){
      state4=true;
  }
   if (dist(mouseX, mouseY, leftieX, leftieY)<150/2){
      state5=true;
  }
  if (dist(mouseX, mouseY, rightieX, rightieY)<150/2){
      state6=true;
  }
    if (dist(mouseX, mouseY, otherX, otherY)<150/2){
      state7=true;
  }
}



