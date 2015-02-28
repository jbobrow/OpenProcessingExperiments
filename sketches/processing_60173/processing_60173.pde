
import ddf.minim.*;
PImage studio; 
PImage rocks;
//PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully



//splatter code taken from http://www.openprocessing.org/sketch/9521 AND
//big splatter taken from http://www.openprocessing.org/sketch/4672
//blobscanner library
//
Minim minim;
AudioSample Pol1;
AudioSample Pol2;
AudioSample Pol3;
AudioSample Pol4;
AudioSample Pol5;
AudioSample Pol6;
AudioSample Pol7;


//GLOBALS for strokey splatter
int stageWidth = 1000;
int stageHeight = 600;
int frameRateNum = 60;

//--
int strokeWeightNum = 1;
int strokeWeightMax = 5;
int scatterCount = 0;
int scatterMax = 15;
int scatterDistanceOrig = 10;
int scatterDistance = scatterDistanceOrig;
int scatterStrokeOrig = 10;
int scatterStroke = scatterStrokeOrig;

//paint colour variables
int r = 0; 
int g = 0; 
int b = 0; 

//variable for random get pixels
//float r5 = random (50,430); 
//float r6 = random (50,310);

//convert 
//int r7 = int (r5); 
//int r8 = int (r6); 

//boolean buttons


//buttons 
boolean[] button = new boolean [201];


/* 
 //colours 1-4
 
 //paint styles 5-6
 
 //win states 
 //red, small splatter = 7 to 30
 //blue, small splatter = 31 to 54
 //black, small splatter = 55 to 78
 //white, small splatter = 79 to 102
 //red, big splatter = 103 to 126
 //blue, big splatter = 127 to 151
 //black, big splatter = 152 to 174
 //white, big splatter = 175 to 199
 
 */

//win areas
int[] winX = new int [7]; 
int[] winY = new int [5];

//canvas dimensions
int c1 = 600; 
int c2 = 400; 


//---------MAIN------------------------

void setup() {
  size(1000, 600);
  frameRate(frameRateNum);
  smooth();
  noStroke();
  studio = loadImage("Studio2.jpg");
  rocks = loadImage("rocks.jpg");

//font = loadFont("FFScala-32.vlw"); 

  minim = new Minim(this);
  Pol1 = minim.loadSample("Pollock1.mp3", 2048);
  Pol2 = minim.loadSample("Pol2.mp3", 2048);
  Pol3 = minim.loadSample("Pol3.mp3", 2048);
  Pol4 = minim.loadSample("Pol4.mp3", 2048);
  Pol5 = minim.loadSample("Pol5.mp3", 2048);
  Pol6 = minim.loadSample("Pol6.mp3", 2048);
  Pol7 = minim.loadSample("Pol7.mp3", 2048);



  for (int i = 0; i < winX.length; i++) {
    winX[i] = 200 + 100*i;
  }

  for (int i = 0; i < winY.length; i++) {
    winY[i] = 100 + 100*i;
  }

  for (int i = 0; i < button.length; i++) {
    button[i] = false;
  }
}


