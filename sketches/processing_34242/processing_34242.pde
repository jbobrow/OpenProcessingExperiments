
////////////////////
//// LEFT vs RIGHT
////////////////////


int clickcountRed =-2;
int clickcountBlue =-2;

PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;

int startTime;
int diffTime;

Boolean enoughTime = false;



/*PImage b;
 PImage c;
 PImage d;*/


import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {

  size(1040, 644);


  a = loadImage("stars2.png");
  b = loadImage("Screen01_Choose.png");
  c = loadImage("Screen01_Instructions.png");
  d = loadImage("Screen02_Ready.png");
  e = loadImage("Screen02_Set.png");
  f = loadImage("Screen02_Go.png");

  minim = new Minim(this);
   
   // load a file, give the AudioPlayer buffers that are 2048 samples long
   player = minim.loadFile("flagsong.aif", 2048);
   // play the file

}

////////////////////////////////////////////////////////////////
/////////////// INITIALIZE CLICK COUNT   //////////////////////

void draw() {

  if (clickcountRed < -1 || clickcountBlue < -1) {
    image(b, 0, 0);
  }


  if (clickcountRed == -1 && clickcountBlue == -1) {
    image(c, 0, 0);
    startTime = millis();
  }


  if (clickcountRed > -1 && clickcountBlue > -1 && diffTime < 3000) {
    image (d, 0, 0);

    diffTime = millis() - startTime;
    println("diffTime = " + diffTime);

    if (diffTime > 1000 && diffTime < 2000) {
      image(e, 0, 0);
    }

    if (diffTime > 2000 && diffTime <3000) {
      image(f, 0, 0);
    }


    if (diffTime > 3000) {
      clickcountRed = 0;
      clickcountBlue = 0;
      
      enoughTime = true;


      fill(255);
      noStroke();
      rect(0, 0, width, height);



      stroke(0);
      rect(0, 0, 515, 322); // UNION BOX OR CANTON
      rect(515, 0, 1040, 46);
      rect(515, 46, 1040, 46);
      rect(515, 92, 1040, 46);
      rect(515, 138, 1040, 46);
      rect(515, 184, 1040, 46);
      rect(515, 230, 1040, 46);
      rect(515, 276, 1040, 46);
      rect(0, 322, 1040, 46);
      rect(0, 368, 1040, 46);
      rect(0, 414, 1040, 46);
      rect(0, 460, 1040, 46);
      rect(0, 506, 1040, 46);
      rect(0, 552, 1040, 46);
      rect(0, 598, 1040, 46);
      

    }

    // QUESTIONS FOR CAITLIN:
    /* INSTRUCTION SCREEN HERE SELECT TEAM BOTH MICE???*/
    /* READY, SET, GO! SCREEN HERE ???*/
    /* RESET BUTTON (key = c) HERE ???*/
    /*  WINNER SCREEN RED HERE (+ LOAD SONG) ???*/
    /*  WINNNER SCREEN BLUE HERE ( + LOAD SONG) ??? */
  }
}




// RED TEAM CLICKS (RIGHT MOUSE BUTTON)
void mousePressed() {

  /* if (clickcountRed > -1 && clickcountBlue > -1 && diffTime > 6000){*/

  if (mouseButton == RIGHT) {
    if(enoughTime == true && clickcountBlue < 51){


    int equationright = width - (clickcountRed * 105) -105;
    fill(209, 8, 35);


    if (clickcountRed <5) {
      rect (equationright, 0, 105, 46);
    } 
    else if (clickcountRed <10) {
      rect (equationright+525, 92, 105, 46);
    } 
    else if (clickcountRed <15) {
      rect (equationright+1050, 184, 105, 46);
    }
    else if (clickcountRed <20) {
      rect (equationright+1575, 276, 105, 46);
    }
    else if (clickcountRed <30) {
      rect (equationright+2100, 368, 105, 46);
    }
    else if (clickcountRed <40) {
      rect (equationright+3150, 460, 105, 46);
    }
    else if (clickcountRed <50) {
      rect (equationright+4200, 552, 105, 46);
    }
    }

    clickcountRed = clickcountRed +1;
  }



  // BLUE TEAM CLICKS (LEFT MOUSE BUTTON)
  if(mouseButton == LEFT) {
    if(enoughTime == true && clickcountRed < 51){
    float equationleft = 0+ (clickcountBlue * 51.5);

    fill(8, 40, 209);


    if (clickcountBlue <10) {
      rect (equationleft, 0, 51.5, 64.4);
    }
    else if (clickcountBlue <20) {
      rect (equationleft-515, 64.4, 51.5, 64.4);
    }
    else if (clickcountBlue <30) {
      rect (equationleft-1030, 128.8, 51.5, 64.4);
    }
    else if (clickcountBlue <40) {
      rect (equationleft-1545, 193.2, 51.5, 64.4);
    }
    else if (clickcountBlue <50) {
      rect (equationleft-2060, 257.6, 51.5, 64.4);
    }
    }
    clickcountBlue = clickcountBlue +1;
  }


////////////////////////////////////////////////////
////////// REMEMBER TO ADD TIMER AFTER 50 CLCIKS TO LAUNCH WIN

    if ((clickcountBlue > 0  || clickcountRed > 0) && (clickcountBlue < 50 && clickcountRed < 50)){
      image(a, 0, 0);
    }



  if (clickcountBlue == 50 && clickcountRed <50) {
    d = loadImage("Screen01_BlueWins.png");
    image(d, 0, 0);
    player.play();
  }

  if (clickcountRed == 50 && clickcountBlue <50) {
    e = loadImage("Screen01_RedWins.png");
    image(e, 0, 0);
    player.play();
  }






  println ("red = " + clickcountRed +" , blue = " + clickcountBlue);
}



void keyPressed() {

  if (key == 'r') {
    clickcountRed =-2;
    clickcountBlue =-2;
    image(b, 0, 0);
    enoughTime = false;
  }
}




/*PImage d;
 
 
 
  /* PImage d;
 e = loadImage("Screen01_RedWins.png");
 image(e,0,0);*/

void stop(){
  player.close();
  minim.stop();
  super.stop();
}









