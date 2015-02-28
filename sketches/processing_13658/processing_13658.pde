
//----------------
//global variables
//----------------
//essentials
boolean scene[][]; // <- stores current state of the system
boolean nextScene[][];// <- stores the next state of the system


// variable settings
int squareSize = 5; // <- fewer larger or more smaller squares, try 1, 2, 5, 50
int columns = 800;// <- window pixel width
int rows = 600;// <- window pixel height
int fps = 5;// refresh rate, try 1, 5, 100, and 100000;

//---------
//functions
//---------
void setup(){
  frameRate(fps);// <- Set frame rate
  size(columns,rows);// <- Set window size
  columns = width/squareSize;// <- columns = number of squares wide
  rows = height/squareSize;// <- rows = number of squares high
  scene = new boolean[rows][columns];// <- Scene stored as a 2d Array of boolen
  nextScene = new boolean[rows][columns];// <- Next scene stored as a 2d Array of boolean

  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      scene[j][i] = false;// <- Set all 'squares' to off/false
    }
  }
  background(0,128,128);// <- Set the background to a seriously lovely teal.
  makeInitialShape();// <- Set some initial shapes in 'scene'
  showScene();// <- Display the initial state of the machine
  updateScene();// <- Calculate the next frame and update data structures
}

void showScene(){
  //First redraw whole screen
  background(0,128,128);
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      //For each square
      if (scene[j][i] == true){
        //If the square is on/true draw a white square
        fill(255);
        //Use 'squareSize' to calculate where to draw the square
        rect(i*squareSize,j*squareSize,squareSize,squareSize);
      }
    }
  }
}

void updateScene(){
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      //For each square...
      int nCount = neighbourCount(j,i);//<- Count number of true/on neighbours
      if (nCount < 2 || nCount > 3){//If less than 2 OR greater than 3
        // 0, 1, 4, 5, 6, 7, 8
        nextScene[j][i] = false;//Turn square off
      } else {
        if (nCount == 3){//If EQUAL to 3
          //3
          nextScene[j][i] = true;//Turn square on
        } else {//None of the above
          // 2
          nextScene[j][i] = scene[j][i];//Copy current value
        }
      }
    }
  }
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      //For each square...
      scene[j][i] = nextScene[j][i];//<- Copy 'nextScene' value to 'scene'
    }
  }
}

int neighbourCount(int y, int x){//<- Function to count true/on neighbours
  int result = 0;//<- Variable that stores the value to return
  
  
  if(x < columns-1){//If the square isn't on the far right
    if(isLive(y,x+1)){//and if there's a true/on square to the right
      result++;//Add one to result
    }
  }
  if(x > 0){//If the square isn't on the far left
    if(isLive(y,x-1)){//and if there's a true/on square to the left
      result++;//Add one to result
    }
  }
  if(y < rows-1){//If the square isn't on the bottom
    if(isLive(y+1,x)){//and if there's a true/on square to the bottom
      result++;//Add one to result
    }
  }
  if(y > 0){//If the square isn't on the top
    if(isLive(y-1,x)){//and if there's a true/on square to the top
      result++;//Add one to result
    }
  }
  if(y > 0 && x > 0){//If the square isn't on the far left or top
    if(isLive(y-1,x-1)) {//and if the top left neighbour is true/on
      result++;//Add one to the result
    }
  }
  if(y > 0 && x < columns-1){
    if(isLive(y-1,x+1)) {//and if the top right neighbour is true/on
      result++;//Add one to the result
    }
  }
  if(y < rows-1 && x > 0){
    if(isLive(y+1,x-1)) {//and if the lower left neighbour is true/on
      result++;//Add one to the result
    }
  }
  if(y < rows-1 && x < columns-1){
    if(isLive(y+1,x+1)) {//and if the lower right neighbour is true/on
      result++;//Add one to the result
    }
  }
  /*
  This code here to show you another way of doing
  calculating the same result. I've basically collapsed
  both if statements into one, with some boolean logic
  && = AND
  */
  
  //Also see this other way of commenting code
  
  /*
  if(y > 0 && x > 0 && isLive(y-1,x-1)){//top left
    result++;
  }
  if(y > 0 && x < columns-1 && isLive(y-1,x+1)){//top right
    result++;
  }
  if(y < rows-1 && x > 0 && isLive(y+1,x-1)){//bottom left
    result++;
  }
  if(y < rows-1 && x < columns-1 && isLive(y+1,x+1)){//bottom right
    result++;
  }*/
  
  return result; // <- Return 'result' to whatever called 'neighbourCount(y,x)'
}

//Simple function to check a cell in an array and return its value
boolean isLive(int y, int x){
  if(scene[y][x] == true){
    return true;
  } else {
    return false;
  }
  /*This code have been written as the single line
  return scene[y][x]
  *///as the values are already boolean true/false values
}

void o(int y, int x){
  //One liner to set a chosen cell to true.
  //Defined as an x,y offset from the top left corner
  scene[y][x] = true;
}

void c(int y, int x){
  //One liner ro set a chosen cell to true.
  //Calculated as an x,y offset from the center of the screen
  scene[(rows/2)+y][(columns/2)+x] = true;
}

void draw(){
  //As we've done all the work in the functions,
  //'draw' just needs to call these functions.
  showScene();
  updateScene();
}

