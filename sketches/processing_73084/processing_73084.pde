
//Zhaochang He  zhaochah@andrew.cmu.edu
//assignment 7: game

//How to play:
//move the basket to get the following apples, one apple earns 1 points.
//you need to avoid the balls, or your bascket will broken. 
//if your bascket broken three times, game over


//ball variables
float a = 150;
float b = 150;
float c = 230;
float d = 230;
float e = 260;
float f = 260;

//apple variables
float appleX;
float appleY;

//speed factors
float speedA = 2.8;
float speedB = 2.8;
float speedC = 3.6;
float speedD = 3.6;
float speedE = 4.2;
float speedF = 4.2;
float appleSpeed=5;

// general game variables
int count;
int gamePhase;




//setup the stage
void setup(){
  size(700,400);
  background(255);
  count=0;
  gamePhase=0;
  appleX= random(50, width-50);
  appleY=0;
  smooth();
  noCursor();
  
  
}

//----------------------//

void draw(){ 
  background(255);
    
  if (gamePhase == 0 ){ 
    
    showInstructions();
    
  }else if( gamePhase == 1){
    
    playGame();
    
  }else{
    
    gameover();
  }
}




//give the instruction at the begining of the game
void showInstructions(){
 fill(0,220,50);
 text("Welcome to Yejin Game!", width/3, 110);
 text("Yejin is a girl who likes picking APPLES!!", width/3, 140);
 text("Yejin need to use mouse to control the basket to get apples", width/3, 170);
 text("Avoid the balls! Or it will crack the basket and Game Over", width/3, 200);
 text("Press any key to play the game.", width/3, 240 );
//apple
 apple(width/3.7);
 appleY = 130;
 
  //bascket
  fill(130, 40, 30, 90);
  noStroke();
  rect(width/4, 150, 40, 20);
  stroke(100);
  strokeWeight(1);
  line(width/4, 170-15, width/4+40, 170-15); 
  line(width/4, 170-10, width/4+40, 170-10); 
  line(width/4, 170-5, width/4+40, 170-5); 
  line(width/4+10, 170-20, width/4+10, 170); 
  line(width/4+30, 170-20, width/4+30, 170);

  //balls
  noStroke();
  fill(mouseY, mouseX,random(50,150),90);
  ellipse(width/3.7, 200, 30, 30);

  if (keyPressed ==true){
  gamePhase=1;
  }
}


//-----------start the game----//

void playGame(){
  display();
  moveEllipse();
  moveApple();
  bounce();
  basket();
  showScore();
  checkApple();
  checkCollisons();
  
  apple(appleX);

  
}


void gameover()
{
  
   fill( 255, 0, 0 );
   text("GAME OVER", width/2, 70 );
   text("You hit " + count + " apples", width/2, 100 );
   text("Press any key to start a new game", width/2, 150 );
 //reset the location of the balls
    a=random(50,150);
    c=random(150,250); 
    e=random(330,450);   
    
    //press anykey to restart game
    if(keyPressed == true){      
    gamePhase = 1;
    count=0;
    appleX= random(50, width-50);
    appleY=0;
    appleSpeed=5;
    }
   
}



//check the score
void showScore(){
 fill(0);
 text("Collects " + count+ " apples", width/5, height*.9); 
}

//check basket collecting the apples
void checkApple(){
  
  float n = dist(appleX,appleY, mouseX, height-20);
  if (n < 30)
  {
    count++;
    appleY=0;
    appleX = random(50, width-50);
  }   
}

 //check collisons between the balls and basket
void checkCollisons(){
   
  float m = dist(a, b,mouseX,height-20);
  float w = dist(c, d,mouseX,height-20);
  float i = dist(e, f,mouseX,height-20);
  if (m < 20 || w <20 || i<20)
  {

    gamePhase = 2;
 
  }
   
}





//display ellipses  
void display(){
 noStroke();
fill(mouseY, mouseX,random(50,150),90);
ellipse(a, b, 30, 30);
fill(random(50,150),mouseX, mouseY,90);
ellipse(c,d, 40,40);
fill(mouseY, random(100,150), mouseX,90);
ellipse(e,f, 60,60);
}


//move the ellipses
void moveEllipse(){
  a=a+speedA;
  b=b+speedB;
  c=c+speedC;
  d=d+speedD;
  e=e+speedE;
  f=f+speedF; 
}

//bounce the ball when it touch the wall
void bounce(){
 
 if(a<0 || a > width ){
  speedA = -speedA;
 }

if( b<0 || b> height) {
 speedB = -speedB;
 }
 
 if(c<0 || c > width){
  speedC= -speedC;
 }

if( d<0 || d > height) {
  speedD = -speedD; 
 }
 

 if(e<0 || e > width){
 speedE = -speedE;
 }
  
  if( f<0 || f> height) {
 speedF = -speedF;
 }
 
}

//use mouse to control the basket
void basket(){
  fill(130, 40, 30, 90);
  rect(mouseX, height-20, 40, 20);
  stroke(100);
  strokeWeight(1);
  line(mouseX, height-15, mouseX+40, height-15); 
  line(mouseX, height-10, mouseX+40, height-10); 
  line(mouseX, height-5, mouseX+40, height-5); 
  line(mouseX+10, height-20, mouseX+10, height); 
  line(mouseX+30, height-20, mouseX+30, height); 
  }




//set apple functions with arguments
void apple(float appleX){
  fill(237, 28, 36);
  noStroke();
  ellipse(appleX, appleY, 20, 20); 
  
  stroke(0,255,40);
  strokeWeight(3);
  line(appleX-4, appleY-5, appleX, appleY-10); 
}

void moveApple(){
 appleY=appleY+appleSpeed; 
 if(appleY > height-20) {
   appleY=0;
   appleX = random(50, width-50);
 }
}