void draw() {


  //draw canvas
  if (frameCount == 1) {
    image(studio, 0, 0);
  }

fill(150); 

ellipse(80,490,60,50); 
//textFont(font); 
fill(255); 
text("Analyze", 55, 490); 


  /*if player hasn't touched the upper left hand corner say "i enjoy working on a large canvas..."
  if (frameCount == 1000) {
    if (button[12] == false && button[13] == false) {
      Pol5.trigger();
      println("NOTRIGGER");
    }
    else if (button[36] == false) {
      Pol5.trigger();
    }
    else if (button[36] == false && button[60] == false) {
      Pol5.trigger();
    }
    else if (button[84] == false && button[108] == false) {
      Pol5.trigger();
    }
    else if (button[132] == false && button[158]) {
      Pol5.trigger();
    }
    else if (button[182] == false) {
      Pol5.trigger();
    }
  }

  if (frameCount == 4000) {
    if (button[12] == false && button[13] == false) {
      Pol4.trigger();
      println("NOTRIGGER");
    }
    else if (button[36] == false) {
      Pol4.trigger();
    }
    else if (button[36] == false && button[60] == false) {
      Pol4.trigger();
    }
    else if (button[84] == false && button[108] == false) {
      Pol4.trigger();
    }
    else if (button[132] == false && button[158]) {
      Pol4.trigger();
    }
    else if (button[182] == false) {
      Pol4.trigger();
    }
  }*/



  //if small splatter hasn't been used, say "sometimes i use a brush, sometimes i use a stick
  if (frameCount == 1000 && button[4] == false) {
    Pol7.trigger();
  }
  
  //if small splatter hasn't been used, say "sometimes i use a brush, sometimes i use a stick
  if (frameCount == 2000 && button[4] == false) {
    Pol7.trigger();
  }

  if (frameCount == 3000 && button[4] == false) {
    Pol7.trigger();
  }
  //if big splatter hasn't been used, say "sometimes i pour paint straight out of the can")
  if (frameCount == 1000 && button[5] == false && button[199] == false) {
    Pol6.trigger();
  }
 
  if (frameCount == 2000 && button[5] == false && button[199] == false) {
    Pol6.trigger();
  }

  if (frameCount == 3000 && button[5] == false && button[199] == false) {
    Pol6.trigger();
  }
  
  
  if (frameCount == 4000 && button[199] == false) {
    Pol3.trigger();
  }

  // if (frameCount == 100) {
  // Pol1.trigger();
  //}

  /*//red
   drawButton (100, 20, 30, 45, 120);
   //blue
   drawButton (30, 20, 100, 105, 120);
   //black
   drawButton (0, 0, 0, 45, 170);
   
   //stroke (50); 
   //white
   drawButton (253, 245, 230, 105, 170);
   */

  //line splatter
  //drawButton (255, 255, 255, 75, 275);

  //draw buttons - big splatter
  //drawButton (255, 255, 255, 75, 340);
  //noStroke (); 

  //button1 = red
  if (button[0]) {
    r=211;
    g=197;
    b=82;
  }

  //button2 = blue
  if (button[1]) {
    r=30;
    g=20;
    b=100;
  }

  //button3 = black
  if (button[2]) {
    r=124;
    g=118;
    b=117;
  }

  //button4 = white
  if (button[3]) {
    r=128;
    g=10;
    b=10;
  }

  if (button[199]) {
    if (mouseX > 200 && mouseX < 800 && mouseY > 100 && mouseY < 500  && mousePressed == true) {
      image(rocks, mouseX, mouseY);
    }
  }

  if (button[200]) {
    PImage outputImage = get(200,100,590,390);
    outputImage.save("creation.jpeg");
    println ("PHOTO"); 
  }


  //splatter
  drawStuff();
  splatter();


  //red small splatter
  if (button[0] == true && button[4] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[7+i] = true; 
          println ("yes1");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[13+i] = true; 
          println ("yes2");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[19+i] = true; 
          println ("yes3");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[25+i] = true; 
          println ("yes4");
        }
      }
    }
  }


  //blue small splatter
  if (button[1] == true && button[4] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[31+i] = true; 
          println ("yes5");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[37+i] = true; 
          println ("yes6");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[43+i] = true; 
          println ("yes7");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[49+i] = true; 
          println ("yes8");
        }
      }
    }
  }

  //black small splatter
  if (button[2] == true && button[4] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[55+i] = true; 
          println ("yes9");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[61+i] = true; 
          println ("yes10");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[67+i] = true; 
          println ("yes11");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[73+i] = true; 
          println ("yes12");
        }
      }
    }
  }

  //white small splatter
  if (button[3] == true && button[4] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[79+i] = true; 
          println ("yes13");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[85+i] = true; 
          println ("yes14");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[91+i] = true; 
          println ("yes15");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[97+i] = true; 
          println ("yes16");
        }
      }
    }
  }

  //red big splatter
  if (button[0] == true && button[5] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[103+i] = true; 
          println ("yes17");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[109+i] = true; 
          println ("yes18");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[115+i] = true; 
          println ("yes19");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[121+i] = true; 
          println ("yes20");
        }
      }
    }
  }

  //blue big splatter
  if (button[1] == true && button[5] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[127+i] = true; 
          println ("yes18");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[133+i] = true; 
          println ("yes19");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[139+i] = true; 
          println ("yes20");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[145+i] = true; 
          println ("yes21");
        }
      }
    }
  }

  //black big splatter
  if (button[2] == true && button[5] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[153+i] = true; 
          println ("yes22");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[159+i] = true; 
          println ("yes23");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[165+i] = true; 
          println ("yes24");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[171+i] = true; 
          println ("yes25");
        }
      }
    }
  }
  //white big splatter
  if (button[3] == true && button[5] == true) {

    if (mouseY > winY[0] && mouseY < winY[1]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[177+i] = true; 
          println ("yes26");
        }
      }
    }

    if (mouseY > winY[1] && mouseY < winY[2]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[183+i] = true; 
          println ("yes27");
        }
      }
    }


    if (mouseY > winY[2] && mouseY < winY[3]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[189+i] = true; 
          println ("yes28");
        }
      }
    }

    if (mouseY > winY[3] && mouseY < winY[4]) {

      for (int i = 0; i < winX.length; i++) {

        if (mouseX > winX[i] && mouseX < winX[i+1] && mousePressed) {
          button[195+i] = true; 
          println ("yes29");
        }
      }
    }
  }
}




