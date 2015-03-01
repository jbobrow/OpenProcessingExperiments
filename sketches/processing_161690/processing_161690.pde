
/*****************************************
 House Animation
 * Heather Wade
 * CSC 103 - Creative Computing - Fall 2014
 * Submitted: 9/17/14
 * 
 * This scene is a house on a hill. The sun rises as the darkness fades out, and then as the sun 
 sets, the darkness fades in. There are also clouds in the sky that float around.
 *
 ***********************************************/


// colors from http://www.tayloredmktg.com/rgb/

int houseWidth = 250;
int houseHeight = 175;
int roofHeight = 75;
int xA = 125;
int yA = 250;
int xB = xA + houseWidth;
int yB = 250;
int xC = xA + houseWidth/2;
int yC = 175;

float sunAngle = 180;
float orbitRadius = 400;

float cloud1X = 300;
float cloud1Y = 110;
float cloud2X = 350;
float cloud2Y = 80;

float darkness= 255;

/*    //don't need this?
 float speedX= 1.0;
 float speedY = .5;
 int directionX = 1;
 int directionY = -1;
 */

void setup() {
  size(500, 500);
}

void draw() {

  background(135, 206, 250);  // sky blue

  // BaseRectangle
  noStroke();
  fill(255, 218, 185);  // peach
  rect(xA, yA, houseWidth, houseHeight);

  //door
  stroke(0);
  fill(222, 184, 135);  // burlywood
  rect(xA + houseWidth/2, yA + houseHeight/2, 50, houseHeight/2 + 20);

  //Roof
  noStroke();
  fill(139, 69, 19);   // saddle brown
  triangle(xA, yA, xB, yB, xC, yC);

  //grass
  noStroke();
  fill(34, 139, 34);   // forest green
  ellipseMode(CENTER);
  ellipse(width / 2, 500, width*2, 200);


  drawSun();
  drawCloud(cloud1X, cloud1Y);
  drawCloud(30, 100);
  drawCloud2(cloud2X, cloud2Y);

  //lighting
  fill(0, darkness);
  rect(0, 0, width, height);


  update();
  
}

void drawSun() {

  float sunX = width/2 + orbitRadius * cos( radians(sunAngle) );
  float sunY = height + orbitRadius * sin( radians(sunAngle) );

  //sun
  fill(250, 241, 68);
  ellipse(sunX, sunY, 100, 100);
} 


void drawCloud (float x, float y) {
  //clouds
  noStroke();
  fill(225);
  ellipse(x, y, 300, 80);
  ellipse(x+100, y-5, 130, 120);
  ellipse(x-5, y+15, 200, 80);
  ellipse(x, y-50, 130, 120);
  ellipse(x-30, y-30, 40, 40);
}

void drawCloud2 (float x, float y) {
  //clouds
  noStroke();
  fill(225);
  ellipse(x, y, 300, 80);
  ellipse(x+150, y-10, 130, 120);
  ellipse(x+5, y+15, 200, 80);
  ellipse(x, y-40, 130, 120);
  ellipse(x-20, y-20, 40, 40);
}





void update() {
  sunAngle = sunAngle + .2; 
  if (sunAngle >= 360) sunAngle = sunAngle - 360;
  //println(sunAngle);

  if (sunAngle >= 0 && sunAngle <= 180) {
    darkness = 255;
  } else if (sunAngle >= 180 && sunAngle <= 270) {
    darkness = map(sunAngle, 180, 270, 255, 0);
  } else {
    darkness = map(sunAngle, 270, 360, 0, 255);
  }

  cloud1X = cloud1X - 1;
  if (cloud1X <= -200) { 
    cloud1X= cloud1X + 2*width; 
    cloud1Y= random( 50, 200);
  }
  cloud2X = cloud2X + 1;
  if (cloud2X >= 400) {
    cloud2X = cloud2X - 1.5*width;
    cloud2Y = random(20, 220);
  }
  /*
  if (gettingLighter) {
   darkness = darkness - speed;
   if (darkness == 0) {
   gettingLighter = false;
   }
   } else {
   darkness= darkness + speed;
   if (darkness ==255) {
   gettingLighter = true;
   }
   }
   */
}



