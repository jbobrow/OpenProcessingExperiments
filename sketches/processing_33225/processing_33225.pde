
/*
  nate rudolph
 aug 6, 2011
 bootcamp - code
 */

PImage woodFloor;
PImage ball;
PImage ball2;
PImage racquet;
// PImage play;

/* v1 = ball1  v2 = ball2  v3 = racquet  */
PVector v1;
PVector v2;
PVector v3;

float xPos = random(475);
float yPos = random(200);
int ballRadius = 23;
boolean isGoingRight = true;
boolean isGoingDown = true;

float xPos2 = random(475);
float yPos2 = random(200);
int ballRadius2 = 23;
boolean isHit = false;
boolean isHit2 = false;
boolean isGoingRight2 = true;
boolean isGoingDown2 = true;





int racquetWidth = mouseX;

void setup() {
//  frameRate(2);
  size(500, 380);
  background(#FFFFFF);
  //  play = loadImage("img/play.png");
  ball = loadImage("img/ball.png");
  ball2 = loadImage("img/ball.png");
  woodFloor = loadImage("img/woodFloor.jpg");
  racquet = loadImage("img/racquet.png");
v1 = new PVector(xPos, yPos);
v2 = new PVector(xPos2, yPos2);
v3 = new PVector(mouseX, 360);
}


void draw() {

  smooth();
  background(#FFFFFF);
  imageMode(CENTER);
  image(woodFloor, 0, 0);


  imageMode(CENTER);
    image(racquet, mouseX, 360);
  image(ball, xPos, yPos);
  image(ball2, xPos2, yPos2);


  //  imageMode(CENTER);
  // image(play,width/2,height/2); 


  //  xPos+=5;
  //  yPos+=5;

  /* Y DIRECTION */
  if (isGoingDown) {
    yPos+=3;
  }
  else {
    yPos-=3;
  }
  /* End of Y DIRECTION */
  
  
   /* Y2 DIRECTION */
  if (isGoingDown2) {
    yPos2+=3;
  }
  else {
    yPos2-=3;
  }
  /* End of Y2 DIRECTION */


  /* Y DECISION */
  
   /* Comment these lines to make the balls fall through the bottom once racquet vector is established */
  if (yPos + ballRadius>=height) {
    isGoingDown=false;
  }

  if (yPos - ballRadius <= 0) {
    isGoingDown=true;
  } 


  /* end of Y DECISION */
  


 /* Y2 DECISION */
 
 /* Commenting this out to make it fall off the bottom unless racquet is there */
//  if (yPos2 + ballRadius>=height) {
//    isGoingDown2=false;
//  }


  if (yPos2 - ballRadius <= 0) {
    isGoingDown2=true;
  } 


  /* end of Y2 DECISION */


  /* X DIRECTION */
  if (isGoingRight) {
    xPos+=6;
  }
  else {
    xPos-=6;
  }
  /* End of X DIRECTION */


  /* X DECISION */
  if (xPos + ballRadius>=width) {
    isGoingRight=false;
  }

  if (xPos - ballRadius <= 0) {
    isGoingRight=true;
  } 
  /* End of X DECISION */

 /* X2 DIRECTION */
  if (isGoingRight2) {
    xPos2+=3;
  }
  else {
    xPos2-=3;
  }
  /* End of X DIRECTION */


  /* X2 DECISION */
  if (xPos2 + ballRadius2>=width) {
    isGoingRight2=false;
  }

  if (xPos2 - ballRadius2 <= 0) {
    isGoingRight2=true;
  } 
  /* End of X2 DECISION */
  
 
  /*  Collision Physics  */




  /*  Racquet Physics  */


/* An early attempt at getting the racquet to actually make them bounce*/
//  if (yPos + ballRadius >= height) {
//    
//
//    if (mouseX >= xPos){
//     isGoingDown=false; }
//  }

/*  End of Paddle Physics  */



  //    
  //    if(isGoingDown){
  //    yPos+=3;}
  //    else{yPos-=3;}
  //    
  //    
  //    if(yPos + ballRadius>= height){
  //      isGoingDown=false;}
  //      
  //    
  //    //if (yPos + ballRadius
  //    
  //    
  //    
  //    if(xPos+ballRadius>=width) {
  //     xPos=xPos/(-1); 
  //    }
}


