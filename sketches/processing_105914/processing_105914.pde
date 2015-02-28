
//bouncing balls

float xPos1 = 0; 
float yPos1 = 0;
float xPos2 = 0;
float yPos2 = 0;

float xSpeed1 = 10;
float ySpeed1 = 10.02837;
float xSpeed2 = 7;
float ySpeed2 = 5;

color ballColor1 = color(100, 255, 0);
color ballColor2 = color(0, 250, 250);

float ballsize1 = 50;
float ballsize2 = 100;


int screenWidth = 900;
int screenHeight = 800;


void setup() {

  size(screenWidth, screenHeight);

  xPos1 = random(width);
  yPos1 = random(ballsize1, height - ballsize1);
  
  xPos2 = random(width);
  yPos2 = random(ballsize2, height - ballsize2);
}


void draw() {

  background(255);
  
  fill(ballColor1);
  smooth();
  ellipse(xPos1, yPos1, ballsize1, ballsize1);
  
  fill(ballColor2);
  smooth();
  ellipse(xPos2, yPos2, ballsize2, ballsize2);

  if (xPos1 > (width - ballsize1/2)|| xPos1 <= ballsize1/2) {
    xSpeed1 = xSpeed1 * -1;
  }

  if (yPos1 > (height - ballsize1/2)|| yPos1 <= ballsize1/2) {
    ySpeed1 = ySpeed1 * -1;
  }

  xPos1 = xPos1 + xSpeed1;
  yPos1 = yPos1 + ySpeed1;
  
   if (xPos2 > (width - ballsize2/2)|| xPos2 <= ballsize2/2) {
    xSpeed2 = xSpeed2 * -1;
  }

  if (yPos2 > (height - ballsize2/2)|| yPos2 <= ballsize2/2) {
    ySpeed2 = ySpeed2 * -1;
  }

  xPos2 = xPos2 + xSpeed2;
  yPos2 = yPos2 + ySpeed2;


if(dist(xPos1, yPos1, xPos2, yPos2)<(ballsize1/2+ballsize2/2)){
    xSpeed1 = xSpeed1*-1;
    ySpeed1 = ySpeed1*-1;
    xSpeed2 = xSpeed2*-1;
    ySpeed2 = ySpeed2*-1;
  }

}
  
 
  
  

