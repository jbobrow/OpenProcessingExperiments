
float ballX = 10;
float ballY = 10;
float dX = 50;
float dY = 20;
int [] sea = new int[100];
void setup(){
  size(1200,700);
}
void draw(){
  ballX = ballX + dX;
  ballY = ballY + dY;
  for (int i = 0; i < 100; i++){
    sea[i] = i*2;
    fill(ballX*1.5,ballY*1.5,ballX+ballY);
    ellipse(ballX, ballY,sea[i],sea[i]);
  }
    if (ballX > 1200) {
    dX = -dX;
  }
  if (ballX < 0){
    dX = -dX;}
     if (ballY > 700){
    dY = -dY;
  }
  if (ballY < 0){
    dY = -dY;}
}
