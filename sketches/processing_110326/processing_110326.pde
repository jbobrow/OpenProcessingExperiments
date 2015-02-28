
int posX = 0;
int speedx = 5;

void setup() {
  size(500,500);
}

void draw(){
  background(0);
  
  if(mouseX > width/2){
  
    posX = posX + speedx;
  }
  if(mouseX < width/2){
    
    posX = posX - speedx;
  }
  if(posX>=width){
   speedx = -5;
  }

    if(posX <=0){
    speedx = 5 ;
  }
  if (posX <= 0){
    posX=0;
  }
  ellipse(random(width), random(height) , 50,50);
 


}
