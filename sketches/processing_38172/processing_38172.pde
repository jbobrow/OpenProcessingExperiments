
//Intro to Computational Media, Homework 2
//Zena Koo and Mark Breneman
//camera shape

int shutterButtonY=118;
int innerFlashSize = 0;
int flashX = 290;
int flashY = 110;

void setup() {
  size(500, 500);
}

void draw() {

  fill(0);
  rectMode(CENTER);
  fill(0);
  background(255);
  smooth();
  strokeWeight(1);
  stroke(0);
  //Camera Body
  rect(250, 250, 400, 250);

  //shutter
  fill(0);
  rect(290, 120, 120, 60);

  //flash frame
  fill(255);
  rect(290, 115, 85, 20);

  //outer lens 
  fill(127);
  ellipse(290, 245, 130, 130);

  //inner lens 
  fill(0);
  ellipse(290, 245, 50, 50);


  //Camera Button
  fill(0, 0, 0);
  rect(110, shutterButtonY, 60, 15);
  //CameraButton Movement
  if (mousePressed==true) {
    shutterButtonY=125;
    strokeWeight(20); //thick strokeweight
    stroke(255, 255, 0, 63); //yellow outline of flash with 25percent transparency - alpha
    fill(255, 255, 255, 50); //white flash fill with low transparency

    ellipse(flashX, flashY, innerFlashSize, innerFlashSize); 
    //^flash ellipse originating from middle of rectangle inner flash

    innerFlashSize = innerFlashSize + 20;
    //^flash increases in size at whatever rate specified, in this case 20
  }
  else {
    shutterButtonY=118;
    innerFlashSize=0;
  }
}
//shutterButtonY = constrain(shutterButtonY, 118, 125);}


