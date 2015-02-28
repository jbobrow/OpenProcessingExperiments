

//assignment catalina cortazar

int numBalls = 50; 
float[] xPos = new float[numBalls];
float[] yPos = new float[numBalls];
float[] speed = new float[numBalls]; 
float[] Rcolor = new float[numBalls]; 
float[] Gcolor = new float[numBalls];
float[] Bcolor = new float[numBalls];
float[] rad = new float[numBalls];

boolean[] isGoingRight = new boolean[numBalls]; // from: http://processing.org/learning/basics/requestimage.html
boolean[] isGoingDown = new boolean[numBalls];

void setup () {
  size (900, 600);
  background(115, 112, 143);
  smooth();
  frameRate(24);



  for (int i = 0; i < numBalls; i++) { 

    speed[i] = random(5, 300); 
    Rcolor[i] = 232; 
    Gcolor[i] = random(0, 140);
    Bcolor[i] = random(60, 253);
    rad[i] = random ( 10, 27);
    xPos[i] = random ( 0, 900);
    yPos[i] = random ( 0, 600);
  }
}


void draw () {
  background(115, 112, 143);


  for (int i=0; i < numBalls; i++) {


    noStroke();

    fill(Rcolor[i], Gcolor[i], Bcolor[i]);
    ellipse(xPos[i], yPos[i], rad[i], rad[i]);
  }



  for (int i=0; i < numBalls; i++) {


    if ((900.00 - xPos[i] ) > 900.00) { 
      isGoingRight[i]=true;
    }


    if ((900.00 - xPos[i] ) <= 0.00) { 

      isGoingRight[i]=false;
    }

    if (isGoingRight[i]) {
      xPos[i]+=3;
    }

    else {
      xPos[i]-=3;
    }


    if (isGoingDown[i]) {
      yPos[i]+=3;
    }

    else {
      yPos[i]-=3;
    }

    if (yPos[i] <= 0) { 
      isGoingDown[i]=true;
    }


    if ((yPos[i] ) >= 600) { 

      isGoingDown[i]=false;
    }
  }
}


