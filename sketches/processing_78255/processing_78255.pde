
//Predator and prey project
//Created By: Quintin Johnson
// I would like to thank Brian Schrank's code to help me out for this project

PImage img; //house image set for background
PImage tomScared2;

PImage jerry;
PImage tom;
PImage dog;
float tomY = 0; //  y coordinate of tom
float tomX = 0; //  x coordinate of tom
float jerryY = 0; //  y coordinate of jerry
float jerryX = 0; //  x coordinate of jerry
float dogY = 0; // y coordinate of dog
float dogX = 0; // x coordinate of dog
float tomMoveY; // variable that changes in the y to move tom
float tomMoveX; // variable that changes in the x to move tom
float jerryMoveY; // variable that changes in the y to move jerry
float jerryMoveX; // variable that changes in the x to move jerry
float dogMoveY; // variable that changes in the y to move dog
float dogMoveX; // variable that changes in the x to move dog
float maxSpeed = 3.0; // variable that sets the maximum speed at which characters can move
float radius = 50.0; // variable that sets the size of character
boolean tScared2 = false; // boolean variable that lets tom remain scared


void setup(){
  //background(225,0,0);
  size(300,300);
  img=loadImage("house.png");
  //house = loadImage("house.png");
  jerry= loadImage("jerry.png");
  tom= loadImage("tom.png");
  dog= loadImage("dog.png");
  tomScared2= loadImage("tomScared2.png");
  //house= loadImage("house.png");
  tomMoveX=random(-maxSpeed, maxSpeed); // tom x speed
  tomMoveY=random(-maxSpeed, maxSpeed); // tom y speed
  jerryMoveX=random(-maxSpeed, maxSpeed); // jerry x speed
  jerryMoveY=random(-maxSpeed, maxSpeed); // jerry y speed
  dogMoveX=random(-maxSpeed, maxSpeed); // dog x speed
  dogMoveY=random(-maxSpeed, maxSpeed); // dog y speed
  tomX=random(width-radius); // sets the starting position of  tom in the x
  tomY=random(height-radius); // sets the starting position of tom in the y
  jerryX=random(width-radius); // sets the starting position of jerry in the x
  jerryY=random(height-radius); // sets the starting position of jerry in the y
  dogX=random(radius*1, width-radius*1);  // sets the starting position of dog in the x
  dogY=random(radius*1, height-radius*1);  // sets the starting position of dog in the y
  smooth();  // sets all 2D primitives to draw smoothly
  noStroke();  // sets all 2D primitives to draw without outlines
  ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius width and radius height
  imageMode(CENTER); 
}


void draw(){
image(img,0,0);

//Jerry and dog= attractive
if (dogX <= jerryX){
  dogX+=.01;
} else {
  dogX-=2;
}
if (dogY <= jerryY){
  dogY+=.01;
} else {
  dogY-=2;
}


if(jerryX>tomX){
    jerryX-=1;
  }else{
    jerryX+=1;
  }

//Jerry=Predator
jerryX+=jerryMoveX; // these 2 lines move move jerry
  jerryY+=jerryMoveY;
  if (jerryX>width-radius || jerryX<radius) { // 
    jerryMoveX=-jerryMoveX;
  }
  if (jerryY>width-radius || jerryY<radius) {
    jerryMoveY=-jerryMoveY;
  }
  fill(255, 0, 0); 
  //ellipse(rX, rY, radius, radius); // draws red ellipse
  image(jerry,jerryX,jerryY,radius*1, radius*1);
  
   
  //dog=predator
  dogX+=dogMoveX; // these 2 lines move dog
  dogY+=dogMoveY;
  if (dogX>width-radius || dogX<radius) { 
    dogMoveX=-dogMoveX;
  }
  if (dogY>width-radius || dogY<radius) {
    dogMoveY=-dogMoveY;
  }
  fill(0, 225, 0);
 // ellipse(gX, gY, radius, radius);
 image(dog,dogX,dogY,radius*1,radius*1);
 
   
     
  //tom=prey
  tomX+=tomMoveX;  // these 2 lines move tom
  tomY+=tomMoveY;
  if (tomX>width-radius*1 || tomX<radius*1) { 
    tomMoveX=-tomMoveX;
  }
  if (tomY>width-radius*1 || tomY<radius*1) {
    tomMoveY=-tomMoveY;
  }
  if (dist(jerryX, jerryY, tomX, tomY)<radius*1 || dist(dogX, dogY, tomX, tomY)<radius*1) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (tScared2==false) {
      tomMoveY=-tomMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      tomMoveX=-tomMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
      tScared2=true;
    }
  }
  else {
    tScared2=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (tScared2==true) { // if tom is "scared" then it remains tomScared2 image
    //fill(210, 100, 0);
    image(tomScared2, tomX, tomY, radius*1, radius*1);
  }
  else { // // if tom not "scared" it remains tom image
    fill(225);
    image(tom, tomX,tomY,radius*1,radius*1);
  }
 
  //ellipse(pX, pY, radius*2, radius*2); // 
  fill(0,3);
  
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
}




