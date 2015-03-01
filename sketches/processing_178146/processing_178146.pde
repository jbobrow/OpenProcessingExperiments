
import ddf.minim.*;

/*
 Project-3 Bringing it All Together
 Created by Vilpa Patel
*/
   
float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements
float middleX, middleY, scaler;
float proximity;  // if distance between elements < proximity then draw a line between them
PImage tree, centerpieces, earth, people ;
boolean clickStart = false;
boolean pause = false;
boolean quiet = false;
int option;
long elapsedTime = 0;
long elapsedTime2 = 0;
long startTime = 0;
long startTime2 = 0;
Minim minim;
AudioPlayer soundFX;

void setup() {
  //set size
  size(800, 600);
  background(#FFFFFF);
  tree = loadImage("tree.png"); 
  centerpieces = loadImage("centerpieces.png");
  earth = loadImage("earth.png");
  people = loadImage("people.png");
  minim = new Minim(this);
  soundFX = minim.loadFile("project.mp3");
  numArray = (int) random(50, 100);
  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];
  proximity = 50;
  // set scaling in drawEarth()
  setScaling();
  instructions();
  startTime = millis();
  startTime2 = millis();
}

void draw() {
  //Do nothing if mouse has not been clicked or paused
  if (clickStart && !pause) {
    //Start 2 timers - One to restart the globalisation animation after 5 minutes & Second to delay display of Seasonal greeting and centerpieces rotation
    elapsedTime = millis() - startTime;
    elapsedTime2 = millis() - startTime2;
    //restart with random animation if current one has been running more than 5 minutes
    if (elapsedTime > 20000) {
      background(#FFFFFF);
      drawEarth();
      startTime = millis();
      option = (int)random(20);
    }
     //Globalization displayed
    globalization();
    //Xmas celebration displayed after 30 seconds.
    if (elapsedTime2 > 20000) {
      greetings();
    }

  //set random thickness of line
    strokeWeight((int) random(1, 3));
    for (int i=0; i<numArray; i++) {
      //add increment to x and y
      x[i] += xInc[i];
      y[i] += yInc[i];  
      // bounce off a circle radius scaler -20
      if (((x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) * (scaler - 20)) ) {
        if (x[i] < middleX) {
          xInc[i] =  random(0.1, 1);
        } else if (x[i] > middleX) {
          xInc[i] = -random(0.1, 1);
        } else if (x[i] == middleX) {
          xInc[i] =  random(-1, 1);
        }
        if (y[i] < middleY) {
          yInc[i] =  random(0.1, 1);
        } else if (y[i] > middleY) {
          yInc[i] = -random(0.1, 1);
        } else if (y[i] == middleY) {
          yInc[i] =  random(-1, 1);
        }
      }
    }
    
    
    
    
    //using different strokes.
    for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
        float distance = dist(x[i], y[i], x[j], y[j]  );
        if (distance < proximity) {
          if (option == 0) {
            stroke(map(distance, 0, proximity, 255, 0));
          } else if (option == 1) {
            stroke(map(distance, 0, proximity, 0, 255));
          } else if (option == 2) {
            stroke(0, map(distance, 0, proximity, 0, 255), 0);
          } else if (option == 3) {
            stroke(0, 0, map(distance, 0, proximity, 0, 255));
          } else if (option == 4) {
            stroke(map(distance, 0, proximity, 0, 255), 0, 0);
          } else if (option == 5) {
            stroke(0, map(distance, 0, proximity, 255, 0), 0);
          } 
          else {
            if (i%3 == 0 && j%3==0 || i%5 == 0 && j%5==0 ) {
              stroke((int)random(80), 255, (int)random(80), (int)random(10));
            } else if (i%2 == 0 && j%2==0 || i%4 == 0 && j%4==0) {
              stroke((int)random(80), (int)random(80), 255, (int)random(5));
            } else {
              stroke(255, (int)random(80), (int)random(80), (int)random(10));
            }
          } 
          if (((x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) < ((scaler - 20) *(scaler - 20)) ) {
            line(x[i], y[i], x[j], y[j]  );
          }
        }
      }
    }
  }
}

