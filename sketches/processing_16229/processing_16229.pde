
//Name: Andy Hernandez
//Desma 28 Interactivity 
//Final Project Game: AQUIRE. 



// circle is controlled by the mouse
float CX; // set this later in draw
float CY; 
float CR = 30.0;

//line1
float X1 = 0;
float Y1 = 30;
float speed= 10;
int direction=1;
float rectWidth = 100.0;
float rectHeight = 40.0;
//line2
float X12 = 0;
float Y12 = 0;
float speed2= 10;
int direction2=1;
float rectWidth2 = 100.0;
float rectHeight2 =40.0;




void setup()
{
  size (640,480);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
}

void draw()
{
  background(100);
  //line1
  fill(255);
  rect(X1, Y1, rectWidth, rectHeight);
  Y1+= speed*direction;

  if((Y1>height) ||(Y1< 0) )
  {
    direction=-direction;

    X1+=120;
    if(X1>width) {
      X1=0;
    }
  }



  //line2

  rect(X12, Y12, rectWidth, rectHeight);
  X12+= speed*direction;

  if((X12>height) ||(X12< 0) )
  {
    direction=-direction;

    Y12+=Y12+50;
    if(Y12>height) {
      Y12=0;
    }
  }




  // move to the mouse coordinates 
  CX = mouseX;
  CY = mouseY;


  boolean collisionDetected = isCollidingCircleRectangle(CX, CY,
  CR, X1, Y1, rectWidth, rectHeight);

  if (collisionDetected == true) {
    fill(255,0,0); // colored red on collision
  X12=width/2;
    X1=width/2;
//    Y12=height/2;
//    Y1=height/2-30;
  }
  else {
    fill(255);  
    // white for no collision
  }




  boolean collisionDetected2 = isCollidingCircleRectangle(CX, CY,
  CR, X12, Y12, rectWidth2, rectWidth2);
  // set color for circle
  if (collisionDetected2 == true) {
    fill(255,0,0); // colored red on collision
  }

  else {
    fill(255);     // white for no collision
  }

  if(collisionDetected2==true && collisionDetected==true)
  {
    X12=width/2;
    X1=width/2;
    Y12=height/2;
    Y1=height/2-30;
  }



  float a= random(10,20);
  ellipse(CX-20, CY-20, CR*2.0, CR*2.0);
 
  
}
// code adapted from:
//   http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection && J.CECIL's "circle Box Collide"


boolean isCollidingCircleRectangle(
float circleX, 
float circleY, 
float radius,
float rectangleX,
float rectangleY,
float rectangleWidth,
float rectangleHeight)
{
  float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
  float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

  if (circleDistanceX > (rectangleWidth/2 + radius)) { 
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) { 
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) { 
    return true;
  } 
  if (circleDistanceY <= (rectangleHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
    pow(circleDistanceY - rectangleHeight/2, 2);

  return (cornerDistance_sq <= pow(radius,2));
}


