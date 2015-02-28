
/*
Jason Moran
 08/11/2011
 ARRAYS!
 */

/*
the concept of arrays: putting a lot of variables in one place so youc an easily modify or control all of those objects at the same time
 portability: easier to control many shapes at once, as they are accessible through the same array
 readability: easier to tell what you're dealing with and to navigate variables 
 scalability: can increase number of elements controlled by your arrays by changing a single number
 
 arrays and for-loops!
 looping through all elements of an array
 */


int numBalls = 50;
float[] xPos= new float[numBalls];
float[] yPos= new float[numBalls];
float[] speed= new float[numBalls];
float[] ballRadius= new float[numBalls];

float[] r= new float[numBalls];
float[] g= new float[numBalls];
float[] b= new float[numBalls];

boolean[] isGoingRight=new boolean [numBalls];
boolean[] isGoingDown=new boolean [numBalls];



void setup() {
  size(400, 400);
  frameRate(40);
  smooth();

  // xPos[0] = 4;
  // xPos[1] = 8;
  // xPos[2] = 12;

  for (int i =0; i < numBalls; i++) {
    xPos[i] = round(random(ballRadius[i], width-ballRadius[i]));
    yPos[i] = round(random(ballRadius[i], height-ballRadius[i]));
    speed[i] = random(3, 4);
    r[i] = random(50, 100); //<--random must be a float at top!!!
    g[i] = random(70, 130);
    b[i] = random(190, 255);
    fill(r[i], g[i], b[i]);
    ballRadius[i] = random(7, 40);
    isGoingRight[i] = true;
    isGoingDown[i] = false;
  }

  //yPos[0] = 60;
  //yPos[1] = 120;
  //yPos[2] = 360;

  // speed[0] = 2;
  // speed[1] = 5;
  // speed[2] = 8;

  // println(xPos[0]);
  // println("xPos: ");
  // println(xPos);
  // println("speed: ");
  // println(speed);
}

void draw() {
  background(75,100,210);

  for (int i= 0; i < numBalls; i++) {
    ellipse(xPos[i], yPos[i], ballRadius[i], ballRadius[i]);
    fill(r[i], g[i], b[i]);


    //for X 
    //x-right side
    if (xPos[i] + ((ballRadius[i])/2) > width) {
      isGoingRight[i]=false;
    }
    //x-left side
    if (xPos[i] - ((ballRadius[i])/2) < 0) {
      isGoingRight[i]=true;
    }

    if (isGoingRight[i] == true) {
      xPos[i]+=speed[i];
    }

    else {
      xPos[i]-=speed[i];
    }


    //for Y
    //y-bottom side
    if (yPos[i] + ((ballRadius[i])/2) > height) {
      isGoingDown[i]=false;
    }
    //y-top side
    if (yPos[i] - ((ballRadius[i])/2) < 0) {
      isGoingDown[i]=true;
    }

    if (isGoingDown[i] == true) {
      yPos[i]+=speed[i];
    }
    else {
      yPos[i]-=speed[i];
    }
  }
}


// println("-----");


