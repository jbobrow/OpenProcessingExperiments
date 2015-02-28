
//Joseph Volpe,
//August 4th
//bouncing ball assignment

//background image
PImage clouds;



//moving image 1
PImage smiley;
float xPos = 0;
float yPos = 0;
int smileyRadius=140;
boolean isGoingRight = true;
boolean isGoingDown = true;
//moving image 2
PImage bugs;
float xpos = 100;
 
 
void setup(){
  size(800,600);
  background(0);
  clouds = loadImage("clouds.jpg");
  bugs = loadImage("bugs.png");
  smiley = loadImage("smiley1.png");
  
  resize(smileyRadius*2,smileyRadius*2);
   
  imageMode(CENTER);
}
 
void draw(){
  imageMode(CORNER);
  image(clouds, 0,0);
  imageMode(CENTER);

//  pushMatrix();
//  scale(.3);
  image(smiley, xPos, yPos);
//  popMatrix();
  image(bugs,  xpos, height/5+100);
   
  xpos++;
   if(xpos>width+150){
    xpos=-150;
  } 
   
   
  //fill( R, G, B, opacity out of 255);
  //fill(255,255,255, 100);
  //rect(100, 150, 95, 155);
 
//always moving down one pixel at a time
 //
 
 
 
 
 // X POSITION
  if(isGoingRight){
    // xPos = xPos + 3;
    xPos+=3;
  }
  else {
    // xPos = xPos - 3;
    xPos-=3;
  }
   
  
  if(xPos + smileyRadius >= width){
     isGoingRight = false;
  }
   
  if(xPos - smileyRadius <= 0) {
     isGoingRight = true;
  }
   
 
 
//Y POSITION
  if(isGoingDown){
    // yPos = yPos + 3;
    yPos+=3;
  }
  else {
    // yPos = yPos - 3;
    yPos-=3;
  }
   
  
  if(yPos + smileyRadius >= height){
     isGoingDown = false;
  }
   
  if(yPos - smileyRadius <= 0) {
     isGoingDown = true;
  }
 
 
   
}


