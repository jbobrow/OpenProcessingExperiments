

  float speedx=1.0;
  float speedy=20.0;
  int ballsize=50;
  float ballX=0;
  float ballY=0;
  
void setup(){
  size(400,200);
  background(50);
 

  noStroke();
  smooth();
  frameRate(30);
  //no variable
}
void draw(){
  //background(204);


   ellipse (ballX,ballY,50,50);
   ballX+=speedx;
   ballY+=speedy;

  if (ballX>=width){
   speedx*=-1;

  }else if(ballX<=0) {
    speedx*=-1;
  }if (ballY>=height){
   speedy*=-1;
  }else if(ballY<=0) {
    speedy*=-1;
  }
  

  if(dist(mouseX,mouseY, ballX,ballY)<=25 && mouseX!=0 && mouseY!=0){
   fill(random(155,255),0,0,random(155,255));
  
  }else{
     fill(0,random(155,255),random(155,255),random(155,255));
  }
   
}

