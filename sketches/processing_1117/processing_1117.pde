
//Little Ball Vars
int ballx;
int bally;
int ballSpeed;
int ballDia = 20;

//font
PFont font;

//Keys
char key1 = 's';
char key2 = 'x';
char key3 = 'b';
char resetKey = 'r';
char helpKey = 'h';
char numStarKey = 'n';
char small = '1';
char medium = '2';
char large = '3';
char bigEnd = 'c';

char lastKey = 'a';

//*********** code to activate scene 2
boolean sceneTwoChange;


//variables for central big bangers
int uniCenterY;
int uniCenterX;
int uniDiamX;
int uniDiamY;
int direction;
int speed;
int scene;
color uniColor, uniAura, uniCore;



//dimesional blast nuggets
int[] xPos;
float[] yPos;
float[] speedBD;
//final int numBlastDust = 600; //const variable
int[] dustSize;
color dustColor;


// Static stars
int[] starYend;
int[] starXend;
int[] starYpos;
int[] starXpos;
final int maxStars = 600;
int numStars;
int[] starSize;
int[] starSpeed;
int[] colorChoice;



void setup() {
  size(924, 450);
  smooth();

  //to activate scene 2
  sceneTwoChange = true;

  //little ball code
  ballx = width/2;
  bally = height/2;
  ballSpeed = 5;

  //font
  font = loadFont("myFont.vlw");
  textFont(font);

  numStars = maxStars; 
  uniCenterY = height/2;
  uniCenterX = width/2;
  uniDiamX = uniDiamY = 50;
  direction = 1;
  speed = 1;
  scene = 1;
  uniColor = color(255,random(10, 255),60, 50);
  uniAura = color(random(10, 255),random(10, 255), 255, 20);

  //*************************STARS**********************//
  xPos = new int[maxStars];  //sizing up new arrays
  yPos = new float[maxStars];
  speedBD = new float[maxStars]; 

  //star colors
  dustSize = new int[maxStars];
  dustColor = color(random(0,255));

  //initialize star positions on XY plane
  for (int i = 0; i < numStars; i++){
    xPos[i] = int(random(0, width)); // random across x axis screen
    yPos[i] = int(random(0, height)); // random across y axis screen

    speedBD[i] = random(.1, 40);
    dustSize[i] = int(random(.1, 8));
  }


  //***************************code for static stars*********************
  starYend = new int[maxStars];
  starXend = new int[maxStars];
  starYpos = new int[maxStars];
  starXpos = new int[maxStars];
  starSpeed = new int[maxStars];
  starSize = new int[maxStars];
  colorChoice = new int[maxStars];

  //initilize static stars
  for (int i = 0; i < numStars; i++){
    starYend[i] = int(random(0, height));
    starXend[i] = int(random(0, width));
    starYpos[i] = height/2;
    starXpos[i] = width/2;
    starSpeed[i] = int(speedBD[i]);
    starSize[i] =  int(random(.1, 5));
    colorChoice[i] = int(random(1,255));
  }

  uniCore = color(255, int(random(colorChoice[0],colorChoice[numStars-1])), colorChoice[int(random(0,numStars-1))]);

  /*********************End code for BOTH STARS*******************/
}


void draw () {
  background(0);

  if (key == helpKey)
    helpKeys();
  if (key == numStarKey)
    numStarKey();
  if ((key == small) || (key == medium) || (key == large))
    starSizes();

  noStroke();
  fill(255);
  ellipse(ballx, bally, ballDia, ballDia);
  if (mousePressed == true){
    if ((ballx < mouseX - ballSpeed) && (ballx < width - ballDia/2)&& (ballSpeed >0))
      ballx+= ballSpeed;
    else if ((ballx > mouseX + ballSpeed) && (ballx > 0 + ballDia/2) && (ballSpeed >0))
      ballx-= ballSpeed;
    if ((bally < mouseY - ballSpeed) && (bally < height - ballDia/2)&& (ballSpeed >0))
      bally+= ballSpeed;
    else if ((bally > mouseY + ballSpeed) && (bally > 0 + ballDia/2)  && (ballSpeed >0))
      bally-= ballSpeed; 

        
  }

  if (key == key1)// Scene 1 - Pulsing Ball
    pulsingBall(); 
  else if (key == key2 && (sceneTwoChange == true))// Ball Explodes
    starsExplode();
  else if (scene == 3)// Stars Scatter
    postExplosion();
  else if (key == key3)// Black Hole
    blackHole();
  else if (key == bigEnd)
    bigEndCredits();

  if (key == resetKey)// Reset Key
      resetCode();
}

void keyPressed(){
        if(key == CODED){
        if(keyCode == UP)
        ballSpeed++;
        if ((keyCode == DOWN) && (ballSpeed >= 0))
        ballSpeed--;
      }
    }

