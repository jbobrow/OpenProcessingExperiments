
//Matt Richard, ICM  adapted code from Jim Lamiell

//declare variables
int totalSquares = 4*4*4*4; // var for how many squares you want on the screen, !! must be a square itself
int rectAlphaArray[][]; // create nested array that holds the rects alpha value
float alphaChangeRate = 1; // rate of change for the alpha of the rects: i.e. higher # is faster

void setup () {
  size(400,400);

  rectAlphaArray = new int[floor(sqrt(totalSquares))][floor(sqrt(totalSquares))];
  for(int i=0; i < sqrt(totalSquares); i++){
    for(int j=0; j < sqrt(totalSquares); j++){
      rectAlphaArray[i][j] = 255;
    println("rectpoint 1 of x="+i+", y="+j+" = ("+(i * (width/(sqrt(totalSquares))))+", "+(j * (height/(sqrt(totalSquares))))+")");
    }
  }
  
}


void draw(){
  background(0);
  noStroke();

  for(int x = 0; x < sqrt(totalSquares); x++){
    for(int y = 0; y < sqrt(totalSquares); y++){

      if((mouseX > (x * (width/(sqrt(totalSquares))))) && (mouseX < ((x * (width/(sqrt(totalSquares)))) + (width/(sqrt(totalSquares))))) && (mouseY > (y * (height/(sqrt(totalSquares))))) && (mouseY < ((y * (height/(sqrt(totalSquares)))) + (height/(sqrt(totalSquares)))))){
        rectAlphaArray[x][y] = 0;
        
      }
      else{
        if (rectAlphaArray[x][y] < 255) {
          rectAlphaArray[x][y] += alphaChangeRate; 
        }
        fill(255, rectAlphaArray[x][y]);
        rect(floor((x * (width/(sqrt(totalSquares))))), floor((y * (height/(sqrt(totalSquares))))), floor((width/(sqrt(totalSquares)))), floor((height/(sqrt(totalSquares)))));
      } 
    }
  }
}

