
//Matt Richard

//declare variables 
int totalSquares = 100; // var for how many squares you want on the screen, !! must be a square itself 
int rectAlphaArray[][]; // create nested array that holds the rects alpha value

void setup () { 
  size(400,400);
  
  rectAlphaArray = new int[floor(sqrt(totalSquares))][floor(sqrt(totalSquares))];
  
  for(int i=0; i < sqrt(totalSquares); i++){ 
    for(int j=0; j < sqrt(totalSquares); j++){ 
      rectAlphaArray[i][j] = round(random(1))*255; 
    } 
  } 
} 


void draw(){  
  for(int x = 0; x < sqrt(totalSquares); x++){ 
    for(int y = 0; y < sqrt(totalSquares); y++){
      fill(rectAlphaArray[x][y]); 
      rect(floor((x * (width/(sqrt(totalSquares))))), floor((y * (height/(sqrt(totalSquares))))), floor((width/(sqrt(totalSquares)))), floor((height/(sqrt(totalSquares))))); 
    } 
  } 
} 

void mousePressed() {
  for(int x = 0; x < sqrt(totalSquares); x++){ 
    for(int y = 0; y < sqrt(totalSquares); y++){ 
      rectAlphaArray[x][y] = round(random(1))*255;
    } 
  } 
}




