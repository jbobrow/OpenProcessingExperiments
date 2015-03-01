
void setup() {
 size(600,400); 
}


float ballX = 200;
float ballY = 100;
float speedX = 10;
float speedY = 0;
int Hit = 0;
int Miss = 0;

void draw() {
  
  if (mousePressed) { Hit = 0; Miss = 0; }
  float paddle = 1000/ (Hit+10);
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if(ballY > height) {
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if(distance < paddle) Hit += 1;
    else Miss +=1;
  } else speedY +=1;
  
  ballX += speedX;
  ballY += speedY;
  
  background(200);
  fill(255, 0, 0);
  smooth();
  noStroke();
  ellipse (ballX, ballY, 50, 50);
  fill(255);
  rect(mouseX-paddle, height-10, 2*paddle, 10);
  
  
 fill(0);
  text ("Hit: " + Hit, 10, 20);
  text ("Miss: " + Miss, 10, 40);
}


