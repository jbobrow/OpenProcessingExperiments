
float posX=320;
float posY=240;
float posA=200;
float posB=300;
float speedX = 8;
float speedY = 8;
float speedA = 8;
float speedB = 8;
int counter = 0;
 
void setup(){
  size(650,500);
  frameRate(60);
  background(255);
}
 //red ghost
void draw(){
  noStroke();
  rect(0,0,width,height);
  if(posX < 0 || posX > width){
    speedX *= -1;
  }
  if(posY < 0 || posY > height){
    speedY *= -1;
  } 
 
  posX += random(speedX);
  posY += random(speedY); 
 
  strokeWeight(random(50,150)); //random stroke weights between 1-150
  stroke(#ff0926,100);//stroke colour (red) and opacity
  point(posX,posY);
  
   fill(#78EBF4,1);//if the fill is put last, it the ghost lines will be on the top
  
 
  
  
    //light blue ghost
  
  if(posA < 0 || posA > width){
    speedA += -1;
  }
  if(posY < 0 || posY > height){
    speedB += -1;
  } 
 
  posA += random(speedA);
  posB += random(speedB); 
 
  strokeWeight(random(10,35)); //random stroke weights between 1-150
  stroke(#78EBF4,100);//stroke colour (blue) and opacity
  point(posX,posY);
  
    noStroke();
  rect(0,0,width,height);
  
}

