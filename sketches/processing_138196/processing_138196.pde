

//This is a simple pong game
//The player is given 3 lives 
//The game can be reset by clicking
//the came can be restarted by pressing ENTER

boolean gameStart = false;
boolean keypressed = false;
PImage fractal2;
void setup()
{
   size(800, 600);
   fractal2=loadImage("images2.jpg");
}
   

float ballX= 200;
float ballY= 100;
float speedX=10;
float speedY=0;
int hit=0;
int life=3;

void draw()
{   
  if(gameStart) //if game is over
 {
   textSize(30);
   fill(200);
   image(fractal2,width/2-50,height/2-250,200,200);
   text("you lose", width/2,height/2);
   text("hit: " + hit, width/2, height/2+50);
   text("Press ENTER to start again", width/2-150, height/2+100);
 }
else
{
   if(mousePressed) //to reset the game
 { 
  hit=0 ; life=3; }
  
   float paddle=1000/(hit+10);
   if(ballX<0||ballX>width)
   speedX= -speedX; // to change direction of the ball
   if(ballY>height)
   {
      speedY=-speedY;
      float distance=abs(mouseX-ballX);
      if(distance<paddle)
     { hit+=1; }
      else
     { life-=1;
     if(life==0)
     gameStart=true;
     }
   }
   else speedY+=1;
   
   ballX+=speedX;
   ballY+=speedY;
   background(#050505);
   fill(#F25D94);
   ellipse(ballX , ballY , 40, 40);
   fill(#FAC619);
   rect(mouseX-paddle, height-10, 2*paddle, 100);
   //fill(0);
   fill(#35E3DE);
   textSize(20);
   text("hit: " + hit, 10, 20);
   text("life: " + life, 10, 40);
  
}  }

//if the user presses ENTER after the game is over
void keyPressed() {
 
  if ( key == ENTER) {
    if (gameStart) {
      gameStart = false;
      hit = 0;
      life = 3;
    }
   
    }
  }



 

