
int direction = 0;
float posX = 100;
float posY = 100;
int radius = 10;

void setup(){
  size(200,400);
  noStroke();
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  rect(width/2,height-40,100,10);
  ellipse(posX,posY,radius,radius);
  if(direction == 0){
    drop();
  } else if(direction == 1){
    rise();
  }
}

void drop(){
posY = posY*1.05;
if(posY*1.05 >= height - 40){
  direction = 1;
}
if(posY >= height - 40){
  direction = 1;
  }
}

void rise(){
posY = posY*.95;
  if(posY <= 50){
   direction = 0;
  }
} 

