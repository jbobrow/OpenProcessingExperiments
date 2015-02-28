
PFont keys;


//radius of 3pt zone
int r3ptline = 650;

//location of 3pt zone
float ThreePointX;
float ThreePointY;

//radius of the ball
int r = 25;

//location of the 1st ball
float ballx1;
float bally1;


//radius of the basket
int rbasket = 40;

//location of the basket
float basketx1;
float baskety1;

//3 sec zone
int zoneWidth = 200;
int zoneHeight = 200;

// location of zone
int zoneX;
int zoneY;

//free throw zone
int freeZoneRadisu = 200;

//basket square
int basketWidth = 30;
int basketHeight = 10;

//location of the square
float squarex;
float squarey;

//ball movement in x-axis
int speedx = 10;






void setup() {
 size(1000, 500);
 background(255);
 
 
 
 ballx1= 143;
 bally1= 30;
 basketx1= 500;
 baskety1= 28;
 squarex= 485;
 squarey= 0;
 ThreePointX = width/2;
 ThreePointY = 0;
 zoneX = 400;
 zoneY = 0;

 
 
 keys = loadFont("ARCENA-48.vlw");
  textFont(keys, 40);
} 

void draw(){
  //reference of x and y axis
  println(mouseX + "," + mouseY);
  
  
    
  
  
  //draw 3pt zone
  fill(255);
  stroke(0);
  ellipse(ThreePointX,ThreePointY,r3ptline,r3ptline);
  strokeWeight(5);
  
  //draw 1st basketball
  fill(#FF6600);
  stroke(0);
  ellipse(ballx1,bally1,r,r);
  
  
  //draw 3 sec zone
  fill(255);
  stroke(0);
  rect(zoneX,zoneY,zoneWidth,zoneHeight);

  
  //draw basket
  fill(255);
  stroke(255,0,0);
  ellipse(basketx1,baskety1,rbasket,rbasket);
  
  //draw basket square
  fill(255,0,0);
  stroke(255,0,0);
  rect(squarex,squarey,basketWidth,basketHeight);

 
 //R
 fill(255);
 stroke(0); 
 rect(739, 404, 70, 70, 7); 
 fill(0);
 text("R", 767, 444);

  

  
  //move ball to basket;
  if(key == 'r' || key == 'R'){
    fill(255,0,0);
    rect(739, 404, 70, 70, 7); 
    
    fill(#FF6600);
    stroke(0);
    ellipse(ballx1,bally1,r,r);
    ballx1 = ballx1 + speedx;
    if(ballx1 > width/2){
      speedx = 0;
      
    fill(204,204,204,204);
    stroke(0);  
    ellipse(ballx1,bally1,r,r);  
    }


}


