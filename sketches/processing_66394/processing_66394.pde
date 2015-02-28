
/*****************************************************************************
*     BY:              Pukkawat Leesawan (Poom)
*     S_ID:            420097239
*     DATE:            4/8/2012
*     DESCRIPTION:     This program will create an animation for showing 
*                      OLYMPIC 2012 WINNERS for assignment 1 in IDEA9204 
*                      Screen Studio.
*****************************************************************************/

/************* DRAW 2012 VAILIABLEs *************************/
int[][][] characterVertexArray = new int[4][8][2]; //Array from each vertex in chracter "2012"
int[][] constantArray = new int[8][2]; //A constant buffer

boolean[] pointCheckListArray = new boolean[8]; //Use for checking complete state 1

int currentShape = 0;

boolean drawAll = false; // Start State 2
/************* END DRAW 2012 VAILIABLEs **********************/

/************** FIREWORKS VARIABLEs **************************/
int maxCircles = 300; //Maximum array for x y r h, Maximum circles it will create
int numCircles = 0;
float[] x = new float[maxCircles];
float[] y = new float[maxCircles];
float[] r = new float[maxCircles];
float[] h = new float[maxCircles];

int secInit = 0;
int secCurrent = 0;
int secCount = 0;

float setCenterCircleX = width/2;
float setCenterCircleY = height/2;
float setAngleSpreading = 360;

float R = 0;
float G = 0;
float B = 0;
int colorSelection = 0;
int countBuffer = 0;
/************* END FIREWORKS VARIABLEs*************************/

/************* VELOCITY VARIABEs ******************************/
float moving = 0;
float movingAccel = 7.3;

float movingFont = 0;
float movingAccelFont = 5.5;

float movingBorder = 0;
float movingAccelBorder = 8.7;

/************* END VELOCITY VARIABEs **************************/

PFont font;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  colorMode(HSB);

  font = loadFont("Destroy.vlw"); 
  textFont(font); 

  //Set initial value
  for (int i=0; i<8; i++) {
    for (int j=0; j<2; j++) {
      constantArray[i][j] = 0;
    }
    pointCheckListArray[i] = false;
  }

  characterVertexArray[0][0][0] = 65;
  characterVertexArray[0][0][1] = 163;
  characterVertexArray[0][1][0] = 103;
  characterVertexArray[0][1][1] = 66;
  characterVertexArray[0][2][0] = 238;
  characterVertexArray[0][2][1] = 139;
  characterVertexArray[0][3][0] = 211;
  characterVertexArray[0][3][1] = 228;
  characterVertexArray[0][4][0] = 256;
  characterVertexArray[0][4][1] = 225;
  characterVertexArray[0][5][0] = 304;
  characterVertexArray[0][5][1] = 323;
  characterVertexArray[0][6][0] = 71;
  characterVertexArray[0][6][1] = 340;
  characterVertexArray[0][7][0] = 119;
  characterVertexArray[0][7][1] = 194;

  characterVertexArray[1][0][0] = 222;
  characterVertexArray[1][0][1] = 192;
  characterVertexArray[1][1][0] = 291;
  characterVertexArray[1][1][1] = 71;
  characterVertexArray[1][2][0] = 318;
  characterVertexArray[1][2][1] = 95;
  characterVertexArray[1][3][0] = 390;
  characterVertexArray[1][3][1] = 23;
  characterVertexArray[1][4][0] = 534;
  characterVertexArray[1][4][1] = 164;
  characterVertexArray[1][5][0] = 465;
  characterVertexArray[1][5][1] = 282;
  characterVertexArray[1][6][0] = 442;
  characterVertexArray[1][6][1] = 258;
  characterVertexArray[1][7][0] = 368;
  characterVertexArray[1][7][1] = 329;

  characterVertexArray[2][0][0] = 94;
  characterVertexArray[2][0][1] = 366;
  characterVertexArray[2][1][0] = 214;
  characterVertexArray[2][1][1] = 330;
  characterVertexArray[2][2][0] = 279;
  characterVertexArray[2][2][1] = 393;
  characterVertexArray[2][3][0] = 241;
  characterVertexArray[2][3][1] = 531;
  characterVertexArray[2][4][0] = 114;
  characterVertexArray[2][4][1] = 563;
  characterVertexArray[2][5][0] = 153;
  characterVertexArray[2][5][1] = 428;
  characterVertexArray[2][6][0] = 94;
  characterVertexArray[2][6][1] = 366;
  characterVertexArray[2][7][0] = 94;
  characterVertexArray[2][7][1] = 366;

  characterVertexArray[3][0][0] = 369;
  characterVertexArray[3][0][1] = 332;
  characterVertexArray[3][1][0] = 453;
  characterVertexArray[3][1][1] = 282;
  characterVertexArray[3][2][0] = 530;
  characterVertexArray[3][2][1] = 405;
  characterVertexArray[3][3][0] = 438;
  characterVertexArray[3][3][1] = 463;
  characterVertexArray[3][4][0] = 547;
  characterVertexArray[3][4][1] = 537;
  characterVertexArray[3][5][0] = 395;
  characterVertexArray[3][5][1] = 558;
  characterVertexArray[3][6][0] = 267;
  characterVertexArray[3][6][1] = 454;
  characterVertexArray[3][7][0] = 395;
  characterVertexArray[3][7][1] = 381;
}

