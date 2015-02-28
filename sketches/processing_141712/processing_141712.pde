

Static grid;
Block sqrLogo;



void setup() {
  grid = new Static(32);
  sqrLogo = new Block(loadImage("EarthLogo.png"), loadImage("FTLogo.png"), loadImage("SoulLogo.png"), loadImage("TTGLLogo.png"));

  size (750, 750);
}

void draw () {
  background (10, 140, 180);
  noStroke();

  grid.drawStatic();

  sqrLogo.createBlock();
}

void mouseClicked() {
  sqrLogo.generateRandom();
}


void keyPressed() {
  if (key == 'r' || key == 'R') {
    grid.drawStatic();
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      sqrLogo.moveBlock(-20., 0);
    }
    if (keyCode == RIGHT) {
      sqrLogo.moveBlock(20., 0);
    }
    if (keyCode == UP) {
      sqrLogo.moveBlock(0, -20.);
    }
    if (keyCode == DOWN) {
      sqrLogo.moveBlock(0, 20.);
    }
  }
}

class Block {
  //global variables
  PImage img1, img2, img3, img4, thisImage;
  float currentPosX=0, currentPosY=0;
  
  //constructor, also sizes down the images 
  Block(PImage inputImg1, PImage inputImg2, PImage inputImg3, PImage inputImg4) {
    inputImg1.resize(15, 15);
    img1 = inputImg1;
    inputImg2.resize(15, 15);
    img2 = inputImg2;
    inputImg3.resize(15, 15);
    img3 = inputImg3;
    inputImg4.resize(15, 15);
    img4 = inputImg4;
  }

  //picks a random picture
  void generateRandom() {
    float randNum = random(4);
    int randNumint = int(randNum);

    if (randNumint == 0){thisImage = img1;}
    else if (randNumint == 1){thisImage = img2;}
    else if (randNumint == 2){thisImage = img3;}
    else if (randNumint == 3){thisImage = img4;}
  }

  //creates a 4x4 block of the picture
  void createBlock() {  
    for (int i = 0; i < 2; i++)
      for (int j = 0; j < 2; j++)
        if (thisImage != null)
          image(thisImage, currentPosX+i*20+1, currentPosY+j*20+1);
  }
  
  //moves the block
  void moveBlock(float xOffset, float yOffset){
    currentPosX += xOffset;
    currentPosY += yOffset;
  }
  
//  void collisionCheck(Static circle){
//    if (circle.segments[currentPosX][currentPosY] == 0)
//      println("@");
//  }
}

class Numbers{

//the following are 2D array representations of 0-9 and a colon
int[][] zero = {  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},  };
                  
int[][] one = {   {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},
                  {1, 1, 0, 0, 1, 1},  };
                  
int[][] two = {   {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 1, 1},
                  {0, 0, 1, 1, 1, 1},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},  };
                  
int[][] three = { {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},  };

int[][] four = {  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},  };
                  
int[][] five = {  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 1, 1},
                  {0, 0, 1, 1, 1, 1},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},  };
                  
int[][] six = {   {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 1, 1},
                  {0, 0, 1, 1, 1, 1},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},  };
                  
int[][] seven = { {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},  };
                  
int[][] eight = { {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},  };

int[][] nine = {  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 1, 1, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},
                  {1, 1, 1, 1, 0, 0},  };
                  
int[][] colon = { {1, 1, 1, 1},
                  {1, 1, 1, 1},
                  {1, 0, 0, 1},
                  {1, 0, 0, 1},
                  {1, 1, 1, 1},
                  {1, 1, 1, 1},
                  {1, 0, 0, 1},
                  {1, 0, 0, 1},
                  {1, 1, 1, 1},
                  {1, 1, 1, 1},  };
  //this takes a digit as a parameter a returns a 2D array
  int[][] createTimeArray(int digit) {
      if (digit == 0)
        return zero;
        
      else if (digit == 1)
        return one;
        
      else if (digit == 2)
        return two;
        
      else if (digit == 3)
        return three;
        
      else if (digit == 4)
        return four;
        
      else if (digit == 5)
        return five;
        
      else if (digit == 6)
        return six;
        
      else if (digit == 7)
        return seven;
        
      else if (digit == 8)
        return eight;
        
      else if (digit == 9)
        return nine;

      else 
        return null;
    }
 
 
  
}
class Static {
  //Global Variables
  int sizeOfGrid;
  int [][] segments;
  Numbers time = new Numbers();

