
// The components of the water colour
int waterR = 89;
int waterG = 181;
int waterB = 188;

int fishX;
int fishY;

int fishWidth = 50;
int fishHeight = 30;

int fishR = 245;
int fishG = 130;
int fishB = 7;

int tailWidth = 20;
int tailHeight = 20;

int eyeDiameter = 5;

int eyeR = 0;
int eyeG = 0;
int eyeB = 0;

int barrierR = 152;
int barrierG = 131;
int barrierB = 77;

int barrierWidth = 50; 
int barrierHeight= 160;


int score=0;

void setup ()
{
  size (500, 400);
  
  fishX = 0;
  fishY = height / 2;
  
  noStroke ();
  
}

void draw ()
{
  background (waterR, waterG, waterB);
  
  text("SCORE: "+score, 10, 16);
  
if(mousePressed)
  if(mouseX<width/2){
  fishX = mouseX;
  fishY = mouseY;
  }


  fill (fishR, fishG, fishB);
  
  
  int tailX = fishX - fishWidth / 3;
  int tailY = fishY;
  
  triangle (tailX, tailY,
            tailX - tailWidth, tailY - tailHeight / 2,
            tailX - tailWidth, tailY + tailHeight / 2);

  ellipse (fishX, fishY, fishWidth, fishHeight);
  
  int eyeX = fishX + fishWidth / 4;
  int eyeY = fishY - fishHeight / 5;

  fill (eyeR, eyeG, eyeB);

  ellipse (eyeX, eyeY, eyeDiameter, eyeDiameter);
  
  
  //loop that draws the barrier
  for(int i=0; i<2; i++){
  fill(barrierR, barrierG, barrierB);
  rect(width-barrierWidth, 240*i, barrierWidth, barrierHeight);
  }
  
  //collision
 if (fishX+fishWidth/2==width){
   score++;
 }
 if ((fishX+fishWidth/2 >=width-barrierWidth)&&((fishY-fishHeight/2 <= barrierHeight)||(fishY+fishHeight/2 >= height-barrierHeight))){
   score--;
   fishX=width-100000;
  }
 
  fishX = fishX + 1;
  
}



void keyPressed(){
  if(keyCode==UP){
    fishY-=40;
  }
  if(keyCode==DOWN){
    fishY+=40;
  }
}
