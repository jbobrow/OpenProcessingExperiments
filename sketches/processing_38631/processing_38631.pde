
// CREATURE VARIABLES


float mainBodyX = 0;
float mainBodyY = 75;
// int   mainBodyColour = 0;
float mainBodyW = 100;
float mainBodyH = 140;
float bodyStripeW = 100;
float bodyStripeH = 5; 
float rollerBallW = 25;
float rollerBallH = 25;
int   neckColour = 162;
float neckW = 25;
float neckH = 75; 
float collarW = 25;
float collarH = 5; 
int   headColour = 162;
float headW = 35;
float headH = 35;
float eyeColour = 255;
float eyeColour1 = (0); // for attempt at 2 eye colours to bounce colours between
float eyeColour2 = (255);
float eyeW = 10;
float eyeH = 10;
int   pupilColour = 162;
float pupilW = 5;
float pupilH = 5;
int   mouthColour = 200;
float mouthW = 20;
float mouthH = 20; 

float eyeColour1dir = 0.1; // Increments for eye colour (attempt to cycle eye colour, see below)
float eyeColour2dir = -0.1;

float speed = 0; // speed of Creature
float gravity = 0.1; // gravity variable

int ballX = 600; // Ball
int ballSpeed = 5;
int ballRadius = 15;

void setup() {
  size(600,400); 
  smooth();
  frameRate(30); 
}

void draw() {
  background(200); 
  ellipseMode(RADIUS);
  
//BALL (one ball bouncing back and forth)

ballX = ballX + ballSpeed; // add the current speed to ball x position

if ((ballX > width) || (ballX < 0)) {
  ballSpeed = ballSpeed * -1; // if ball reaches either edge, reverse direction
  ballRadius = 22;
  
}  
  fill(234,80,80); // Display ball
  ellipse(ballX,50,ballRadius,ballRadius);
  ballRadius = constrain(ballRadius-1,15,22); 

//CREATURE

// Gravity 
mainBodyY = mainBodyY + speed;  // add speed to creature

speed = speed + gravity; // add gravity to speed

if (mainBodyY > height -125) { // if creature reaches the bottom, reverse speed
  speed = speed * -0.95;
}

  // BODY 
  noStroke();
  fill(mainBodyX,162,mainBodyY); // roller ball fill det. by position
  ellipse(mainBodyX+50,mainBodyY+140,rollerBallW,rollerBallH); // roller ball

// change body colour on mouse rollover
  if (mouseX > mainBodyX && mouseX < mainBodyX + mainBodyW && mouseY > mainBodyY && mouseY < mainBodyY + mainBodyH) {
    fill(0);
  } else {
    fill(240); 
  }
  rect(mainBodyX,mainBodyY,mainBodyW,mainBodyH); // main body rect
  fill(162); // fill gray
  rect(mainBodyX,mainBodyY+100,bodyStripeW,bodyStripeH); // body stripe

// NECK
   noStroke();
   fill(neckColour);
   rect(mainBodyX+50,mainBodyY-50,neckW,neckH); // main neck
   fill(mainBodyX,162,mainBodyY); // collar fill determined by position
   rect(mainBodyX+50,mainBodyY+30,collarW,collarH); // neck collar
   strokeWeight(2);
   stroke(0); // set stroke for neck lines to black
   line(mainBodyX+75,mainBodyY-45,mainBodyX+125,mainBodyY-45); // top line
   line(mainBodyX+75,mainBodyY-40,mainBodyX+125,mainBodyY-40); // middle line
   line(mainBodyX+75,mainBodyY-25,mainBodyX+125,mainBodyY-25); // bottom line

    
// HEAD

   noStroke();
   fill(headColour);
   ellipse(mainBodyX+155,mainBodyY-35,headW,headH); // head

/* This didn't work: abandonded for now

// Adjust eye colour cycle from white to red

   eyeColour1 = eyeColour1 + eyeColour1dir;
   eyeColour2 = eyeColour2 + eyeColour2dir;

// Reverse direction of eye colour change
  
  if (eyeColour1 < 0 || eyeColour1 > 255) {
    eyeColour1dir *= -1;
  }
  
    if (eyeColour2 < 0 || eyeColour2 > 255) {
    eyeColour2dir *= -1;
  }

*/
   fill(eyeColour);
   ellipse(mainBodyX+125,mainBodyY-35,eyeW,eyeH); // eye 
   fill(pupilColour);
   ellipse(mainBodyX+125,mainBodyY-35,pupilW,pupilH); // pupil 
   fill(mouthColour);
   ellipse(mainBodyX+185,mainBodyY-45,mouthW,mouthH); // mouth 

// Make circles draw if mousePressed
   if (mousePressed) {
     for (int x = 300; x < width; x+=20) {
        stroke(0);
        fill(234,80,80);
        ellipse(x,385,15,15);
    }
}  

// KEY PRESS INCREASES MOUTH SIZE // ? why is there a limit on how large mouth opens?
  if (keyPressed) {
     if (key == 'm' || key == 'M') {
       mouthH = mouthH + 3;
     }
} 


}


