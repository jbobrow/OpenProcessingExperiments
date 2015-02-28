
float eyepositionA;
float eyepositionB;
float eyeheightA=6;
float ballsize=15;
float colorc = 255;
int ballspeedx=-2;
int ballspeedy=2;
int ballX=100;
int ballY=40;
int lookX;
int lookY;
int x=80;
int y;
void setup() {
  size(400,250); // Set the size of the window
  smooth(); // Enables Anti-Aliasing (smooth edges on shapes)
}

void draw() {

  eyepositionA=constrain(eyepositionA,-2,2);
  eyepositionB=constrain(eyepositionB,-1,1.5);
  eyeheightA=constrain(eyeheightA,0,40);


  background(0); // Draw a black background
  y = height/2;

  lookatwhat(lookX,lookY);
  eyedirection();
  blink();
  ball();
  ballmove();
  drawZoog(x,y,40,50,eyepositionA,eyepositionB,eyeheightA);
ballsize=constrain(ballsize,10,100);
}


void blink(){
  if(abs(ballX-x)<60 && abs(ballY-y)<60){
    eyeheightA=eyeheightA+1;
    eyeheightA=constrain(eyeheightA,6,9);
  }
  else{
    eyeheightA=eyeheightA-1;
    eyeheightA=constrain(eyeheightA,6,9);
  }
}

void ballmove(){
  ballX=ballX+ballspeedx;
  ballY=ballY+ballspeedy;
  if (ballX>width || ballX<0){
    ballspeedx = ballspeedx * -1;
  }
  if (ballY>height || ballY<0){
    ballspeedy = ballspeedy * -1;
  }
}    

void ball(){
  fill(colorc);
  ellipse(ballX,ballY,ballsize,ballsize);
}

void lookatwhat(int a,int b){
  if(abs(mouseX-pmouseX)>0.01 || abs(mouseY-pmouseY)>0.01){
    lookX=mouseX;
    lookY=mouseY; 
    //musen
  }
  else if(abs(mouseX-pmouseX)<0.0001 || abs(mouseY-pmouseY)<0.0001){
    lookX=ballX;
    lookY=ballY; //bolden
  }
}

//husk at det tal der udgøres af 50 i følgende er ens med headheight
void eyedirection(){
  if (lookX>x+10){
    eyepositionA=eyepositionA+0.2;
  }
  else if(lookX<x-10){
    eyepositionA=eyepositionA-0.2;
  }
  else {
    eyepositionA=eyepositionA*0.9;
  }
  if (lookY>y+10){
    eyepositionB=eyepositionB+0.2;
  }
  else if (lookY<y){
    eyepositionB=eyepositionB-0.2;
  }
  else{
    eyepositionB=eyepositionB*0.9;
  }
}



void drawZoog(int X, int Y, int headwidth, int headheight, float eyeposition, float eyepositiony, float eyeheight){
  rectMode(CENTER);
  strokeWeight(1);
  stroke(0);

  //arms
  strokeWeight(10);
  stroke(90,140,160);
  line(X-headwidth/2,Y+headheight*0.6,X-headwidth*0.7,Y+headheight*1.1);
  line(X+headwidth/2,Y+headheight*0.6,X+headwidth*0.7,Y+headheight*1.1); 

  //legs
  strokeWeight(10);
  stroke(90,140,90);
  line(X-headwidth/4,Y+headheight*1.5,X-headwidth/4,Y+headheight*1.7);  
  line(X+headwidth/4,Y+headheight*1.5,X+headwidth/4,Y+headheight*1.7); 

  //shoes
  strokeWeight(0);
  fill(134,78,50);
  rect(X-headwidth/4,Y+headheight*1.8,15,8);
  rect(X+headwidth/4,Y+headheight*1.8,15,8);

  //krop
  strokeWeight(1);
  stroke(90,140,160);
  fill(131,187,209);
  rect(X,Y+headheight,headwidth*1.1,headheight*1);
  line(X,Y+headheight/2,X,Y+headheight*1.5);
  noFill();
  rect(X-headwidth/4,Y+headheight/1.3,headwidth/3,headheight/4);
  line(X-headwidth/2.5,Y+headheight/1.4,X-headwidth/9,Y+headheight/1.4);

  //head
  noStroke();
  fill(230,180,90);
  rect(X,Y,headwidth,headheight);

  //rynker
  strokeWeight(0.5);
  stroke(50,30,5);
  line(X-headwidth/3,Y-headheight/7,X+headwidth/3,Y-headheight/7);
  line(X-headwidth/4,Y-headheight/5,X+headwidth/4,Y-headheight/5);

  //øjne
  strokeWeight(3);
  stroke(0); 
  line(X-headwidth/2,Y+headheight/6,X+headwidth/2,Y+headheight/6);  
  noStroke();
  fill(255);
  rect(X-headwidth/4,Y+headheight/6,headwidth/4,headheight/6);
  rect(X+headwidth/4,Y+headheight/6,headwidth/4,headheight/6);
  fill(100,170,160);
  ellipse(X-headwidth/4+eyeposition,Y+headheight/6+eyepositiony,headwidth/8,headwidth/8);
  ellipse(X+headwidth/4+eyeposition,Y+headheight/6+eyepositiony,headwidth/8,headwidth/8);
  fill(0);
  ellipse(X-headwidth/4+eyeposition,Y+headheight/6+eyepositiony,headwidth/13,headwidth/13);
  ellipse(X+headwidth/4+eyeposition,Y+headheight/6+eyepositiony,headwidth/13,headwidth/13);

  //briller
  strokeWeight(3);
  stroke(0);
  noFill();
  rect(X+headwidth/4,Y+headheight/6,headwidth/4,headheight/eyeheight);
  rect(X-headwidth/4,Y+headheight/6,headwidth/4,headheight/eyeheight);  
  rect(X-headwidth/4,Y+headheight/6,headwidth/4,headheight/6);
  rect(X+headwidth/4,Y+headheight/6,headwidth/4,headheight/6);

  //nose
  strokeWeight(2);
  stroke(160,110,20);
  line(X,Y+headheight/4.5,X,Y+headheight/3.5);
  line(X-headwidth/8,Y+headheight/3.3,X+headwidth/8,Y+headheight/3.3);

  //mouth
  strokeWeight(2);
  stroke(50,30,5);
  line(X-headwidth/9,Y+headheight/2.5,X+headwidth/9,Y+headheight/2.5);

}