void draw() {

  noStroke();
  fill(255, 4);
  rect(0, 0, 600, 600); // clear display

  stroke(0);
  strokeWeight(5);

  //Draw Shape
  beginShape();
  fill(181, int(random(0, 255)), int(random(0, 255)), 4);
  vertex(constantArray[0][0], constantArray[0][1]);
  vertex(constantArray[1][0], constantArray[1][1]);
  vertex(constantArray[2][0], constantArray[2][1]);
  vertex(constantArray[3][0], constantArray[3][1]);
  vertex(constantArray[4][0], constantArray[4][1]);
  vertex(constantArray[5][0], constantArray[5][1]);
  vertex(constantArray[6][0], constantArray[6][1]);
  vertex(constantArray[7][0], constantArray[7][1]);
  endShape(CLOSE);

  //There are 8 verteices. Calculate if the current vetex is lower or higher than the new vertex in another character in "2012" does + or - to the curernt positionof the vertex 
  for (int i=0; i<8; i++) {
    if (constantArray[i][0] != characterVertexArray[currentShape][i][0]) {
      if (constantArray[i][0] < characterVertexArray[currentShape][i][0]) {
        constantArray[i][0]++;
      }
      else if (constantArray[i][0] > characterVertexArray[currentShape][i][0]) {
        constantArray[i][0]--;
      }
    }
    if (constantArray[i][1] != characterVertexArray[currentShape][i][1]) {
      if (constantArray[i][1] < characterVertexArray[currentShape][i][1]) {
        constantArray[i][1]++;
      }
      else if (constantArray[i][1] > characterVertexArray[currentShape][i][1]) {
        constantArray[i][1]--;
      }
    }

    if (constantArray[i][0] == characterVertexArray[currentShape][i][0]) {
      pointCheckListArray[i]= true;
    }
  }

  //Check if all Character in "2012" was drew, start State 2, If not continue with next Character in "2012"
  if (pointCheckListArray[0]&&pointCheckListArray[1]&&pointCheckListArray[2]&&pointCheckListArray[3]&&pointCheckListArray[4]&&pointCheckListArray[5]&&pointCheckListArray[6]&&pointCheckListArray[7]) {
    if (currentShape<3) {

      for (int i=0; i<8; i++) {
        pointCheckListArray[i] = false;
      }

      currentShape++;
    }
    else if (currentShape == 3) {
      drawAll = true;
    }
  }

  //State 2
  if (drawAll) {
    //Draw 2
    beginShape();
    fill(181, int(random(0, 255)), int(random(0, 255)), 4);
    vertex(65, 163);
    vertex(103, 66);
    vertex(238, 139);
    vertex(211, 228);
    vertex(256, 225);
    vertex(304, 323);
    vertex(71, 340);
    vertex(119, 194);
    //fill(181,int(random(0,255)),int(random(0,255)),50);
    endShape(CLOSE);

    //Draw 0
    beginShape();
    fill(145, int(random(0, 15)), int(random(0, 255)), 4);
    vertex(222, 192);
    vertex(291, 71);
    vertex(318, 95);
    vertex(390, 23);
    vertex(534, 164);
    vertex(465, 282);
    vertex(442, 258);
    vertex(368, 329);
    endShape(CLOSE);

    //Draw 1
    beginShape();
    fill(0, int(random(0, 255)), int(random(0, 255)), 4);
    vertex(94, 366);
    vertex(214, 330);
    vertex(279, 393);
    vertex(241, 531);
    vertex(114, 563);
    vertex(153, 428);
    vertex(94, 366);
    vertex(94, 366);
    endShape(CLOSE);

    //Draw .
    beginShape();
    colorMode(RGB);
    fill(255, 255, 255);
    vertex(277, 389);
    vertex(293, 326);
    vertex(370, 333);
    vertex(355, 400);
    endShape(CLOSE);
    
    update(); //call update function for FIREWORKS

    /********************* MOVING ANIMATION *****************************/
    moving+=movingAccel;

    if (movingAccel > 0) {
      movingAccel-=0.05;
    }
    else {
      movingAccel = 0;
    }


    movingFont+=movingAccelFont;

    if (movingAccelFont > 0) {
      movingAccelFont-=0.05;
    }
    else {
      movingAccelFont = 0;
    }
    
    movingBorder+=movingAccelBorder;

    if (movingAccelBorder > 0) {
      movingAccelBorder-=0.05;
    }
    else {
      movingAccelBorder = 0;
    }
    /********************* END MOVING ANIMATION ***********************/
  }
  
  //update color for FIREWORKS
  for (int i = 0; i < numCircles; i++) {
    for (int j = i+1; j < numCircles; j++) {
      float d = dist(x[i], y[i], x[j], y[j]);
      if (d < (r[i] + r[j])) {
        //float grey = map(d, 0, r[i] + r[j], 255, 0);
        colorMode(RGB);

        switch(colorSelection) {
        case 0: //Blue
          /*
          R = map(d, 0, r[i] + r[j], 0, 0);
           G = map(d, 0, r[i] + r[j], 0, 100);
           B = map(d, 0, r[i] + r[j], 200, 255);
           */
          R = map(d, 0, r[i] + r[j], 50, 255);
          G = map(d, 0, r[i] + r[j], 100, 255);
          B = map(d, 0, r[i] + r[j], 200, 255);

          break;

        case 1: //Yellow
          R = map(d, 0, r[i] + r[j], 250, 255);
          G = map(d, 0, r[i] + r[j], 200, 255);
          B = map(d, 0, r[i] + r[j], 25, 50);
          break;

        case 2: //Black
          R = map(d, 0, r[i] + r[j], 0, 100);
          G = map(d, 0, r[i] + r[j], 0, 100);
          B = map(d, 0, r[i] + r[j], 0, 100);
          break;

        case 3: //Green
          R = map(d, 0, r[i] + r[j], 50, 100);
          G = map(d, 0, r[i] + r[j], 200, 255);
          B = map(d, 0, r[i] + r[j], 100, 200);
          break;

        case 4: //Red
          R = map(d, 0, r[i] + r[j], 200, 255);
          G = map(d, 0, r[i] + r[j], 25, 255);
          B = map(d, 0, r[i] + r[j], 25, 255);
          break;

        default:
          /*
          R = map(d, 0, r[i] + r[j], 150, 255);
           G = map(d, 0, r[i] + r[j], 100, 255);
           B = map(d, 0, r[i] + r[j], 25, 255);*/
          R = map(d, 0, r[i] + r[j], 25, 255);
          G = map(d, 0, r[i] + r[j], 100, 255);
          B = map(d, 0, r[i] + r[j], 150, 255);
          break;
        }

        stroke(R, G, B, 100);
        line(x[i], y[i], x[j], y[j]);
      }
    }
  }
  /*
  colorMode(RGB);
   stroke(0, 0, 255);
   drawRing(150, 200, 70, 65, 32);
   
   stroke(0);
   drawRing(300, 200, 70, 65, 32);
   
   stroke(255, 0, 0);
   drawRing(450, 200, 70, 65, 32);
   
   stroke(255, 255, 0);
   drawRing(225, 280, 70, 65, 32);
   
   stroke(0, 150, 5);
   drawRing(375, 280, 70, 65, 32);
   */

  colorMode(RGB);
  
  //Draw upper and lower bars
  fill(0);
  noStroke();
  rect(0, -250+movingBorder, 600, 100);
  rect(0, 750-movingBorder, 600, 100);
  
  //Draw OLYMPIC's rings
  stroke(0, 0, 255);
  drawRing(-380, 200, 70, 65, 32);

  stroke(0);
  drawRing(-230, 200, 70, 65, 32);

  stroke(255, 0, 0);
  drawRing(-80, 200, 70, 65, 32);

  stroke(255, 255, 0);
  drawRing(-305, 280, 70, 65, 32);

  stroke(0, 150, 5);
  drawRing(-155, 280, 70, 65, 32);

  //TEXT
  fill(255, 255, 255);
  text("WINNER", 150, 800-movingFont); 
  fill(0, 0, 0, 20);
  text("WINNER", 150, 780-movingFont);
  fill(0, 0, 0, 40);
  text("WINNER", 150, 760-movingFont);
}