void makeInitialShape(){//<- Function to set some initial shapes
 
  //R-pentomino
  //change (false) to (true) to see it
  if(true){
    //These locations activated directly affecting values in 'scene'
    //Simple calculations with variables used rather than direct values
    scene[(rows/2)][(columns/2)] = true;
    scene[(rows/2)-1][(columns/2)] = true;
    scene[(rows/2)][(columns/2)-1] = true;
    scene[(rows/2)+1][(columns/2)] = true;
    scene[(rows/2)-1][(columns/2)+1] = true;
  }

  //change (false) to (true) to see it
  //Glider in the top-left
  if(false){
    //These locations activated by directly affecting values in 'scene'
    scene[10][10] = true;
    scene[9][10] = true;
    scene[8][9] = true;
    scene[10][9] = true;
    scene[10][8] = true;
  }

  //Couple of stable (boring) squares
  //change (false) to (true) to see it  
  if(false){
    //These values activated by using the two functions 'o' and 'c';
    o(0,1);
    o(1,1);
    o(1,0);  
    o(0,0);  
  
    c(0,0);
    c(1,0);
    c(0,1);
    c(1,1);
  }
  
  //Cross in the center
  //change (false) to (true) to see it
  if(false){
    //These locations activated directly affecting values in 'scene'
    //Simple calculations with variables used rather than direct values
    scene[rows/2][columns/2] = true;
    scene[(rows/2)+1][columns/2] = true;
    scene[(rows/2)-1][columns/2] = true;
    scene[rows/2][(columns/2)+1] = true;
    scene[rows/2][(columns/2)-1] = true;
  }
  
  //A selection of oscillators
  //change (false) to (true) to see it
  if(false){
    //Toad in frame 1
    o(2,2);
    o(2,3);
    o(2,4);
    o(3,1);
    o(3,2);
    o(3,3);
    
    //Beacon
    o(2,7);
    o(2,8);
    o(3,7);
    o(4,10);
    o(5,10);
    o(5,9);
    
    //Lightweight spaceship (LWSS)
    o(10,10);
    o(12,10);
    o(13,11);
    o(13,12);
    o(13,13);
    o(13,14);
    o(12,14);
    o(11,14);    
    o(10,13);

    //Queen Bee Shuttle
    c(0,0);
    c(-1,0);
    c(1,0);
    c(-2,-1);    
    c(-3,-2);
    c(-3,-3);
    c(2,-1);
    c(3,-2);
    c(3,-3);
   
    c(0,-40);
    c(-1,-40);
    c(1,-40);
    c(-2,-41);    
    c(-3,-42);
    c(-3,-43);
    c(2,-41);
    c(3,-42);
    c(3,-43);
    
    c(0,-30);
    c(1,-30);
    c(0,-31);
    c(1,-31);
    
    c(0,-50);
    c(1,-50);
    c(0,-51);
    c(1,-51);  
    
    //3-glider synthesis of a pentadecathlon
    //Glider 1
    c(1,30);
    c(2,30);
    c(3,30);
    c(3,31);
    c(2,32);
    
    //Glider 2
    c(5,26);
    c(5,25);
    c(5,24);
    c(6,26);
    c(7,25);
    
    //Glider 3
    c(7,31);
    c(7,32);
    c(8,32);
    c(8,33);
    c(9,31);
  }
  
  //Diehard in the center
  //change (false) to (true) to see it
  if(false){
    c(0,-3);
    c(0,-2);
    c(1,-2);
    c(-1,3);
    c(1,2);
    c(1,3);
    c(1,4);
  }
  
  //Acorn in the center
  //change (false) to (true) to see it
  if(false){
    c(0,0);
    c(-1,-2);
    c(1,-3);
    c(1,-2);
    c(1,1);
    c(1,2);
    c(1,3);
  }
  
  //Fewest initial squares (10) Infinite growth pattern
  //change (false) to (true) to see it
  if(false){
    c(0,0);
    c(-1,0);
    c(-2,0);
    c(1,-2);
    c(2,-2);
    c(2,-4);
    c(-1,2);
    c(-2,2);
    c(-3,2);
    c(-2,3);    
  }
  
  //Smallest initial area (5x5) Intinite growth pattern
  //change (false) to (true) to see it
  if(false){
    c(-2,-2);
    c(-2,-1);
    c(-2,0);
    c(-2,2);
    c(-1,-2);
    c(0,1);
    c(0,2);
    c(1,-1);
    c(1,0);
    c(1,2);
    c(2,-2);
    c(2,0);
    c(2,2);
  }
  
  //1D initial Infinite Growth Pattern
  //change (false) to (true) to see it
  if(false){
    //try this with squaresize = 2, columns 800, rows 600;
    o(rows/2,46);
    o(rows/2,45);
    o(rows/2,44);
    o(rows/2,43);
    o(rows/2,42);
    o(rows/2,40);
    o(rows/2,39);
    o(rows/2,38);
    o(rows/2,37);
    o(rows/2,36);
    o(rows/2,35);
    o(rows/2,34);
    o(rows/2,27);
    o(rows/2,26);
    o(rows/2,25);
    o(rows/2,21);
    o(rows/2,20);
    o(rows/2,19);
    o(rows/2,18);
    o(rows/2,17);
    o(rows/2,15);
    o(rows/2,14);
    o(rows/2,13);
    o(rows/2,12);
    o(rows/2,11);
    o(rows/2,10);
    o(rows/2,9);
    o(rows/2,8);
    
  }
}

