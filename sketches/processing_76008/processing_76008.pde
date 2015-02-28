
float pacX=1;
float speedVector=2.5;
int lja=30, uja=330;
int ujStep=3;
int ljStep=3;

void setup(){
  size(400,300); 
  ellipseMode(RADIUS);
  fill(255, 255, 0);
  stroke(127);
  smooth();
}

void draw(){
  background(0); 
  
  lja -= ljStep;
  uja += ujStep;
  pacX += speedVector;  
  arc(pacX, 150, 50, 50, radians(lja),radians(uja)); 

  if(lja==0 || lja==30 || lja==210 || lja==180){
    ujStep = -ujStep;
    ljStep = -ljStep;
  }
  
  if(pacX >= width || pacX <= 0){
    speedVector = -speedVector;
    if(speedVector < 0){
      lja = 210;
      uja = 510;
    } else {
      lja = 30;
      uja = 330;      
    }
  }
  
}
