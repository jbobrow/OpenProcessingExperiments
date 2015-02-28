
//need to edit screens



int page = 1;
PImage card1;
PImage card2;
PImage card3;
PImage card4;
PFont font;
int time;



float dir=1;
float maxValue = 9; 
float minValue = 1; 
float value = 1; 
float incr = 1;



float shipLocX;
float shipLocY; 
float rectWidth = 6.0;
float rectHeight = 6.0;


void setup() {
  size(480, 320);
  ellipseMode(CENTER);
  rectMode(CENTER);

  font = loadFont("Rockwell-48.vlw");
  card1 = loadImage("card1.png");
  card2 = loadImage("card2.png");
  card3 = loadImage("card3.png");
    card4 = loadImage("card4.png");

time= millis();
}

void draw() {
  background(0);


  if (page ==1) {
    cursor();
    image(card1, 0, 0);
    fill(255);
    textFont(font, 24);
    text("Click to start...", 300, 310);
    int left = 300;
    int right = 430;
    int top = 280;
    int bottom = 4320;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
        page = 2;
      }
    }
  }

  if (page ==3) {
    cursor();
    image(card2, 0, 0);
    fill(255);
    textFont(font, 24);
    text ("You crashed into the sun!", 170, 50);
    text("Click to retry.", 30, 310);
    int left = 0;
    int right = 185;
    int top = 280;
    int bottom = 320;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
        page = 2;
      }
    }
  }

  if (page ==4) {
    background(0);
    cursor();
    image(card3, -30, 30);
    fill(255);
    textFont(font, 24);
    text ("You landed safely on the moon!", 50, 50);
    text("Click to restart.", 300, 300);
    int left = 300;
    int right = 430;
    int top = 280;
    int bottom = 4320;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
        page = 2;
      }
    }
  }

  if (page ==5) {
    cursor();
    image(card4, 0, 0);
    fill(255);
    textFont(font, 24);
    text ("You are lost in space!", 50, 50);
    text("Click to retry.", 300, 310);
    int left = 300;
    int right = 430;
    int top = 280;
    int bottom = 4320;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
        page = 2;
      }
    }
  }


  if(page == 2) {

background(0);
float m = (millis()-time);
    noCursor();


    if ((value > (maxValue)) || (value < (minValue))) {
      dir = -dir;
    }
    value += incr * dir;






    //MOON
    float sunLocationX = 280 + (value*(mouseX/7));
    float sunLocationY = 100.0;
    float sunRadius = 10+(m/100);


    //SUN
    float moonX = (value*(mouseX/7));
    float moonY = 100.0;
    float moonRadius = 10+(m/100);


    shipLocX = mouseX;
    shipLocY = mouseY;




    //MOON
    noStroke();
    fill(230);
    ellipse(sunLocationX, sunLocationY, sunRadius, sunRadius);

    //SUN
    noStroke();
    fill(255, 235, 0);
    ellipse(moonX, moonY, moonRadius, moonRadius);



    //  
    boolean collisionDetectedAgain = isCollidingCircleRectangle(moonX, moonY,
    moonRadius/2, shipLocX-4, shipLocY-4, rectWidth, rectHeight);


    boolean collisionDetected = isCollidingCircleRectangle(sunLocationX, sunLocationY,
    sunRadius/2, shipLocX-4, shipLocY-4, rectWidth, rectHeight);



    if (collisionDetectedAgain == true) {
      //SUN COLLISION
      stroke(255, 0,0);
      fill (255, 0, 0);
      page = 3;
    }
    //MOON COLLISION
    else if (collisionDetected == true) {
      stroke(0,255,0);
      fill(0, 255, 0);
      page = 4;
    }

    else if (mouseY < 15) {
      stroke(0, 0, 255);
      fill(0, 0, 255);
      page = 5;
    }
    else {
      stroke(130); 
      fill(130);
    }


    strokeWeight(5);
    line (shipLocX-10, shipLocY+30,  shipLocX, shipLocY);
    line  (shipLocX+10, shipLocY+30, shipLocX, shipLocY);


    noStroke();
    rect(shipLocX, shipLocY, rectWidth, rectHeight);
  }
}

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

void mousePressed()
{
  time = millis();
}


