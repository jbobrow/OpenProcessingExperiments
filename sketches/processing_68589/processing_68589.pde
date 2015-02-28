
float pulseRadius = 200;
int collisionRadius = 15;
int X, Y;
int nX, nY;
int delay= 120;

int space = 10; // distance between each bubble 
int radiusB = 5; //radius of the backgroundbubbles

color black = color(0);
color cyan = color(255, 255, 0,50);
color cyan2 = color(200, 200, 0,25);
color yellow = color(255, 0, 255,30);
color pink = color(0, 255, 255,40);

color yellowLight = color(255, 255, 0,50);

int xball1 = 300;
int yball1 = 300;

int xball2 = 500;
int yball2 = 500;

int xball3 = 100;
int yball3 = 100;

float xspeed1 = -6;
float yspeed1 = 3;

float xspeed2 = 4;
float yspeed2 = 2;

float xspeed3 = 6;
float yspeed3 = -3;






void setup() {
  size(600, 600);
  noStroke(); //no strokes for the bubbles
  smooth();
  delay(250);
  frameRate( 1000 ); 
  X = width / 2;
  Y = width / 2;
  

  //xpos= 10; //vertical location of each bubble
  //ypos= 10; //horintal location of each bubble
}

void draw() {
 background (0,70); //canvas background color


  pulseRadius = pulseRadius + 5*sin( frameCount/4 ); //Using sin and framecount to make the radius smaller and bigger - remember the curve.

  // ANIMATION BALLS + DRAWING THEIR CURRENT POSITION

  



  //2nd ball - CYAN
  xball1-=xspeed1;
  yball1-=yspeed1;

  if (xball1 <= collisionRadius || xball1 >= width - collisionRadius) {
    xspeed1 *= -1;
  }
  if (yball1 <= collisionRadius || yball1 >= height - collisionRadius) {
    yspeed1 *= -1;
  }

  fill(cyan);
  ellipse(xball1, yball1, pulseRadius, pulseRadius ); //drawing pulsing cirkle - with stroke and blue fill
  fill(yellow);
  ellipse(xball1, yball1, pulseRadius-15, pulseRadius-15 );
  fill(cyan);
  ellipse(xball1, yball1, pulseRadius-65, pulseRadius-65 );


  // 3rd ball - YELLOW
  xball2-=xspeed2;
  yball2+=yspeed2;

  if (xball2 <= collisionRadius || xball2 >= width - collisionRadius) {
    xspeed2 *= -1;
  }
  if (yball2 <= collisionRadius || yball2 >= height - collisionRadius) {
    yspeed2 *= -1;
  }

  fill(yellow);
  ellipse(xball2, yball2, pulseRadius, pulseRadius ); //drawing pulsing cirkle - with stroke and blue fill
  fill(pink);
  ellipse(xball2, yball2, pulseRadius-20, pulseRadius-20 ); //drawing pulsing cirkle - with stroke and blue fill
  fill(yellow);
  ellipse(xball2, yball2, pulseRadius-100, pulseRadius-100 ); //drawing pulsing cirkle - with stroke and blue fill
  fill(yellow);
  ellipse(xball2, yball2, pulseRadius-200, pulseRadius-200 ); //drawing pulsing cirkle - with stroke and blue fill


  // 4rd ball   -  PINK
  xball3-=xspeed3;
  yball3+=yspeed3;

  if (xball3 <= collisionRadius || xball3 >= width - collisionRadius) {
    xspeed3 *= -1;
  }
  if (yball3 <= collisionRadius || yball3 >= height - collisionRadius) {
    yspeed3 *= -1;
  }

  fill(pink); 
  ellipse(xball3, yball3, pulseRadius, pulseRadius ); //drawing pulsing cirkle - with stroke and blue fill
  fill(yellow); 
  ellipse(xball3, yball3, pulseRadius-40, pulseRadius-40 ); //drawing pulsing cirkle - with stroke and blue fill
   fill(pink); 
  ellipse(xball3, yball3, pulseRadius-90, pulseRadius-90 ); //drawing pulsing cirkle - with stroke and blue fill

  //background(0,50);
  //the loop for the bubbles on the canvas
  for (int xpos = 10; xpos <= 600; xpos += space) {
    for (int ypos = 10; ypos <= 600; ypos += space) {
      //      fill(0); //using no fill the the many bubbles in the loop
      //      ellipse(xpos, ypos, radiusB, radiusB);
 
  //Now the pulsing mouse - we are taing that out of the forloop. 
  //Experiment - for ( int radius = 30; radius <=60; radius +=sin( frameCount / 4)) { 



  // LIGHT UP LIGHTS WITHIN RANGE OF PULSING BALLS-----------------------------------------------------------------------------   

  //we neeed the distance between the balls and the middle of the cirkle - the mouseX and mouseY.     
  if ( dist(xpos, ypos, xball1, yball1)  <= pulseRadius-80) { //putting this in an if statment
    fill(yellowLight);  //so when the distance between mouse and the cirkle are smaller than radius then put red fill in.
    ellipse(xpos, ypos, radiusB, radiusB);
  }//if(dist(xpos,ypos,mouseX,mouseY) >= radius);  {
  else if ( dist(xpos, ypos, xball2, yball2)  <= pulseRadius-80) { //putting this in an if statment
    fill(yellowLight);  //so when the distance between mouse and the cirkle are smaller than radius then put red fill in.
    ellipse(xpos, ypos, radiusB, radiusB);
  }
  else if ( dist(xpos, ypos, xball3, yball3)  <= pulseRadius-80) { //putting this in an if statment
    fill(yellowLight);  //so when the distance between mouse and the cirkle are smaller than radius then put red fill in.
    ellipse(xpos, ypos, radiusB, radiusB);
  }
  else {
    fill(0);  //when not - put black fill in, same as the background.
    ellipse(xpos, ypos, radiusB, radiusB);
   }
  }  
    }


  //1st ball - BLACK
  fill(black);
  ellipse( mouseX, mouseY, pulseRadius+10, pulseRadius+10); //drawing pulsing cirkle - with stroke and blue fill
}

void mouseMoved() {
  nX = mouseX;
  nY = mouseY;
}


