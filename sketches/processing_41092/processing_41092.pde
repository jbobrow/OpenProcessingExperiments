
float ballX;
float ballY;
float shadeX;
float shadeY;

void setup(){
  size(200,400);
  ballX = 100;      
  ballY = 150;
  shadeX = 100;
 shadeY = 40;
 
  background(163,277,180);
  smooth();
}

void draw(){
  
  background(163,277,180);

  
//draw wire 
  stroke(255,39,121);
  line(ballX,ballY,ballX-10,ballY+150);

//draw ball
  smooth();
  noStroke();
  fill(255,121,121);
  ellipse(ballX,ballY,75,95);

//base rectangle
  fill(300,400,180,170);
  rect(0,350,200,80);
// shade
   fill(215,216,155);
   ellipse(100,370,shadeX,shadeY);
  

//ball moves up + shade moves
ballY = ballY  - 1;
shadeX = shadeX -1;  
shadeY = shadeY -0.4;

if(shadeX == 100|| shadeX<0  ){
  shadeX =0;
  }
if(shadeY == 50|| shadeY<0  ){
  shadeY=0;
  
  } 

}
// ballon exploded
void mouseClicked() {
  noLoop();
  fill(300,400,180);
  rect(0,350,200,80);
  fill(163,277,180);
  rect(0,0,200,320);
}