void helpKeys(){


  text("Press 's' to start    |    Press 'x' to eXplode", width/10, height/8);  
  text("Press 'b' for Black Hole", width/4, height/4); 

  text("Press 'n' for Number of Stars", width/4, height*.75);
  text("Press 'r' to Reset    |    Press 'h' for Help", width/10, height*.85);
  text("Press 'c' for Credits", width/4, height*.95);



}

void numStarKey(){
  text("Number of Stars", width/4, height/8); 
  text("'1' - small  |  '2' - medium  |  '3' - large", width/10, height/4); 




}//starSizeKey();

void starSizes(){
  if (key == '1')
    numStars = 20;
  else if (key == '2')
    numStars = 300;
  else if (key == '3')
    numStars = maxStars;

}//starSizes();


void pulsingBall(){

  if ((lastKey == key2) || (lastKey == key3)){
    resetCode();
    lastKey = 'a';
  }
  //mousePressed = false;
  uniDiamX+= speed * direction;
  uniDiamY+= speed * direction;
  noStroke();

  //*****************MANY ELLIPSES FOR MORE TEXTURE********************//
  fill(uniColor++);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX, uniDiamY);

  fill(uniAura++);//glow
  ellipse(uniCenterX, uniCenterY, uniDiamX+30, uniDiamY+30);     
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX)+40, random(1, uniDiamY)+40);

  fill(uniCore++);//inner cores
  ellipse(uniCenterX, uniCenterY, uniDiamX-10, uniDiamY-10);
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));

  fill(uniColor++);//outer cores
  ellipse(uniCenterX, uniCenterY, uniDiamX-20, uniDiamY-20);
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX)-6, random(1, uniDiamY)-4);

  /****allow pulsing*****/
  if (uniDiamX <  30) {     
    direction = 1;    
  }
  else if (uniDiamX >= 70) {     
    direction = -1;     
  }




}//pulsingBall()     --    This is for the first scene

void starsExplode(){

  lastKey = key2;  
  noStroke();

  fill(uniColor++);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX, uniDiamY);

  fill(uniAura++);//glow
  ellipse(uniCenterX, uniCenterY, uniDiamX+40, uniDiamY+40);
  ellipse(uniCenterX, uniCenterY, uniDiamX-80, uniDiamY-80);//texture layer
  ellipse(uniCenterX, uniCenterY, random(uniDiamX, width), random(uniDiamY, height));
  ellipse(uniCenterX, uniCenterY, random(uniDiamX, width)-60, random(uniDiamY, height)-40);


  //************** cue blast action ******************//
  if (uniDiamX < (width)) {
    uniDiamX+=140;//horizontal expansion
    uniDiamY+=140;//vertical expansion
    //uniDiamY--;
  }
  else {//rapid mouse-independent scene change
    scene = 3;
    sceneTwoChange = false;
  }

}//starsExplode()   --- This is for scene two

void postExplosion(){

  //draw blast nuggets
  for (int i = 0; i < numStars; i++){
    dustColor = color(random(colorChoice[i], 255), colorChoice[i], colorChoice[i]);
    fill(dustColor);
    noStroke();
    ellipse(xPos[i], yPos[i], dustSize[i], dustSize[i]);

    //move the nuggets away from blast in X form
    if (yPos[i] > height/2) {
      yPos[i]+= speedBD[i];
    }
    else if (yPos[i] < height/2) {
      yPos[i]-= speedBD[i];
    } 
    if (xPos[i] > width/2) {
      xPos[i]+= speedBD[i];
    }
    else if (xPos[i] < width/2) {
      xPos[i]-= speedBD[i];
    }

  }// end blast nuggets SEQUENCE

  // Start static stars burst code
  for (int i = 0; i < numStars; i++) {
    dustColor = color(random(colorChoice[i], 255), colorChoice[i], colorChoice[i]);
    fill(dustColor);
    noStroke();
    ellipse (starXpos[i], starYpos[i], starSize[i], starSize[i]);

    //move the nuggets away from blast in X form
    if (starXpos[i] > starXend[i]+starSpeed[i])                 starXpos[i]-= starSpeed[i];
    else if (starXpos[i] < starXend[i]-starSpeed[i])            starXpos[i]+= starSpeed[i];

    if (starYpos[i] > starYend[i]+starSpeed[i])                 starYpos[i]-= starSpeed[i];
    else if (starYpos[i] < starYend[i]-starSpeed[i])            starYpos[i]+= starSpeed[i];
  }//END static STAR SEQUENCE

  //*****Scene change
  if (key == key3)
    scene = 0;







}//postExplosion() --- This is scene three

