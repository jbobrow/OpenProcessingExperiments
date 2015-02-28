
PFont keys;

float score = 0;

//radius of 3pt zone
int r3ptline = 650;

//location of 3pt zone
float ThreePointX;
float ThreePointY;

//radius of the ball
int r = 20;

//location of the left ball

//Left 1st
float ballleftx;
float balllefty;

//Left 2nd
float ballleftx2;
float balllefty2;

//Left 3rd
float ballleftx3;
float balllefty3;

//Left 4th
float ballleftx4;
float balllefty4;

//Left 5th
float ballleftx5;
float balllefty5;

//location of the right ball

//Right 1st
float ballrightx;
float ballrighty;

//Right 2nd
float ballrightx2;
float ballrighty2;

//Right 3rd
float ballrightx3;
float ballrighty3;

//Right 4th
float ballrightx4;
float ballrighty4;

//Right 5th
float ballrightx5;
float ballrighty5;

//ball Right 45 

//Right 45 1st
float ballright45x ;
float ballright45y;

//Right 45 2nd
float ballright45x2;
float ballright45y2;

//Right 45 3rd
float ballright45x3;
float ballright45y3;

//Right 45 4th
float ballright45x4;
float ballright45y4;

//Right 45 5th
float ballright45x5;
float ballright45y5;

//Ball left 45

//Left 45 1st
float ballleft45x;
float ballleft45y;

//left 45 2nd
float ballleft45x2;
float ballleft45y2;

//left 45 3nd
float ballleft45x3;
float ballleft45y3;

//left 45 4th
float ballleft45x4;
float ballleft45y4;

//left 45 5th
float ballleft45x5;
float ballleft45y5;

//ball mid

//mid 1
float ballmidx;
float ballmidy;

//mid 2
float ballmidx2;
float ballmidy2;

//mid 3
float ballmidx3;
float ballmidy3;

//mid 4
float ballmidx4;
float ballmidy4;

//mid 5
float ballmidx5;
float ballmidy5;


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


float ballmoveX = 143;
float ballmoveY = 30;



void setup() {
 size(1000, 500);
 background(255);
 
 //left ball 
 ballleftx= 143;
 balllefty= 30;
 ballleftx2= 110;
 balllefty2= 30;
 ballleftx3= 77;
 balllefty3= 30;
 ballleftx4= 44;
 balllefty4= 30;
 ballleftx5= 11;
 balllefty5= 30;
 
 //right ball
 ballrightx = 850;
 ballrighty = 30;
 ballrightx2= 883;
 ballrighty2= 30;
 ballrightx3= 916;
 ballrighty3= 30;
 ballrightx4= 949;
 ballrighty4= 30;
 ballrightx5= 982;
 ballrighty5= 30;
 
 //right 45 ball
 ballright45x = 955 * radians(45);
 ballright45y = 310 * radians(45);
 ballright45x2 = 987 * radians(45); //+32 //+27
 ballright45y2 = 337 * radians(45);
 ballright45x3 = 1019 * radians(45);
 ballright45y3 = 364 * radians(45);
 ballright45x4 = 1051 * radians(45);
 ballright45y4 = 391 * radians(45);
 ballright45x5 = 1083 * radians(45);
 ballright45y5 = 418 * radians(45);
 
 //Left 45 ball
 ballleft45x= 256;
 ballleft45y= 249;
 ballleft45x2= 231; // -25 +21
 ballleft45y2= 270;
 ballleft45x3= 206;
 ballleft45y3= 291;
 ballleft45x4= 181;
 ballleft45y4= 312;
 ballleft45x5= 156;
 ballleft45y5= 333;
 
 //mid ball
 ballmidx= 500;
 ballmidy= 345;
 ballmidx2= 500;
 ballmidy2= 376;
 ballmidx3= 500;
 ballmidy3= 407;
 ballmidx4= 500;
 ballmidy4= 438;
 ballmidx5= 500;
 ballmidy5= 469;
 
 
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
  
  
    
  
    //Timer
  background(255);
  fill(255,0,0);
  int s = millis(); 
  text("Timer: "+ "00" +":" + s, 28, 471);
  fill(0);
  text("Score: "+ score,36,398);
  
  
  
  //draw 3pt zone
  fill(255);
  stroke(0);
  ellipse(ThreePointX,ThreePointY,r3ptline,r3ptline);
  strokeWeight(5);
  
  //draw left basketball
  
  fill(#FF6600);
  stroke(0);
  ellipse(ballleftx,balllefty,r,r);
  ellipse(ballleftx2,balllefty2,r,r);
  ellipse(ballleftx3,balllefty3,r,r); 
  ellipse(ballleftx4,balllefty4,r,r);
  fill(0,0,255);
  ellipse(ballleftx5,balllefty5,r,r);
   
  
  //draw right basketball
  fill(#FF6600);
  stroke(0);
  ellipse(ballrightx,ballrighty,r,r);
  ellipse(ballrightx2,ballrighty2,r,r);
  ellipse(ballrightx3,ballrighty3,r,r);
  ellipse(ballrightx4,ballrighty4,r,r);
  fill(0,0,255);
  ellipse(ballrightx5,ballrighty5,r,r);
      
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

   //draw ball right 45
  fill(#FF6600);
  stroke(0);
  ellipse(ballright45x ,ballright45y,r,r);
  ellipse(ballright45x2 ,ballright45y2,r,r);
  ellipse(ballright45x3 ,ballright45y3,r,r);
  ellipse(ballright45x4 ,ballright45y4,r,r);
  fill(0,0,255);
  ellipse(ballright45x5 ,ballright45y5,r,r);
  
  //draw ball left 45
  
  fill(#FF6600);
  stroke(0);
  ellipse(ballleft45x ,ballleft45y,r,r);
  ellipse(ballleft45x2 ,ballleft45y2,r,r);
  ellipse(ballleft45x3 ,ballleft45y3,r,r);
  ellipse(ballleft45x4 ,ballleft45y4,r,r);
  fill(0,0,255);
  ellipse(ballleft45x5 ,ballleft45y5,r,r);
  
  //draw ball mid 
  fill(#FF6600);
  stroke(0);
  ellipse(ballmidx ,ballmidy,r,r);
  ellipse(ballmidx2 ,ballmidy2,r,r);
  ellipse(ballmidx3 ,ballmidy3,r,r);
  ellipse(ballmidx4 ,ballmidy4,r,r);
  fill(0,0,255);
  ellipse(ballmidx5 ,ballmidy5,r,r);
  
   //G
 fill(255);
 stroke(0);
 rect(648, 404, 70, 70, 7);
 fill(0);
 text("G", 679, 444);
 
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
    ellipse(ballmoveX,ballmoveY,r,r);
    ballmoveX = ballmoveX + speedx;
    if(ballmoveX > width/2){
      speedx = 0;
      
    fill(204,204,204,204);
    stroke(204,204,204,204);  
    ellipse(ballleftx,balllefty,r,r);  
    
    score++;

    }  

  }else if(key == 'g' || key == 'G'){
      fill(255,0,0);
      rect(648, 404, 70, 70, 7);
    
      fill(255,0,0);
      stroke(255,0,0);
      ellipse(ballleftx,balllefty,r,r);
  }

}


