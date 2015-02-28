
  float speedy=10.0;
  float speedx=1.0;
 // int ballsize=50;
  float ballX=width/2;
  float ballY=0;
  
void setup(){
  size(400,400);
  background(50);
 

  noStroke();
  smooth();
  frameRate(30);
  //no variable
}
void draw(){
  ballY+=speedy;
  //background(204);
if (mousePressed){
  fill(255);
}else{
 
 fill(random(220,255),random(20,255),random(20,255),random(20,255));
}
   ellipse (width/2,ballY,ballY,ballY);
   //ballX+=speedx;
  

  if (ballX>=width){
   speedx*=-1;

  }else if(ballX<=0) {
    speedx*=-1;
  }
  if (ballY>=height){
   speedy*=-1;
  }else if(ballY<=0) {
    speedy*=-1;
  }
     
}

