
int turneraser = 0;
int LavaX;
int LavaY;
int score;
int difficulty;
int runthrough;
 
int state = 0;
//state is 0,1,2 - it determines which mode that draw is in
  
void setup() {  //setup function called initially, only once
size(600,600);
 
}
  
void draw()
{
int myX=mouseX;
int myY=mouseY;
 
if(state == 0)
{
  LavaX = 300;
  LavaY = 300;
  score = 0;
  difficulty=4;
  runthrough=0;
   
  background(255);
fill(0);
textSize(22);
text("Press the Spacebar to Begin.",25,50);
    
}
 
if (state == 1)
{
  //builds both the lava and the player dot
background(255);
fill(0,0,255);
ellipse(myX,myY,20,20);
fill(255,0,0);
ellipse(LavaX,LavaY,difficulty,difficulty);

fill(0);
textSize(22);
text("You are the blue dot!  Dodge the red one!\nScore: " + score,25,50);
  
if(LavaX<myX)
LavaX+=4;
if(LavaX>myX)
LavaX-=4;
//moves lava to player's dot, by 10 pixels at a time.
if(LavaY<myY)
LavaY+=4;
if(LavaY>myY)
LavaY-=4;
  
  
  
turneraser++;
if (turneraser>5 && turneraser<10)
{
turneraser=0;
}
  
if(dist(LavaX,LavaY,myX,myY)<=difficulty/2)
{
  state = 2;
}
 score++;
 runthrough++;
 if(runthrough >= 10);
 {
 
 runthrough = 0;
 difficulty++;
 }
}
 
if(state == 2)
 
{
 background(0);
fill(255);
textSize(22);
text("You Died to Death!  Press Space to Restart.\nYour score was "+ score + ".",25,50);
 
 
 
 
}
 
}
  
void keyPressed() {
  if(state == 0)
  {
    if(key == ' '){
     state = 1;
    }
  }
  else if (state == 2)
  {
    if(key == ' '){
     state = 0;
  }
   
  }
   
}
