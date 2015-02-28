
/*
 Erica Zambrano, Creative Computing @ Parsons 
 "Rube Goldberg Machine" (causes and effects)
 
 */


boolean ballHasBeenKicked;

float ballX = 125; 
float ballY = 590;
float boyX = 100; 
float womanX = 1300;

float fragmentsXPos = 0;  
float fragmentsYPos = 0;
int fragmentsOpacity = 100;

int numberOfSmokePuffs = 250; 

float smokePuffInitial = 1370;
float smokePuffYPos = 490;
float smokePuffSize = 5;
float smokePuffIncrease = random (-5, 5);
float smokePuffMaxSize = 20;


//declaring a bunch of smokes
Smoke[] mySmoke = new Smoke[numberOfSmokePuffs];
Smoke[] mySmoke2 = new Smoke[numberOfSmokePuffs];
Smoke[] mySmoke3 = new Smoke[numberOfSmokePuffs];


float fireStandbyWSize = 2;
float fireStandbyHSize = 8;
float newFireXPos, newFireYPos, fireBurnWSize, fireBurnHSize;
float fireBurnWidth = 10;
float fireBurnHeight = 20;
float fireBurnDistance = 5;
float numberOfFirePerRow;


void setup() {
  size (1500, 700);
  textSize(16);
  textAlign(CENTER);
  smooth();
  //initializing the smokes
  for (int i = 0; i < numberOfSmokePuffs; i++) {
    mySmoke[i] = new Smoke();
  }
  for (int j = 0; j < numberOfSmokePuffs; j++) {
    mySmoke2[j] = new Smoke();
  }
  for (int k = 0; k < numberOfSmokePuffs; k++) {
    mySmoke3[k] = new Smoke();
  }

  ballHasBeenKicked = false;
  fill(0);
}



void draw() {
  //println (mouseX + ", " + mouseY);     // this is just to help me draw stuff
  //println (womanX);                      // this is just to help me calculate time
  background (110, 220, 250);
  house ();
  ball(ballX, ballY);


  /* 1st cause-effect: Boy kicks ball         */

  if (ballHasBeenKicked) {
    woman(womanX);
    fireStandby();
    ballX = ballX + 20;
    ballY = ballY - 5;

    if (ballX <450) {              //this is just a little delay so that the boy is seen kicking for more than 1 frame
      boyKicking(boyX);
    }

    if (ballX >= 450) {        //ball movements: ball hits the window and starts to fall
      boyStandby(boyX);
      ballX = ballX + 0.2;
      ballY = ballY + 20;

      if (ballY > 590) {       //ball movements: ball on the ground
        ballX = 550;
        ballY = 590;
      }
    }
  }                        // end of ballhasbeenKicked

  else {                   // Standby, before pressing mouse
    boyStandby(boyX);
    woman(womanX);
    fireStandby();
  }

  /* 2nd cause-effect: Ball breaks window glass         */

  if (ballX >= 450) {
    windowBroken();         // draw glass fragments
    fragmentsXPos+=2;
    fragmentsYPos+=2;
    fragmentsOpacity-=2;
    boyX = boyX - 5;        // boy will run away...
    womanX-=8;              // woman will chase boy
  }

  else {
    windowOk();            // before ball hits window
  }


  /* 3rd cause-effect: Broken glass makes woman run after boy         */
  if (womanX >= -4500) {

    if (womanX <= 50) {
      //iterating through all of our smokes
      for (int i = 0; i < numberOfSmokePuffs; i++) {
        mySmoke[i].floatAround();
        mySmoke[i].display();
      }
      if (womanX <= -1000) {
        for (int j = 0; j < numberOfSmokePuffs; j++) {
          mySmoke2[j].floatAround();
          mySmoke2[j].display();
        }
        if (womanX <= -2000) {
          for (int k = 0; k < numberOfSmokePuffs; k++) {
            mySmoke3[k].floatAround();
            mySmoke3[k].display();
          }
        }
      }

      if (smokePuffYPos<=255) {
        smokePuffYPos = 255;
      }
    }

    //now the fire...

    if (womanX <= -3000) {     
      fireBurning (1356, 495, fireBurnWidth, fireBurnHeight, 10, fireBurnDistance);
    }
    if (womanX <= -3100) {     
      fireBurning (1356, 490, fireBurnWidth, fireBurnHeight+10, 10, fireBurnDistance);
    }  
    if (womanX <= -3200) {     
      fireBurning (1345, 550, fireBurnWidth, fireBurnHeight+80, 18, fireBurnDistance);
    }
    if (womanX <= -3300) {    
      fireBurning (1300, 592, fireBurnWidth, fireBurnHeight, 20, fireBurnDistance+2);
    }
    if (womanX <= -3400) {
      fireBurning (1300, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3500) {
      fireBurning (1200, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3550) {
      fireBurning (1150, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3600) {
      fireBurning (1100, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3640) {
      fireBurning (1050, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3680) {
      fireBurning (1000, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3720) {
      fireBurning (950, 581, fireBurnWidth, fireBurnHeight+20, 20, fireBurnDistance+2);
    }
    if (womanX <= -3750) {
      fireBurning (800, 581, fireBurnWidth, fireBurnHeight+20, 30, fireBurnDistance+2);
    }
    if (womanX <= -3780) {
      fireBurning (700, 581, fireBurnWidth, fireBurnHeight+20, 30, fireBurnDistance+2);
    }
    if (womanX <= -3790) {
      fireBurning (550, 581, fireBurnWidth, fireBurnHeight+20, 40, fireBurnDistance+2);
    }
    if (womanX <= -3800) {
      fireBurning (450, 581, fireBurnWidth, fireBurnHeight+20, 50, fireBurnDistance+2);
    }
    if (womanX <= -3820) {
      fireBurning (450, 564, fireBurnWidth+5, fireBurnHeight+60, 111, fireBurnDistance+4);
    }
    if (womanX <= -3840) {
      fireBurning (450, 544, fireBurnWidth+5, fireBurnHeight+100, 111, fireBurnDistance+4);
    }
    if (womanX <= -3850) {
      fireBurning (450, 514, fireBurnWidth+5, fireBurnHeight+160, 111, fireBurnDistance+4);
    }
    if (womanX <= -3860) {
      fireBurning (450, 444, fireBurnWidth+5, fireBurnHeight+300, 111, fireBurnDistance+4);
    }
    if (womanX <= -38370) {
      fireBurning (450, 344, fireBurnWidth+5, fireBurnHeight+500, 111, fireBurnDistance+4);
    }
    if (womanX <= -3880) {
      fireBurning (425, 344, fireBurnWidth+5, fireBurnHeight+500, 117, fireBurnDistance+4);
    }

    //the end
    if (womanX <= -3940) {
      fill (random(245, 255), random(60, 150), 0);
      rect(0, 0, 1500, 700);
    }
  }

  if (womanX <= -4050) {
    //sky
    fill (110, 220, 250);
    rect(0, 0, 1500, 700);
    // grass
    fill (40, 115, 40); 
    rect (0, 600, width, height);
    //ashes
    fill(80);
    beginShape();
    vertex(450, 600);
    vertex(500, 550);
    vertex(530, 580);
    vertex(600, 560);
    vertex(620, 590);
    vertex(680, 542);
    vertex(725, 530);
    vertex(850, 590);
    vertex(920, 560);
    vertex(1190, 580);
    vertex(1300, 555);
    vertex(1450, 600);
    endShape(CLOSE);

    fill(0);
    text("the end.", 1000, 500);
  }
}   // end of void draw


