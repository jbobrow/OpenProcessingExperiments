
float posY = 25;
float posX = 25;
boolean path = false;
float r=int(random(255));
float g=int(random(255));
float b=int(random(255));
int xPos = 200;
float xVel = 1.5;
float yVel = 1.5;
int YPos = 200;  
int YVel = 1;
int XPos = 200;
int XVel = 1;
PFont fontWin;
PFont fontLose;
  

void setup(){
  size(500,500);
  frameRate(60);
  smooth();
  ellipseMode(CENTER); 
  noStroke();
  fontWin = loadFont("EstrangeloEdessa-48.vlw");
  fontLose = loadFont("Arial-Black-48.vlw");
}

void draw(){
  fill(r-posY/2,g-posX/2,b);
  noStroke();
  rect(0,0,width,height);
  println("R = "+posY/2+ "G = "+posY/2+ "B="+posY/2);
  fill(255);
  ellipse(posX,posY,50,50);
  fill(255, 255, 255, 10);
  fill(0);
}
void keyPressed(){
  if(keyCode == UP && posY >25){
    posY=posY-yVel;
  }
  if(keyCode == DOWN && posY<475){
    posY=posY+yVel;
  }
  if(keyCode == RIGHT && posX>5){
    posX=posX+xVel;
  }
  if(keyCode == LEFT && posX<495){
    posX=posX-xVel;
  }

  for (int i=0; i<6; i++) {
    

    ellipse(0+80*(i+1), YPos, 20, 20);
    
    
    ellipse(XPos, 0+80*(i+1), 20, 20); 
  }

  moveCircles(5); 
}


void moveCircles(int speedMultiplier) {

  if (YPos == 10 || YPos == 490) { 
    YVel = YVel*(-1); 
  }
  YPos = YPos + speedMultiplier*YVel;
  
  if (XPos == 10 || XPos == 490) {
    XVel = XVel*(-1);
  }
  XPos = XPos + speedMultiplier*XVel;
  
  if (posX==475 && posY==475){
    fill(255,255,255);
    textFont(fontWin);
    text("Congrats!",155,height/2-25);
    text("You Win",160,height/2+25);
    stop();
  }
  if(posX>=XPos-5 && posX<=XPos+5 && posY>=YPos-5 && posY<=YPos+5){
    fill(255,0,0);
    textFont(fontLose);
    text("You Lose!",160,height/2-25);
    stop();
  }
  if(posX>=XPos+80-5 && posX<=XPos+80+5 && posY>=YPos-5 && posY<=YPos+5){
    fill(255,0,0);
    textFont(fontLose);
    text("You Lose!",160,height/2-25);
    stop();
  }
  if(posX>=XPos+80*2-5 && posX<=XPos+80*2+5 && posY>=YPos-5 && posY<=YPos+5){
    fill(255,0,0);
    textFont(fontLose);
    text("You Lose!",160,height/2-25);
    stop();
  }
  if(posX>=XPos+80*3-5 && posX<=XPos+80*3+5 && posY>=YPos-5 && posY<=YPos+5){
    fill(255,0,0);
    textFont(fontLose);
    text("You Lose!",160,height/2-25);
    stop();
  }
  if(posX>=XPos-80-5 && posX<=XPos-80+5 && posY>=YPos-5 && posY<=YPos+5){
    fill(255,0,0);
    textFont(fontLose);
    text("You Lose!",160,height/2-25);
    stop();
  }
  if(posX>=XPos-80*2-5 && posX<=XPos-80*2+5 && posY>=YPos-5 && posY<=YPos+5){
    fill(255,0,0);
    textFont(fontLose);
    text("You Lose!",160,height/2-25);
    stop();
  }
}




