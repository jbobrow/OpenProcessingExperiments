
//variable for y position
float posY;
//variable for y direction
float dirY = 1;
//variable for x position
float posX;
//variable for x direction
float dirX = 1;

void setup(){
  size(400,400);
  background(255);
  smooth();
  posY = 0;
  posX = 0;
}

void draw(){
  background(255);
  posY += dirY;
  posX += dirX;
  //set ball to not leave screen
  if(posY > height){
    dirY = -dirY;
  }else if(posY < 0){
    dirY = -dirY;
  }else if(posX > width){
    dirX = -dirX;
  }else if(posX < 0){
    dirX = -dirX;
  }
  //paddle hit effect
  if(posY == mouseY){
    dirY = -(random(1,4));
  }else if(posY == mouseY){
    dirY = random(1,4);
  }else if(posX == mouseX){
    dirX = -(random(3,6));
  }else if(posX == mouseX){
    dirX = random(3,6);
  }
  ellipse(posX,posY,25,25);
  noFill();
  rect(mouseX,mouseY,75,10);
}


