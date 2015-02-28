
/*This program was written by Christian Supriano
 It draws a spaceship navigating through asteroids
 Move the ship up with 'w' and down with 's'
 Click the asteroids to shoot them
 Try not to get hit! The game does get nearly impossible 
 as time goes on unfortunately
 */

void setup() {
  size(500, 500);
  smooth();
  cursor(CROSS);
}

//setting up variables
float shipX = -150;
float shipY = 0;
float asteroidX = 250;
float asteroidY = 0;
float asteroidSize = 50;
float color1 = 130;
float color2 = 150;
float color3 = 160;
float xPos = 250;
float yPos = 150;
float angle = 0;
float earthX = -150;
float earthY = -150;
float speed = 1;
float meteorX = 250;
float meteorY = -150;
float h = 250;
float starX = 0;
float starY = 0;

void draw() {

  background(0);

  translate(250, 250);


  //drawing some stars
  noStroke();
  fill(255);
  ellipse(starX, starY, 4, 4);
  ellipse(starX+30, starY-40, 4, 4);
  ellipse(starX-60, starY+20, 4, 4);
  ellipse(starX+150, starY+80, 3, 3);
  ellipse(starX-200, starY+120, 4, 4);
  ellipse(starX+200, starY-170, 3, 3);
  ellipse(starX+10, starY-200, 4, 4);
  ellipse(starX-15, starY+200, 3, 3);
  ellipse(starX+230, starY+230, 4, 4);

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
    color1=130;
    speed = speed*(1.1);
  }

  //resetting asteroid number 2
  if (xPos<-250) {
    xPos=250;
    color2=150;
  }

  if (yPos<-250) {
    yPos=250;
  }

  //resetting meteor
  if (meteorX<-250) {
    meteorX=250;
    color3=160;
  }
  if (meteorY>250) {
    meteorY=-250;
  }

  //drawing asteroid number 1
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
    yPos = yPos -.5*speed;
  }

  //drawing meteorite
  if (frameCount>500) {
    fill(color3);
    if (color3==0) {
      noFill();
    }
    ellipse(meteorX, meteorY, asteroidSize*.75, asteroidSize*.75);
    meteorX=meteorX-1.25*speed;
    meteorY = meteorY+.4*speed;
  }

  //drawing the spaceship
  rectMode(CENTER);
  fill(200, 0, 0);
  strokeWeight(1);
  stroke(0);
  rect(shipX, shipY, 100, 35);
  triangle(shipX+100, shipY, shipX+50, shipY+18, shipX+50, shipY-18);
  triangle(shipX-50, shipY-17.4, shipX-50, shipY-35, shipX-20, shipY-17.4);
  triangle(shipX-50, shipY+17.4, shipX-50, shipY+35, shipX-20, shipY+17.4);

  fill(230, 230, 0);
  triangle(shipX-50, shipY-16, shipX-80, shipY, shipX-50, shipY+16);

  fill(0, 0, 200);
  triangle(shipX-50, shipY-9, shipX-70, shipY, shipX-50, shipY+9); 
  shipY = constrain(shipY, -215, 215);

  //drawing the windows
  for (float windowX = shipX - 40;windowX<=shipX+40;windowX+=20) {
    fill(255);
    ellipse(windowX, shipY-5, 10, 10);
  }




  //destroying the first asteroid
  if (color1!=0) {
    if (mousePressed) {
      if (dist(mouseX, mouseY, asteroidX+250, asteroidY+250)<=asteroidSize/2) {
        color1 = 0;
        strokeWeight(2);
        stroke(0, 255, 0);
        line(shipX+100, shipY, asteroidX, asteroidY);
      }
    }
  }

  //destroying the second asteroid
  if (color2!=0) {
    if (mousePressed) {
      if (dist(mouseX, mouseY, xPos+250, yPos+250)<=asteroidSize/4) {
        color2=0;
        strokeWeight(2);
        stroke(0, 255, 0);
        line(shipX+100, shipY, xPos, yPos);
      }
    }
  }

  //destroying the meteor
  if (color3!=0) {
    if (mousePressed) {
      if (dist(mouseX, mouseY, meteorX+250, meteorY+250)<=asteroidSize*.75) {
        color3=0;
        strokeWeight(2);
        stroke(0, 255, 0);
        line(shipX+100, shipY, meteorX, meteorY);
      }
    }
  }

  //Damaging the spaceship with asteroid1
  if (color1!=0) {
    if (dist(shipX, shipY, asteroidX, asteroidY)<asteroidSize||dist(shipX+70, shipY, asteroidX, asteroidY)<asteroidSize) {
      fill(255, 0, 0);
      rect(0, 0, width, height);
      h=h-.5;
    }
  }


  //damaging the spaceship with asteroid2
  if (color2!=0) {
    if (dist(shipX, shipY, xPos, yPos)<asteroidSize/2||dist(shipX+80, shipY, xPos, yPos)<asteroidSize/2) {
      fill(255, 0, 0);
      rect(0, 0, width, height);
      h=h-.5;
    }
  }


  //damaging the spaceship with meteor
  if (color3!=0) {
    if (dist(shipX, shipY, meteorX, meteorY)<asteroidSize*.75||dist(shipX+75, shipY, meteorX, meteorY)<asteroidSize*.75) {
      fill(255, 0, 0);
      rect(0, 0, width, height);
      h=h-.5;
    }
  }


  //drawing the healthbar
  for (float healthBar=150;healthBar<h;healthBar+=10) {
    stroke(0);
    fill(255, 0, 0);
    rect(healthBar, -240, 10, 20);
  }

  //ending the game
  if (h<150) {
    noLoop();
  }
}