void reset(int i) {
  x[i] = setCenterCircleX; //Start at middle of Verticle
  y[i] = setCenterCircleY; //Start at middle of Horizontal
  r[i] = random(10, 30); //Circle Size
  h[i] = setAngleSpreading; //Angle of circle starting point
}

void update() {

  secCurrent = second();
  secCount = (secCurrent - secInit)%10; //count for 10 seconds
  if (secCount < 0) {
    secCount = secCount*(-1);
  }

  if (numCircles < maxCircles) { 
    reset(numCircles); //if "true" create new circle
    numCircles++;
  }


  for (int i = 0; i < numCircles; i++) {
    x[i] += cos(radians(h[i]));
    y[i] += sin(radians(h[i]));
    if (dist(x[i], y[i], width/2, height/2) > 0.7*width) { //spreading

      setAngleSpreading = random(random(360));
      reset(i);
    }
    for (int j = 0; j < numCircles; j++) {
      float d = dist(x[i], y[i], x[j], y[j]);
      if (d < (r[i] + r[j])) {
        h[i] += random(-1, 1);
      }
    }
  }
  if (secCount == 0) {

    countBuffer++; // In order to prevent the repitative process when using time count with Modulu(%)
    //println("count buffer = "+countBuffer);
    if (countBuffer == 10) {
      countBuffer = 0;
      if (colorSelection < 4) {
        colorSelection++;
        //println(colorSelection);
      }
      else {
        colorSelection = -1;
      }
    }

    setCenterCircleX = random(0, width);
    setCenterCircleY = random(0, height);
  }
}

/********************* DRAW RING **************************/
//FROM: http://www.processing.org/discourse/beta/num_1128001871.html
//MODIFIED DATE: 4/8/2012
void drawRing(int x, int y, float w1, float w2, int segments)
{

  // w1 == outer radius, w2 == inner radius.
  float deltaA=(1.0/(float)segments)*TWO_PI;
  beginShape(QUADS);
  for (int i=0;i<segments;i++)
  {

    vertex(x+w1*cos(i*deltaA)+moving, y+w1*sin(i*deltaA));
    vertex(x+w2*cos(i*deltaA)+moving, y+w2*sin(i*deltaA));
    vertex(x+w2*cos((i+1)*deltaA)+moving, y+w2*sin((i+1)*deltaA));
    vertex(x+w1*cos((i+1)*deltaA)+moving, y+w1*sin((i+1)*deltaA));
  }
  endShape();
}
/********************* END DRAW RING **********************/