void blackHole(){

  lastKey = key3;
  //*****main universe ellipses in reverse*****************lotsa texture
  if (uniDiamX > width) {
    uniDiamX = width; 
    uniDiamY = height;
  }
  noStroke();
  fill(uniColor++);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX, uniDiamY);

  fill(uniAura++);//glow
  ellipse(uniCenterX, uniCenterY, uniDiamX+30, uniDiamY+30);

  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX)+40, random(1, uniDiamY)+40);

  fill(dustColor);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX-10, uniDiamY-10);
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));

  fill(0);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX-20, uniDiamY-20);
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX)-6, random(1, uniDiamY)-4);

  if (uniDiamX > 30) { 
    uniDiamX = uniDiamY-=10; 
  }// compression and shrinkage  

  //draw and pull in blast nuggets
  for (int i = 0; i < numStars; i++){      
    dustColor = color(random(colorChoice[i], 255), colorChoice[i], colorChoice[i]);

    //move the nuggets toward center
    if (yPos[i] > height/2) {
      yPos[i]-= 10;
    }
    else if (yPos[i] < height/2) {
      yPos[i]+= 10;
    } 
    if (xPos[i] > width/2) {
      xPos[i]-= 10;
    }
    else if (xPos[i] < width/2) {
      xPos[i]+= 10;
    } 

    if ((yPos[i] == height/2) || (xPos[i] == width/2)){//removes axial lag
      yPos[i] = height/2;
      xPos[i] = width/2;
    }

    fill(dustColor);
    noStroke();
    ellipse(xPos[i], yPos[i], dustSize[i], dustSize[i]);
    //ellipse(xPos[i], yPos[i], dustSize[i], dustSize[i]);//double nuggets

  }// end blast nugget sequence

  // cue static stars burst in reverse
  for (int i = 0; i < numStars; i++) {
    dustColor = color(random(colorChoice[i], 255), colorChoice[i], colorChoice[i]);

    //move the nuggets toward center
    if (starYpos[i] > height/2) {
      starYpos[i]-= 10;
    }
    else if (starYpos[i] < height/2) {
      starYpos[i]+= 10;
    } 

    if (starXpos[i] > width/2) {
      starXpos[i]-= 10;
    }
    else if (starXpos[i] < width/2) {
      starXpos[i]+= 10;
    } 

    if ((starYpos[i] == height/2) || (starXpos[i] == width/2)){//removes axial lag
      starYpos[i] = height/2;
      starXpos[i] = width/2;
    }

    fill(dustColor);
    noStroke();
    ellipse (starXpos[i], starYpos[i], starSize[i], starSize[i]);

  }// end static star sequence

  //cue LATENT BLACKHOLE RIGHT BEFORE SPAGHETTIFICATION...shrinkage continues until diameter is less than 30
  fill(uniAura++);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX-10, uniDiamY-10);
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));

  fill(uniAura++);//core
  ellipse(uniCenterX, uniCenterY, uniDiamX+20, uniDiamY+20);

  fill(0);// DARK CORES
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX), random(1, uniDiamY));
  ellipse(uniCenterX, uniCenterY, random(1, uniDiamX)+5, random(1, uniDiamY)+5);

  if (key == 'c')
    sceneTwoChange = true;




}//blackHole() ---  This is fourth scene bang hole   DRAMA!!!





void resetCode() {
  sceneTwoChange = true;

  uniCenterY = height/2;
  uniCenterX = width/2;
  uniDiamX = uniDiamY = 50;
  direction = 1;
  speed = 1;
  scene = 1;
  uniColor = color(255,random(10, 255),60, 50);
  uniAura = color(random(10, 255),random(10, 255), 255, 20);


  dustColor = color(random(0,255));

  //initialize star positions on XY plane
  for (int i = 0; i < numStars; i++){
    xPos[i] = width/2; // random across x axis screen
    yPos[i] = height/2; // random across y axis screen

    speedBD[i] = random(.1, 40);
    dustSize[i] = int(random(.1, 8));
  }



  //initilize static stars
  for (int i = 0; i < numStars; i++){
    starYend[i] = int(random(0, height));
    starXend[i] = int(random(0, width));
    starYpos[i] = height/2;
    starXpos[i] = width/2;
    starSpeed[i] = int(speedBD[i]);
    starSize[i] =  int(random(.1, 5));
    colorChoice[i] = int(random(1,255));
  }

  uniCore = color(255, int(random(colorChoice[0],colorChoice[numStars-1])), colorChoice[int(random(0,numStars-1))]);






}// RESET CODE!

void bigEndCredits(){
 
  text("Credits:", width/4, height*.15);  
  text("SHA", width/3, height*.25); 

  text("MAVIN", width/3, height*.40);
  text("ARVIN", width/3, height*.55);
  
  text("Special Thanks to:   ILYA... for motivation", width/10, height*.75);
  
  
  
}