//win state
//if (button7 == true && button8 == true && button9 == true && button10 == true && button11 == true && button12 == true && button13 == true && button14 == true && button15 == true && button16 == true && button17 == true){
// && button18 == true) {
//println("YOUREALLYWON");
//}








//---------FUNCTIONS-------------------



//draw button
//void drawButton (int R1, int G1, int B1, int pos1, int pos2) {

//rectMode (CORNER); 
//fill (R1, G1, B1); 
//  rect (pos1, pos2, 50, 35);
//}

//button toggles


//paint colour to red changes if button is pressed
void mousePressed () {
  if (mouseX > 40 && mouseX < 90 && mouseY > 110 && mouseY < 145  && mousePressed == true) {
    button[0] = true; 
    button[1] = false; 
    button[2] = false; 
    button[3] = false;
  }




  //paint colour to blue changes if button is pressed
  if (mouseX > 105 && mouseX < 155 && mouseY > 120 && mouseY < 155  && mousePressed == true) {
    button[1] = !button[1];
    button[0] = false; 
    button[2] = false; 
    button[3] = false;
  }




  //paint colour to black changes if button is pressed
  if (mouseX > 45 && mouseX < 95 && mouseY > 170 && mouseY < 205  && mousePressed == true) {
    button[2] = !button[2];
    button[0] = false; 
    button[1] = false; 
    button[3] = false;
  }



  //paint colour to white changes if button is pressed

  if (mouseX > 105 && mouseX < 155 && mouseY > 170 && mouseY < 205  && mousePressed == true) {
    button[3] = !button[3];
    button[0] = false; 
    button[1] = false; 
    button[2] = false;
  }




  //button line splatter tool if pressed
  if (mouseX > 75 && mouseX < 125 && mouseY > 275 && mouseY < 325  && mousePressed == true) {
    button[4] = !button[4];
    button[5] = false;
    button[199] = false;
  }

  //button big splatter tool if pressed

  if (mouseX > 75 && mouseX < 125 && mouseY > 340 && mouseY < 390  && mousePressed == true) {
    button[5] = !button[5];
    button[4] = false;
    button[199] = false;
  }


  //rock if tool is pressed

  if (mouseX > 75 && mouseX < 125 && mouseY > 405 && mouseY < 455  && mousePressed == true) {
    button[199] = true; 
    button[4] = false;
    button[5] = false;
  }

  if (mouseX > 75 && mouseX < 125 && mouseY > 470 && mouseY < 510  && mousePressed == true) {
    button[200] = true;
  }
}

