
//=========================================================================//      
//       //////     //////   //      //   //////   //    //  //       //   //
//      //    //  //    //  ////    //  //    //  //    //  ////   ////    //
//     //    //  //    //  // //   //  //        //    //  // // // //     //
//    ///////   //    //  //   // //  //   ///  //    //  //   //  //      //
//   //        //    //  //     ///  //     // //    //  //       //       //
//  //         //////   //      //   ///////   //////   //       //        //
//=========================================================================//

/*Comments
- Chrashes upon quitting the program
- Gets unstable and laggy after playing it a while
and some sounds stops playing
*/

//GLOBAL

//Background
color bg;
int bgSizeX = 500; 
int bgSizeY = 500; 
PFont f;
String title = "PONGUM";
int titleA = 0;    //title Alpha;
int wait, delay = 3000; //delay for the title

//Pad
int padA = 0;    //alpha
int padW = 100;  //Width
int padH = 10;   //height
int padY = bgSizeY-50;  //pos Y


//Ball
int ballA = 0;              //alpha
float ballRad = 34;         //size
float ballX = bgSizeX/2;    //pos X
float ballY = ballRad;      //pos Y
float ballC = random (360); //color 
float ballS = 0;            //saturation

float spdX = 1.6;           //ball init speed
float spdY = 1.6;           //"
int dirX = 1;               //ball init direction
int dirY = 1;               //"

//Distractors
int disQ = 50;                     //# of objects
int disA = 0;                      //alpha
int disS = 0;                      //saturation
float disX[] = new float[disQ];    //init X pos
float disY[] = new float[disQ];    //init Y pos
float disC[] = new float[disQ];    //color 
float disR[] = new float[disQ];    //radius 
float disDirX[] = new float[disQ]; //direction X
float disDirY[] = new float[disQ]; //direction Y

//audio
import ddf.minim.*;
Minim minim;
AudioPlayer song, pong, wrong, gong, bong, bong2;

void setup () {
  size(bgSizeX, bgSizeY);
  colorMode(HSB, 360, 100, 100);
  bg = color(190, 50, 70);
  noStroke();
  wait = millis() + delay; //delay for the title
  f = createFont("Futura-Medium", 14);

  //audio setup
  minim = new Minim(this);
  song = minim.loadFile("tron.mp3");
  pong = minim.loadFile("pong.mp3");
  wrong = minim.loadFile("beep.wav");
  gong = minim.loadFile("fail.wav");
  bong = minim.loadFile("bubble.wav");
  bong2 = minim.loadFile("bubble2.wav");
  song.play();
  song.loop();

  //distractors setup
  for (int n=0; n<50; n++) {
    disX[n] = random (ballRad, 500 - ballRad);
    disY[n] = random (ballRad, bgSizeY/4);
    disC[n] = random (360);
    disR[n] = random (5, 40);
    disDirX[n] = random(1);
    disDirY[n] = random(1);
  };
}

void draw () {
  background(bg);

  //text
  textFont(f);
  textAlign(CENTER);
  textSize(50);
  titleA += 6;                     //fades the title in
  fill(50, 100, 100, titleA);
  text (title, bgSizeX/2, bgSizeY/2);
  if ( millis() >= wait - 1100 ) { //fades the title out
  titleA -= 12;
  }

  if ( millis() > wait ) { //wait until the title fades
  
    //distractors
    disA+=1;         //fade in
    disS+=1;         //fade in
    if (disS > 50) { //stop fade 
      disS = 50;
    }
    for (int n=0; n<50; n++) {
      fill (disC[n], disS, 95, disA);
      ellipse (disX[n], disY[n], disR[n], disR[n]);

      disX[n] = disX[n] - (spdX*disDirX[n]); //move X
      disY[n] = disY[n] - (spdY*disDirY[n]); //move Y

      if (disX[n] > bgSizeX-disR[n] || disX[n] < disR[n]) { //bounce
        disDirX[n] *= -1;
      }

      if (disY[n]> bgSizeY-disR[n] || disY[n] < disR[n]) {  //bounce
        disDirY[n] *= -1;
      }

      //Hitting the ground (FAIL)
      if (ballY >= bgSizeY - ballRad/2) {
        dirY =0;             //stop the ball
        dirX =0;             //stop the ball
        disDirX[n] *= -1.2;  //kill the distractors
        disDirY[n] *= -1.2;  //kill the distractors
        disA++;
        ballC += 10;
        ballRad += pow(0.5, 5);
        padY = 1000;         //kill pad
        println("fail");   
        gong.play();
        song.pause();
        wrong.play();
      }
    };

    // PAD
    noStroke();
    rectMode(CENTER);
    int padX = mouseX;
    if (mouseX!=0) { //create pad with the move of the mouse
      fill(0, 0, 92, padA);
      rect(padX, padY, padW, padH);
      padA+=5;
    }

    // BALL
    ballA+=1;
    ballS+=1;
    fill(ballC, ballS, 100, ballA);
    ellipse(ballX, ballY, ballRad, ballRad);

    ballX = ballX + (spdX*dirX); //move X
    ballY = ballY + (spdY*dirY); //move Y

    spdX+=0.002;
    spdY+=0.002;

    //Bouncing off the walls
    if (ballX > bgSizeX-ballRad/2 || ballX < ballRad/2) {
      dirX *= -1;
      bong.rewind();
      bong.play();
    }

    if (ballY > bgSizeY-ballRad/2 || ballY < ballRad/2) {
      dirY *= -1;
      bong2.rewind();
      bong2.play();
    }

    //Bouncing off the pad
    float padL = padX - padW/2;
    float padR = padX + padW/2;

    if (ballY > padY - ballRad/2 
      && ballX > padL && ballX < padR) {
      dirY *= -1;
      dirX *= -1;
      println("hit");
      pong.rewind();
      pong.play();
    }
  }
}

void stop() {
  song.close();
  pong.close();
  wrong.close();
  gong.close();
  minim.stop();
  super.stop();
}



