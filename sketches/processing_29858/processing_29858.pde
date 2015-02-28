
PShape flower;
int mode = 0;
//PLANT
float u = 10; // Units = stem height
float a = 0; // Angle
float leafLengthL = 60;
float leafLengthR = 60;
float leafThicknessL = leafLengthL/2;
float leafThicknessR = leafLengthR/2;
float stemThickness = 4;

//rain
float rainColor = 255;
int rainRegion = 40;
int rainY;
int masterRainSpeed = 5;
//int masterRainSpeed2 = masterRainSpeed+ int(random(0.5, 3));
int num = 7;

// obstacle
float obstacleColor = 80;
int obstacleRegion = 40;
int obstacleY;
int masterObstacleSpeed = 6;
//int masterRainSpeed2 = masterRainSpeed+ int(random(0.5, 3));
int obstacleNum = 5;

//RAIN
float[] r = new float[num];
float[] o = new float[obstacleNum];
//top
int topX1 = 0;
int topY = 300;

//font
PFont font;

//score
int z = 0;




void setup() {
  size(800, 450);
  smooth();
  noCursor();

  //rain
  for (int i = 0; i < r.length; i++) {
    r[i] = random(-150, 200);
   
  //font
  font = loadFont("TwCenMT-Regular-48.vlw");
  textFont(font);
  
  //flower
  flower = loadShape("flower.svg");
  }
}

void draw () {
  println(frameRate);

  if(mode == 0) {
    startScreen();
  }else if(mode ==1) {
    playGame();
  }else if (mode==2) {
    endScreen();
  }else if ( z == 50) {
    successScreen();
  }
  
  

  
  //restart game
  if(mode ==2 && mousePressed) {
    mode = 1;
    u = 10;
    leafLengthL = 60;
    leafLengthR = 60;
    leafThicknessL = leafLengthL/2;
    leafThicknessR = leafLengthR/2;
  }
}  
  
  
  void mousePressed() {
    if(mode == 0) {
      mode =1;
    }if (mode==2) {
      mode = 1;
       
         a = 0; // Angle
         u = 10;
         leafLengthL = 60;
         leafLengthR = 60;
         leafThicknessL = leafLengthL/2;
         leafThicknessR = leafLengthR/2;
         


    }
  }


  
  
  
  