void keyPressed() {
  //Q for Quiet / music off
  if (key == 'q' || key == 'Q') {
    quiet = true;
    soundFX.pause();
  }
  //M for Music
  if (key == 'm' || key == 'M') {
    quiet = false;
    soundFX.loop();
  }
  //p for pause or continue
  if (key == 'p' || key == 'P') {
    pause = !pause;
  }
}

void stop() {
  // stops sound when sketch stopped.
  super.stop();
}

void mouseClicked() {
  //when mouse clicked restart globalisation
  background(#FFFFFF);
  proximity =(int) random(50, width/10);
  drawEarth();
  if (!quiet) {
    soundFX.loop();
  }
  clickStart = true;
  //randomly select pattern
  option = (int)random(10);
  //check if mouse clicked on the earth or not.
  if (((mouseX-scaler) * (mouseX-scaler)) + ((mouseY-scaler) * (mouseY-scaler)) < ((scaler - 20) *(scaler - 20)) ) {
    //if clicked on earth start with points localised to location of mouse click with random directions
    for (int i=0; i<numArray; i++) {
      do {
        x[i] = mouseX + random(-10, 10);
        y[i] = mouseY + random(-10, 10);
        xInc[i] = random(-1, 1);
        yInc[i] = random(-1, 1);
      } 
      while ( ( (x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) *(scaler - 20)) );
    }
  } else {
    //otherwise start with random points.
    randomStart();
  }
}

void setScaling() {
  //set up scaling values to allow image to be resized
  middleY = height/3;
  middleX = width/3;
  //to alow for scaling when width and height are not equal use the smaller value.
  if (middleY <= middleX) {
    scaler = middleY;
  } else {
    scaler = middleX;
  }
}
void drawEarth() {
  //draw the earth image and apply a random rotation to it.
  pushMatrix();
    translate(scaler, scaler);
    rotate(random(2*PI));
    scale(2*(scaler-20)/1200, 2*(scaler-20)/1200); 
    imageMode(CENTER);
    image(earth, 0, 0);
  popMatrix();
}
void instructions() {
  //setup 
  textSize(25);
  fill(0);
  String instruct1 = "\n\n GLOBALIZATION\n\nClick on the earth for Start / Restart.\nClick on the any of the images for Start / Restart.\nClick on the any of the text for Start / Restart. \n\nPress M or m to turn the Music on \nPress P or p to Pause / Continue.\nPress Q or q to turn the Music off."; 
  text(instruct1, 30, 30);
}

void greetings() {
  //Display objects
  pushMatrix();
    scale(0.2, 0.2);
    //Display 
    if (elapsedTime2 < 300000) {
      image(tree, (width-60)*4.8, 320);
    }
    image(centerpieces, (width-60)*4.6, 1580);
    image(people, (width-175)*4.0, 2650);
  popMatrix();
  //Display tree after 5 minutes
  if (elapsedTime2 >= 300000) {
    rotatetree();
  }
  //Display greetings on right of screen around the objects
  textSize(28);
  fill(0, 0, 255);
  String greeting = "\nXMAS";
  String greeting1 = "\n\n \n\n \n\n CELEBRATION\n "; 
  text(greeting, width-250, 25);
  text(greeting1, width-250, 15);
}

void rotatetree() {
  pushMatrix();
    scale(0.2, 0.2);
    translate((width-60)*4.8, 320);
    imageMode(CENTER);
    rotate((frameCount)*(PI/240));
    image(centerpieces, 0, 0);
  popMatrix();
}
void globalization() {
  //Display globalisation
  textSize(29);
  fill(0, 255, 0, 50);
  String global = "\nG\nL\nO\nB\nA\nL\nI\nZ\nA\nT\nI\nO\nN";
  text(global, 0, 0);
}
void randomStart() {
  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    do {
      x[i] = random(width);
      y[i] = random(height);
    }
    while ( ( (x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) *(scaler - 20)) );
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
  }
}