//Void drawStuff is the long splatters

void drawStuff() {
  if (mouseX > 200 && mouseX < 800 && mouseY > 100 && mouseY < 500  && mousePressed == true && button[4] == true) {
    stroke (r, g, b);
    strokeWeightNum = ((abs(mouseX - pmouseX)) + (abs(mouseY - pmouseY)))/2;
    if (strokeWeightNum > strokeWeightMax) {
      strokeWeightNum = strokeWeightMax;
    }
    strokeWeight(strokeWeightNum);
    line(pmouseX, pmouseY, mouseX, mouseY);
    //--
    while (scatterCount < scatterMax) {
      stroke(r, g, b);
      strokeWeight(scatterStroke);
      float qq = mouseX + random(scatterDistance) - random(scatterDistance);
      float ww = mouseY + random(scatterDistance) - random(scatterDistance);
      point(qq, ww);
      scatterCount ++;
      scatterDistance --;
      if (scatterStroke > 0) {
        scatterStroke --;
      }
    }
    scatterCount = 0;
    scatterStroke = scatterStrokeOrig;
    //---------
    while (scatterCount < scatterMax) {
      stroke(r, g, b);
      strokeWeight(scatterStroke/2);
      float qq = mouseX + random(scatterDistance*2) - random(scatterDistance*2);
      float ww = mouseY + random(scatterDistance*2) - random(scatterDistance*2);
      point(qq, ww);
      scatterCount ++;
      scatterDistance --;
      if (scatterStroke > 0) {
        scatterStroke --;
      }
    }
    scatterCount = 0;
    scatterStroke = scatterStrokeOrig;
  }
  scatterDistance = scatterDistanceOrig;
}

//void splatter is the blobs

void splatter ()
{
  smooth();

  //spatter variables
  //variables for splat (main splatter body)
  float splatSize = random (5, 20);
  int splatX = mouseX;
  int splatY = mouseY;
  float q = splatX;
  float p = splatY;

  //variables for splick (smaller drops)
  float splickSize = random (1, 15);
  float splickX = splatX + random (-30, 45);
  float splickY = splatY + random (-30, 45);

  //variables for splatter trail
  float d = splatSize/3;
  float vx1 = splatX-random(d, 20); //x-15;
  float vx2 = splatX+(random(d, 20)); //x+12;
  float vy2 = splatY+random(100, 190);//y+225;
  float vx3 = splatX+d-15; //x+ 21;
  float vy3 = splatY+random(-11, 8);//y-11;
  float cx3 = vx2+8; //x+22;
  float cy3= vy2;//y+225;

  //variables for splatter spikes

  float tx1= splatX+random(-d, 20);
  float ty1= splatY+random(20);
  float tx2= tx1-10;
  float ty2= ty1+10;
  float tx3= splatX+d;
  float ty3= splatY+d;


  if (mouseX > 200 && mouseX < 800 && mouseY > 100 && mouseY < 700  && mousePressed == true && button[5] == true) {



    fill (r, g, b);
    //splat
    ellipse(splatX, splatY, splatSize, splatSize);

    //splick
    ellipse (splickX, splickY, splickSize, splickSize);
    // Why is it creating more than one splick?

    //splatter trail
    beginShape();
    vertex (vx1, splatY+14);
    bezierVertex (splatX, splatY+25, splatX+20, splatY+28, vx2, vy2);
    bezierVertex (cx3, cy3, splatX+18, splatY+200, vx3, vy3);
    endShape();

    //splatter spikes

    triangle(tx1, ty1, tx2, ty2, tx3, ty3);
    triangle(tx1, ty1, tx2, ty2, tx3, ty3);
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  Pol1.close();
  Pol2.close();
  Pol3.close();
  Pol4.close();
  Pol5.close();
  Pol6.close();
  Pol7.close();
  minim.stop();
  super.stop();
}




//-------------END-----------------------