  //default constructor
  Static(int inputSize) {
    
    sizeOfGrid = inputSize;
    segments = new int[sizeOfGrid][sizeOfGrid];
    createStatic();
    
  }

  //assigns a default value of 1 to every circle in the 2D array
  void createStatic() {

    for (int column = 0; column < sizeOfGrid; column++)
      for (int row = 0; row < sizeOfGrid; row++)
        segments[column][row] = 1;
        
  }
  
  //draws the grid, along with the time displayed
  void drawStatic() {
    int hourTens = hour()/10;          //
    int hourOnes = hour()%10;          //These convert each digit of the clock into a single number
    int minuteTens = minute()/10;      //
    int minuteOnes = minute()%10;      //
    //println("Time:"+hourTens+hourOnes+":"+minuteTens+minuteOnes);       This line is meant for debugging. It will tell you what the time is in XX:XX format via console
    
    int[][] hourDigitTens = new int[6][10];                   //
    hourDigitTens = time.createTimeArray(hourTens);           //
                                                              //
    int[][] hourDigitOnes = new int[6][10];                   //
    hourDigitOnes = time.createTimeArray(hourOnes);           //
                                                              // Assigns a 2D array representation of a Number
    int[][] minuteDigitTens = new int[6][10];                 //
    minuteDigitTens = time.createTimeArray(minuteTens);       //
                                                              //    
    int[][] minuteDigitOnes = new int[6][10];                 //
    minuteDigitOnes = time.createTimeArray(minuteOnes);       //
    

    for (int i = 0; i < sizeOfGrid; i++) {
      for (int j = 0; j < sizeOfGrid; j++) {
        
        fill( i * 255/sizeOfGrid, j * 255/sizeOfGrid, 180);

        //the following 5 if statments could have been combined into 1 if statement, but for readibility, it was broken up. 
        //These check for the correseponding 2D array and draws a circle around them  
        if (i > 0 && i < 7 && j < sizeOfGrid && j > sizeOfGrid-11 && hourDigitTens[j-sizeOfGrid+10][i-1] == 0){
          segments[i][j] = 0;
          stroke(0);
          ellipse( i*20 + 50, j*20 + 50, 15, 15);
        }
        else if (i >= 8 && i < 14 && j < sizeOfGrid && j > sizeOfGrid-11 && hourDigitOnes[j-sizeOfGrid+10][i-8] == 0){
          segments[i][j] = 0;
          stroke(0);
          ellipse( i*20 + 50, j*20 + 50, 15, 15);
        }
        else if (i >= 14 && i < 18 && j < sizeOfGrid && j > sizeOfGrid-11 && time.colon[j-sizeOfGrid+10][i-14] == 0){
          segments[i][j] = 0;
          stroke(0);
          ellipse( i*20 + 50, j*20 + 50, 15, 15);
        }
        else if (i >= 18 && i < 24 && j < sizeOfGrid && j > sizeOfGrid-11 && minuteDigitTens[j-sizeOfGrid+10][i-18] == 0){
          segments[i][j] = 0;
          stroke(0);
          ellipse( i*20 + 50, j*20 + 50, 15, 15);
        }
        else if (i >= 25 && i < 31 && j < sizeOfGrid && j > sizeOfGrid-11 && minuteDigitOnes[j-sizeOfGrid+10][i-25] == 0){
          segments[i][j] = 0;
          stroke(0);
          ellipse( i*20 + 50, j*20 + 50, 15, 15);
        }
        else{
          noStroke();
          ellipse( i*20 + 50, j*20 + 50, 15, 15);
        }
        
      }
    }
    
  }
  
  
}



