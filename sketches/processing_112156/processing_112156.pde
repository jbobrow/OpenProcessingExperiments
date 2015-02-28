
float posX=10;
float posY=0;
float speedX = 1;
float speedY = 6;
int backgroundColor = 255;

float posX2=0;
float posY2=10;

float posX3=300;
float posY3=390;


void setup() {
  size(300, 300);
}

void draw() {
  background(backgroundColor);
  posX = posX + speedX;
  posY = posY + speedY;
  
  
  
  // move circle to right, or changing it's x coord in pos dir every time
  if(posX <= 0){
    speedX = speedX * -1;
    println( "less than is TRUE!" );
  }
  
  //if circle hits right frame wall, return
  if(posX >= width){
   speedX = speedX * -1;
   println( "greater than is TRUE!" );
  }
  
  //if circle hits max width, move up (increase Y)
  if(posY >= height){
    speedY= speedY* -1;
    backgroundColor = 230;
    println( "greater than is TRUE!" );
  }
  
    if(posY <= 0){
      backgroundColor = 100;
    speedY = speedY * -1;
    println( "less than is TRUE!" );
  }
  



  
 noStroke(); 
   rect(posX, posY, 20, 20 );
  fill(random(0, 0), random(0, 255), random(0, 0));
  
  rect(posY, posX, 20, 20 );
  fill(random(0, 255), random(0, 0), random(0, 0));
  
    rect(20, 20,  posX, posY );
  fill(random(0, 255), random(0, 0), random(0, 0));
  
    rect(20, 20,  posY, posX );
  fill(random(0, 255), random(0, 0), random(0, 0));
  
 //switch to second x and y
 
   rect(posX2, posY2, 20, 20 );
  fill(random(0, 0), random(0, 255), random(0, 0));
  
  rect(posY2, posX2, 20, 20 );
  fill(random(0, 255), random(0, 0), random(0, 0));
  
    rect(20, 20,  posX2, posY2 );
  fill(random(0, 255), random(0, 0), random(0, 0));
  
    rect(20, 20,  posY2, posX2 );
  fill(random(0, 255), random(0, 0), random(0, 0));
}
