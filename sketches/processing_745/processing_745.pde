
//Matt Richard

/*import UDP.*;  // code to talk to the light tile
UDPSend udp;*/  // this code was created by Dan Shiffman

//declare variables 
int totalSquares = 144; // var for how many squares you want on the screen, !! must be a square itself 
int colorMax = totalSquares;
float rectColorArray[][][][]; // create nested array that holds the rects alpha value
int centerX;
int centerY;
color squareColor;

void setup() {
  size(240, 240);
  background(0);
  //udp = new UDPSend(this,"10.0.9.93",6038,"/Users/matt/Documents/Processing/libraries/UDP/colorkinetics_lib/header","/Users/matt/Documents/Processing/libraries/UDP/colorkinetics_lib/lookup",200,0);
  colorMode(HSB, colorMax);
  noStroke();
  smooth();

  rectColorArray = new float[floor(sqrt(totalSquares))][floor(sqrt(totalSquares))][3][2];
  centerX = 6;
  centerY = 6;

  for(int x=0; x < sqrt(totalSquares); x++){ 
    for(int y=0; y < sqrt(totalSquares); y++){ 
      rectColorArray[x][y][0][0] = (abs(x-6) + abs(y-6))*10;
      rectColorArray[x][y][0][1] = -2;
      rectColorArray[x][y][1][0] = (abs(x-2) + abs(y-2))*10;
      rectColorArray[x][y][1][1] = 1;
      rectColorArray[x][y][2][0] = (abs(x-5) + abs(y-10))*10;
      rectColorArray[x][y][2][1] = 5;
    } 
  } 
}

void draw() {

  for(int x = 0; x < sqrt(totalSquares); x++){ 
    for(int y = 0; y < sqrt(totalSquares); y++){
      if(rectColorArray[x][y][0][0] > 0 && rectColorArray[x][y][0][0] < colorMax){
        rectColorArray[x][y][0][0]+= rectColorArray[x][y][0][1];
      } 
      else {
        rectColorArray[x][y][0][1] *= -1; 
        rectColorArray[x][y][0][0]+= rectColorArray[x][y][0][1]; 
      }

      if(rectColorArray[x][y][1][0] > 0 && rectColorArray[x][y][1][0] < colorMax){
        rectColorArray[x][y][1][0]+= rectColorArray[x][y][1][1];
      } 
      else {
        rectColorArray[x][y][1][1] *= -1; 
        rectColorArray[x][y][1][0]+= rectColorArray[x][y][1][1];
      }

      if(rectColorArray[x][y][2][0] > 0 && rectColorArray[x][y][2][0] < colorMax){
        rectColorArray[x][y][2][0]+= rectColorArray[x][y][2][1];
      } 
      else {
        rectColorArray[x][y][2][1] *= -1; 
        rectColorArray[x][y][2][0]+= rectColorArray[x][y][2][1];
      }

      //fill(rectColorArray[x][y][0][0],rectColorArray[x][y][1][0],rectColorArray[x][y][2][0]); 
      fill(rectColorArray[x][y][0][0], rectColorArray[x][y][1][0], rectColorArray[x][y][2][0]); 
      rect(floor((x * (width/(sqrt(totalSquares))))), floor((y * (height/(sqrt(totalSquares))))), floor((width/(sqrt(totalSquares)))), floor((height/(sqrt(totalSquares))))); 
    } 
  }
  //udp.send(); light tile code
}

void flash(){
  int flash = int(random(50));
  if (flash == 18){
    fill(0,99,99,5);
    rect(0,0,width,height);
  } 
}






