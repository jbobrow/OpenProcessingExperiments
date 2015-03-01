
boolean fire = false;
int ballSize = 20;
  
//Randomly spawn balls over x-axis
int RandomX(){
return int(random(600));
}   
int[] ballx = {RandomX(),RandomX(),RandomX(),RandomX(),RandomX()};
int[] bally = {0,0,0,0,0};


void setup(){
size (600, 500);
smooth ();
}
   
void draw(){
background (0);
fill(255);

//"Ship"
stroke (255);
triangle(mouseX-8,500,mouseX+8,500,mouseX,480);
    
  if(fire){
  cannon(mouseX);
  fire = false;
}

Falling();
gameover(); 
}
  
void mousePressed(){
fire = true;
}
   
void Falling(){
//Ball Color
colorMode(RGB);
stroke(#FF0000);
fill (random(255), random(255), random(255), random(255));

//"falling" of the balls    
  for (int i=0; i<5; i++){
  ellipse(ballx[i], bally[i]++, ballSize, ballSize);
}
}

//If a line hits a ball, the ball dissapears 
void cannon(int shotX){
boolean strike = false;
  for (int i = 0; i < 5; i++){
  if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
  strike = true;
  line(mouseX, 565, mouseX, bally[i]);
  ellipse(ballx[i], bally[i]);
  ballx[i] = RandomX();
  bally[i] = 0;
}   
}
 
//If line doesn't hit a ball, it still draws the line
  if(strike == false){
  line(mouseX, 565, mouseX, 0);
} 
}
     
void gameover(){
//If ball hits bottom of thescreen, it's gameover
  for (int i=0; i< 5; i++){
  if(bally[i]==530){ 
  fill(color(255,0,0));
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(20);
  text("GAME OVER", width/2, height/2);
  
       
noLoop();
}  
}
}




