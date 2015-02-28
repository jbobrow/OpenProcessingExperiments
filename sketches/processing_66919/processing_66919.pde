
int posY;
boolean ballUp;

void setup(){
 size(500, 500);
 
}

void draw(){
  background(204, 119, 34);
  ellipse(250, posY, 60, 60);

  if(posY < 30){
  ballUp = false; 
  }

  if(ballUp == false){  
  posY+=5;
  }
  
  if(posY > 470){
   ballUp = true;
  }
  
  if(ballUp == true){
   posY -=5; 
  }
  
}
