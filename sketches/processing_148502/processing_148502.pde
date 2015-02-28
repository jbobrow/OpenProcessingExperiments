
int Pos = 400;
int Dir = 3;
int posX, posY;
int speedX = 0;
int speedY = 0;
PFont font;
PVector rightpaddle = new PVector(10,250);
PVector leftpaddle = new PVector(790,250);


void setup() {
  size(800, 500);
  background(0);
  font = createFont("Calibri",16,true);
  smooth();
}

void draw() {
  
  //line in the middle
  background(255);
  strokeWeight(5);
  line(width/2,0,width/2,height);
  
  //Score of player 1 and player 2
  background(255);
  textFont(font);
  fill(0);
  textAlign(LEFT);
  text("Player 1 score: 0 ",width/7,50);
  textAlign(RIGHT);
  text("Player 2 score: 0 ",width-150,50);
 
  //paddle 2
  stroke(140,0,180);
  strokeWeight(2);
  fill(0,0,255);
  rectMode(CENTER);
  rect(leftpaddle.x,leftpaddle.y,20,70);
  
  //paddle 1
  stroke(140,0,180);
  strokeWeight(2);
  fill(0,0,255);
  rectMode(CENTER);
  rect(rightpaddle.x,rightpaddle.y,20,70);
  
  //line in the middle
  strokeWeight(5);
  line(width/2,0,width/2,height);
  
  //moving ball
  ellipseMode(CENTER);
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(Pos,255,20,20);
  Pos = Pos + Dir;
  if(Pos > width - 5 || Pos < 5 ){
    Dir= -Dir;
  }
} 
  void keyPressed() {
  if (key == 'w' || key == 'W') {
    if( rightpaddle.y >= 40) 
      rightpaddle.y -= 10;  
  }
  if (key == 's' || key == 'S') {
     if( rightpaddle.y <= height - 40)
      rightpaddle.y += 10;  
  }
  if (keyCode == UP) {
      if(leftpaddle.y >= 40)
      leftpaddle.y -= 10;  
  }
  if (keyCode == DOWN) {
      if(leftpaddle.y <= height - 40)
      leftpaddle.y += 10;   
  }
}
