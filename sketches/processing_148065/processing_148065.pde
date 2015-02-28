
float ballX = 200;
float ballY = 100;
float speedX = 10;
float speedY = 0;
int hit = 0;
int miss = 0;
int game = 0;
float x;
float y;

void setup(){
  result =0;
  movement =10;
  x = 270;
  y = 390;
  size(600,400);
  
  //Lose Condition
  if (miss==10) {
    game = -1;}
  if (game==-1) {
  background(0);
  textSize(50);
  text("You Lose",100,200);}
} 

void draw() {
  if(mousePressed) { hit = 0; miss = 0; }
  float paddle = 1000/(hit+10);
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if(ballY > height){
    speedY = -speedY;
    float distance = abs((x+=50) - ballX);
    if(distance < paddle) hit += 1;
    else miss += 1;
  }
  else speedY += 1;
  
  
  ballX += speedX;
  ballY += speedY;
  
 background(103,94,245);
 noStroke();
 fill(250,15,15);
 ellipse(ballX, ballY, 50, 50);
 fill(227,255,49);
 rect(x,y,200,10); 
 
 fill(0);
 text("score: " + hit, 10 ,20);
 text("miss: " + miss, 10, 40);
 
 if (keyPressed && (key=='a')) {
   x-=10;}
   
 if (keyPressed && (key=='d')) {
   x+=10;}
   
   //Win condition
 if (hit==15) {
   game = 1;}
 if (game==1){
   background(0);
  textSize(50);
  fill(255);
  text("You Win",100,200); }
}


