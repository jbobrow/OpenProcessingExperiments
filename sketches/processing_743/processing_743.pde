
//Matt Richard

/*import UDP.*;  // code to talk to the light tile
UDPSend udp;*/  // this code was created by Dan Shiffman

//declare variables 
int totalSquares = 144; // var for how many squares you want on the screen, !! must be a square itself 
float rectColorArray[][][][]; // create nested array that holds the rects alpha value
color squareColor;

void setup() {
  size(240, 240);
  background(0);
 // udp = new UDPSend(this,"10.0.9.93",6038,"/Users/matt/Documents/Processing/libraries/UDP/colorkinetics_lib/header","/Users/matt/Documents/Processing/libraries/UDP/colorkinetics_lib/lookup",200,0);
  colorMode(RGB, 100);
  noStroke();
  smooth();

  rectColorArray = new float[floor(sqrt(totalSquares))][floor(sqrt(totalSquares))][3][2];

  for(int i=0; i < sqrt(totalSquares); i++){ 
    for(int j=0; j < sqrt(totalSquares); j++){
      rectColorArray[i][j][0][0] = (i*j)+1;
      rectColorArray[i][j][1][0] = i*j+1;
      rectColorArray[i][j][2][0] = i*j+1;
      rectColorArray[i][j][0][1] = 4;
      rectColorArray[i][j][1][1] = 3;
      rectColorArray[i][j][2][1] = sin(i*j);
    } 
  } 
}

void draw() {

  for(int x = 0; x < sqrt(totalSquares); x++){ 
    for(int y = 0; y < sqrt(totalSquares); y++){
      if(rectColorArray[x][y][0][0] > 0 && rectColorArray[x][y][0][0] < 255){
        rectColorArray[x][y][0][0]+= rectColorArray[x][y][0][1];
        //rectColorArray[x][y][0][0]+= 1;       
      } 
      else {
        rectColorArray[x][y][0][1] *= -1;
        rectColorArray[x][y][0][0] += rectColorArray[x][y][0][1]; 
      }

      if(rectColorArray[x][y][1][0] > 0 && rectColorArray[x][y][1][0] < 255){
        rectColorArray[x][y][1][0]+= rectColorArray[x][y][1][1];
      } 
      else {
        rectColorArray[x][y][1][1] *= -1; 
        rectColorArray[x][y][1][0]+= rectColorArray[x][y][1][1];
      }

      if(rectColorArray[x][y][2][0] > 0 && rectColorArray[x][y][2][0] < 255){
        rectColorArray[x][y][2][0]+= rectColorArray[x][y][2][1];
      } 
      else {
        rectColorArray[x][y][2][1] *= -1; 
        rectColorArray[x][y][2][0]+= rectColorArray[x][y][2][1];
      }

      fill(rectColorArray[x][y][0][0],rectColorArray[x][y][1][0],rectColorArray[x][y][2][0]); 
      //fill(rectColorArray[x][y][0][0],99,99);
      rect(floor((x * (width/(sqrt(totalSquares))))), floor((y * (height/(sqrt(totalSquares))))), floor((width/(sqrt(totalSquares)))), floor((height/(sqrt(totalSquares))))); 
    } 
  }
  //udp.send(); light tile code
}



