
float posX=10;
float posY=0;
float speedX = 1;
float speedY = 6;
int backgroundColor = 255;


void setup() {
  size(300, 300);
}

void draw() {
  background(backgroundColor);
  posX = posX + speedX;
  posY = posY + speedY;
  



  // draw a circle at x,y with diam of 20
  rect(posX, posY, 20, 20 );
  fill(random(0, 100), random(0, 200), random(0, 75));
  
  
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
  
}
