
float posX=400;
float posY=100;
float w=20;
float h=20;
float speedX=4;
float speedY=4;
float ballRadius=10;

float paddX=495;
float paddY;
float paddW=10;
float paddH=60;

void setup(){
  size(500,400);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw(){
  background(0);
  
  //color bar
  for(int cirY=0;cirY<height+20;cirY=cirY+40){
    fill(random(255));
    rect(0,cirY,20,40);
  }
   
   
  //paddle moving with mouseY
  fill(255);
  paddY=mouseY;
  rect(paddX,paddY,paddW,paddH);
  
  
  //make ball move to left
  posX=posX-speedX;
  posY=posY-speedY;
  
  
  //reverse the direction when hit the wall
  if(posX-ballRadius<0){
    speedX=speedX*-1;
  }
  
  if((posY-ballRadius<0) || (posY+ballRadius>height)){
    speedY=speedY*-1;
  }
  
   fill(254,255,5);
   noStroke();
   ellipse( posX, posY, w, h); 
   
   
   //ball hits the paddle
   if((width-posX <= 20)&&(posX<width)&&(posY > paddY-paddH/2)&&(posY < paddY-paddH/2 + paddH)){
       speedX=speedX*-1;
   }
   
   //hit the bar and change color
   if(posX-ballRadius<=10){
     background(random(255),random(255),random(255));
   }  
   
   if (mouseX<width && mouseX>0 && mouseY<height && mouseY>0) {
     noCursor();
  } 
}

void mousePressed(){
  posX=470;
  posY=mouseY;
  speedX=speedX*-1;
} 


