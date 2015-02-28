
float circleX = 400;
float circleY = 100;
float rad = 20;
float velx = 5;
float vely = 5;

void setup(){
   size(500,500);
   background(0);
   
}


void draw(){
  background(0);
  noStroke();
  fill(0,100,250);
  ellipse(circleX, circleY, rad, rad);
  
  circleX = circleX + velx;
  circleY = circleY + vely;
  
  if(circleX >= width || circleX <= 0){
    velx = -.95*velx;
    
 }if(circleY >= height || circleY <= 0){
   vely = -.95*vely;
  }

}

