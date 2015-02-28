
//R, r = racer
int nR = 10;
float rW = 40;
float[] rX = new float[nR];
float[] rY = new float[nR];
float[] xV = new float[nR];
PImage[] rIR = new PImage[nR];
PImage[] rIL = new PImage[nR];
//C,c = coconut
int nC = 5;
float cW = 15;
float[] cX = new float[nC];
float[] cY = new float[nC];
float[] cyV = new float[nC];
//timer
float startingTime= 0;
float itv1= 1000; 
float itv2= 2000; 
float itv3= 3000;  
float itv4= 3700;  

void setup() {
  size(400, 600);
  smooth();
  noStroke();
  frameRate(20);

  //set timer
  startingTime = millis();

  //set coconuts' positions & velocity
  for (int j=0; j<nC;j++) {
    cX[j]= 50*(j+1);
    cY[j]= 30*(j+1);
    cyV[j]= random(5, 10);
  }

  //set hula girls' positions & velocity
  for (int i=0; i<nR; i++) {
    rX[i] = 10;
    rY[i] = 54*(i+1);
    xV[i] = random(5, 10); //hula girls' random velocity
  }

  //images of hula girls go right
  rIR[0] = loadImage("1.gif"); 
  rIR[1] = loadImage("2.gif");
  rIR[2] = loadImage("3.gif");
  rIR[3] = loadImage("4.gif");
  rIR[4] = loadImage("5.gif");
  rIR[5] = loadImage("6.gif");
  rIR[6] = loadImage("7.gif");
  rIR[7] = loadImage("8.gif");
  rIR[8] = loadImage("9.gif");
  rIR[9] = loadImage("10.gif");

  //images of hula girls go left
  rIL[0] = loadImage("f1.gif"); 
  rIL[1] = loadImage("f2.gif");
  rIL[2] = loadImage("f3.gif");
  rIL[3] = loadImage("f4.gif");
  rIL[4] = loadImage("f5.gif");
  rIL[5] = loadImage("f6.gif");
  rIL[6] = loadImage("f7.gif");
  rIL[7] = loadImage("f8.gif");
  rIL[8] = loadImage("f9.gif");
  rIL[9] = loadImage("f10.gif");
}

void draw() {
  background(245, 240, 210);
  PImage bIMG = loadImage("beach2.jpg");
  imageMode(CENTER);
  image(bIMG, width/2, height/2);

  //timer display
  if (millis() - startingTime <= itv1) {
    fill(202, 99, 104);
    ellipse(170, height/2, 15, 15);
  }
  if (millis() - startingTime <= itv2) {
    fill(202, 198, 99);
    ellipse(200, height/2, 15, 15);
  }
  if (millis() - startingTime <= itv3) {
    fill(169, 202, 99);
    ellipse(230, height/2, 15, 15);
  }


  //the race starts at this point
  if (millis() - startingTime >= itv4) {

    //coconuts start
    for (int j=0; j < nC; j++) {
      fill(129, 93, 75);
      ellipse(cX[j], cY[j], cW, cW);
    }


    for (int i=0; i<nR; i++) {
      //if hula girls go right, show images of them facing right
      if (xV[i] > 0) { 
        image(rIR[i], rX[i], rY[i]);
      }
      //if hula girls go left, show images of them facing left
      if (xV[i] < 0) {
        image(rIL[i], rX[i], rY[i]);
      }
    }

    //coconuts bounce with borders
    for (int j=0; j<nC; j++) {
      fill(255);
      cY[j]=cY[j]+cyV[j];
      if (cY[j] >= height-cW/2 || cY[j] <= 0) {
        cyV[j] = cyV[j]*(-1);
      }
    }

    //hula girls bounce back
    for (int i=0; i<nR; i++) {
      rX[i] = rX[i]+xV[i];
      //hula girls bounce with borders
      if (rX[i] >= width-rW/2 || rX[i] <= 0) {
        xV[i] = xV[i]*(-1);
      }      
      //hula girls bounce with coconuts
      for (int j=0; j<nC; j++) {
        if (rY[i] > cY[j] && rX[i] > cX[j] && rX[i] <= 250+cW/2) {
          xV[i] = xV[i]*(-1);
        }
      }
    }
  }
}


