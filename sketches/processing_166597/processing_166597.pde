
Ball myBall;
Ball myBall2;
Ball myBall3;

void setup(){
  size(600,600);
  myBall= new Ball(200,10);
  myBall2= new Ball(100,10);
  myBall3= new Ball(400,10);
}

void draw(){
  if (key == 'q' || key == 'Q'){
      shape();}
  else if (key == 'w' || key == 'W'){
      recognition();}
  else if (key == 'e' || key == 'E'){
      learning();}
}

void shape(){
  smooth();
  background(0);
  //INITIALIZE
  
  noStroke();
  //CALL FUNCTIONALITY
  myBall3.run();
    fill(#FC8570);
  myBall.run();
    fill(#9DDDF0);
  myBall2.run();
    fill(#A8EA85);
   
}

void recognition(){
  noStroke();
  background(0);
  textSize(19);
  fill(150,140,124);
  text("Click quickly.",5,140,160);
  textSize(14.5);
  text("Was there a color difference in a block?",5,170,160);
  rect(100,300,100,100);
    if(mousePressed){
    fill(255);
    fill(#1A1A1A);
  }
  rect(300,300,100,100);
  fill(255);
  rect(100,100,100,100);
  rect(200,200,100,100);
  rect(400,400,100,100);
  rect(0,0,100,100);
  rect(500,500,100,100);
  rect(400,0,100,100);
  rect(200,0,100,100);
  rect(0,200,100,100);
  rect(300,100,100,100);
  rect(200,400,100,100);
  rect(400,200,100,100);
  rect(0,400,100,100);
}

void learning(){
   colorMode(HSB, 500,500,500,500);{
  for (int i = 0; i <= 500; i++) {
    for (int j = 0; j < 500; j++) {
      stroke(i, j, 500);
      point(i, j);
  }
  fill(0);
  text("Don't click.",152,100);
  textSize(40);}
  if(mousePressed){
    background(0);
    textSize(40);
    fill(#FFFFFF);
    text("See what you did?",100,400);
  }
}
}
  //GLOBAL VARIABLES(LOCATION, SPEED)
class Ball{
  float x=0;
  float y=0;
  float speedX=4;
  float speedY=0.5;
  

  //CONSTRUCTOR(HOW TO BUILD THE CLASS,INITIALIZE VARIABLES)
  Ball(float _x,float _y) {
    x=_x;
    y=_y;
}

  //FUNCTIONS(BREAK DOWN COMPLEX BEHAVIOR)
  void run(){
    display();
    move();
    bounce();
    gravity();
}
  void gravity(){
    speedY+=0.2;
}
  void bounce(){
    if(x>width){
      speedX=speedX*-1;
    }
    if(x<0){
      speedX=speedX*-1;
    }
    if(y>height){
      speedY=speedY*-1;
    }
    if(y<0){
      speedY=speedY*-1;
    }
}
  void move(){
    x=x+speedX;
    y=y+speedY;
}
  void display(){
    ellipse(x,y,20,20);
  }
}




