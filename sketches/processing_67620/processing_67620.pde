
float ballx = 300;
float bally = 20;
float move_x =2;
float move_y =-2;
 float ball= 0;
 float ball2= 400;

void setup(){
size(400,400);
  
}

void draw(){
    fill(random(255),random(255),random(255));
  rect(mouseX,mouseY,random(100),100);
  fill(0,0,random(255));
  ellipse(random(400),random(400),50,50);
  fill(0,random(256),0);
 ellipse(random(400),random(400),50,50);
  fill(random(256),0,0);
triangle(random(400),random(400),200,200,random(400),random(400));
 
  ellipse(ball,200,50,50);
  ellipse(200,ball,50,50);
  ellipse(ball2,200,50,50);
  ellipse(200,ball2,50,50);
  ellipse(ballx,bally,50,50);
 
     ball=ball+5;
   ball2=ball2-5;

 if (ball2 < 0) {
    ball2=400;
  }
 if (ball > 400){
 ball=0;
 }
  ballx = ballx + move_x;
    bally = bally + move_y;
   
   if (ballx >= width){
   move_x = -move_x;
   }
   if (bally >= height) {
   bally = height;
   move_y = -move_y;
   }
   if(ballx<=0){
  ballx = 0;
  move_x = -move_x;
   }
  if(bally<=0){
  bally=0;
  move_y = -move_y;
   }
 print("resistince is futile ");
  }
  

