
float d;
float xPos;
float yPos;
float xVel;
float yVel;

PFont myFirstFont;
PFont mySecondFont;
int fontPpsY = 40;

int colorCounter = 0;
boolean mouseOnRight=false;
  int counter = 0; //dictates movement - only variable
  
  

void setup() { 
  size(400,400);
  background(200,0,200);
  smooth();
  noStroke();
  fill(255);
  frameRate(20);

d = random(100,100);
xPos = random(d/2, width - (d/2));
yPos = random(d/2, height - (d/2));
xVel = random(10,3);
yVel = random(-3,3);

myFirstFont = loadFont("JazzLetPlain-48.vlw");
mySecondFont = loadFont("SynchroLET-30.vlw");
  }

void draw() {
  background(200-colorCounter,0,200-colorCounter);
  noStroke();
  fill(255);
  ellipse(xPos,yPos,d,d);
  
  xPos = xPos + xVel;
  yPos = yPos + yVel;
  
  if(xPos < (d/2)) {
    xVel = xVel*(-1);
     fill(255-colorCounter,255-colorCounter,255);
    if (mouseX>=width/2&&mouseOnRight==false);
    mouseOnRight = true; 
     colorCounter+=5;    
  }
  
  else if(yPos < (d/2)){    
  yVel = yVel*(-1);
    fill(255-colorCounter,255-colorCounter,255);
    if (mouseX>=width/2&&mouseOnRight==false);
    mouseOnRight = true; 
     colorCounter+=5;
}
else if(xPos > width -(d/2)){
  xVel = xVel*(-1);
   fill(255-colorCounter,255-colorCounter,255);
    //if (mouseX>=width/2&&mouseOnRight==false){
    mouseOnRight = true; 
     colorCounter+=5;
}
else if (yPos > height-(d/2)){
  yVel = yVel*(-1);
   fill(255);
    
}

if(mouseX<width/2 && mouseY< height/2){
textFont(myFirstFont);
fill(0);
text("Click", width-150 , height/4 );
}

if(mouseX>=width/2 && mouseY<height/2){
  textFont(mySecondFont);
  fill(250,0,0);
  text("Computer says NO...", width/6, 300); 
}
if (mouseY>=height/2&&mouseOnRight==false) {
    mouseOnRight = true; 
    colorCounter+=10;
}

}
//
//if(mouseY>=height/2&&mouseOnRight==false){
//  mouseOnRight = true;
//  colorCounter+=10;
//  
  
  
//    if(mouseX <= 30/2) x =--x;{

  
//    if(pmouseX < /2);
  
  
//  if(pmouseX !=0 && pmouseY !=0)
    //fill(0,170,255);
    
    //rect(0, 0, width, height);
    //background(250,170,200);
//    
//    fill(0,170,255);
//    line(mouseX, mouseY, pmouseX, pmouseY);
//  if(mouseX < width/4 || mouseX > width*3/4 || mouseY < height/4 || mouseY > height*3/4) {
////    fill(255);
////    ellipse(width/4,height/2, 20, 20);
//    background(200,0,200);
//  }
//  
//  {
//    fill(0);
//    ellipseMode(CORNER);
//    ellipse(width/4, height/4, width/2, height/2);
//  }



// this is a background
//    rectMode(RADIUS);
//    rect(0, 0, width, height);
//    noStroke();

//this is my ellipse




//ellipse(x, y, width, height)


