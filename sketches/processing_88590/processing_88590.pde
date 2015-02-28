
//This program was written by Christian Supriano
//It draws a spaceship navigating through asteroids
// Move the ship up with 'w' and down with 's'
//Click the asteroids to shoot them



void setup() {
  size(500, 500);
}

//setting up variables
float shipX = -150;
float shipY = 0;
float asteroidX = 250;
float asteroidY = 0;
float asteroidSize = 50;
float color1 = 150;
float color2 = 150;
float color3 = 150;
float xPos = 250;
float yPos = -150;
float angle = 0;
float earthX = -150;
float earthY = -150;
float speed = 1;

void draw() {

  background(0);

  translate(250, 250);
  
  

  //drawing the earth
  noStroke();
  fill(0, 0, 255);
  ellipse(earthX, earthY, 150, 150);
  fill(0, 255, 0);
  triangle(earthX-40, earthY-50, earthX+20, earthY-40, earthX, earthY);
  triangle(earthX, earthY, earthX-20, earthY+35, earthX+30, earthY+30);
  triangle(earthX-20, earthY+35, earthX+30, earthY+30, earthX, earthY+70);



  //setting controls
  if (keyPressed) {
    if (key=='w') {
      shipY = shipY -2;
    }
  }

  if (keyPressed) {
    if (key=='s') {
      shipY=shipY+2;
    }
  }


  //resetting asteroid number 1
  if (asteroidX<-250) {
    asteroidX=250;
    color1=150;
    speed = speed*(1.1);
  }

  //resetting asteroid number 2
  if (xPos<-250) {
    xPos=250;
    color2=150;
  }

  //drawing asteroiid number 1
  noStroke();
  fill(color1);
  if (color1==0) {
    noFill();
  } 
  ellipse(asteroidX, asteroidY, asteroidSize, asteroidSize);
  asteroidX = asteroidX -speed;

  //drawing asteroid number 2
  if (frameCount>250) {
    fill(color2);
    if (color2==0) {
      noFill();
    }
    ellipse(xPos, yPos, asteroidSize/2, asteroidSize/2);
    xPos = xPos - 2*speed;
    yPos = xPos -.5*speed;
  }


  //drawing the spaceship
  rectMode(CENTER);
  fill(200, 0, 0);
  strokeWeight(1);
  stroke(0);
  rect(shipX, shipY, 100, 35);
  triangle(shipX+100, shipY, shipX+50, shipY+18, shipX+50, shipY-18);
  triangle(shipX-50, shipY-17.5, shipX-50, shipY-35, shipX-20, shipY-17.5);
  triangle(shipX-50, shipY+17.5, shipX-50, shipY+35, shipX-20, shipY+17.5);
  shipY = constrain(shipY, -215, 215);

  //drawing the windows
  for (float windowX = shipX - 40;windowX<=shipX+40;windowX+=20) {
    fill(255);
    ellipse(windowX, shipY-5, 10, 10);
  }




  //destroying the first asteroid
  if (mousePressed) {
    if (dist(mouseX, mouseY, asteroidX+250, asteroidY+250)<=asteroidSize/2) {
      color1 = 0;
      strokeWeight(2);
      stroke(0, 255, 0);
      line(shipX+100, shipY, asteroidX, asteroidY);
    }
  }

  //destroying the second asteroid
  if (mousePressed) {
    if (dist(mouseX, mouseY, xPos+250, yPos+250)<=asteroidSize/4) {
      color2=0;
      strokeWeight(2);
      stroke(0, 255, 0);
      line(shipX+100, shipY, xPos, yPos);
    }
  }
}
  


