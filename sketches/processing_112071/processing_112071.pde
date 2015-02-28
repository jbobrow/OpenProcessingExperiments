
//************************************************
//Name:circlehitter1_0_1.pde
//Author:Stellios Bonadurer  Date: 9/24/2013
//Purpose:A simple game in which you click on a circle
//************************************************


void setup() {
  size(800, 800); 
  int x = (int)random(width);
  int y = (int)random(height);
  noCursor();
  

  int score = 0;
  int streak = 0;
  int highScore = 0;
  int highStreak = 0;
  final int RADIUS = 20;
  boolean run = false;  
  boolean space = false;
  boolean menu = true;
  boolean a = false;
}
void draw() {
  if (run) {
    gameDraw();
  }
  else if (menu) {
    drawMenu();
  }
  space = false;
}
void drawMenu() {//menu screen
  background(0);
  fill(255);
  textSize(72);
  textAlign(CENTER);
  fill(0,255,0);
  text("Circle Hitter!", width/2, height/2);
  textSize(36);
  text("Press space to continue", width/2, (height/2)+72);
  if (space) {
    run = true;
  }
  fill(255);
  textSize(24);
  text("About:",width/2,height/2+120);
  text("This game is made in processing 2.0.3, and is a ",width/2,height/2+150);
  text("simple game made to demonstrate some basic knowledge of coding",width/2,height/2+180);
  text("How to play:",width/2,height/2+250);
  text("Just try to click on the circle, don't miss",width/2,height/2+280);
}

void gameDraw() { //Game running
  background(0, 255, 0);


  fill(0, 55, 0);
  noStroke();
  ellipse(x, y, RADIUS, RADIUS);

  x += random(6)-3;
  y += random(6)-3;
  constrain(x,0+(RADIUS),width-(RADIUS));
  constrain(y,0+RADIUS,height-RADIUS);

  fill(0);
  stroke(0);

  ellipse(mouseX, mouseY, 2, 2);

  textSize(24);
  textAlign(LEFT);
  text("score: "+score, 50, 50);
  text("streak: "+streak, 50, 80);
  text("Highest Score: " +highScore, 50, 110);
  text("Highest Streak: " +highStreak,50,140);

  if (score > highScore) {
    highScore = score;
  }
  if ( streak > highStreak){
      highStreak = streak;
  }
  if (score < 0) {
    restart();
    
  }

}
void mousePressed() { //Mouse pressed function
  if (run) {
    if (dist(x, y, mouseX, mouseY)<RADIUS) {
      streak+=1;
      score+=3;

      x = (int)random(width);
      y = (int)random(height);
    }
    else {
      score-=5;
      streak = 0;
      background(255, 0, 0);
    }
  }
}
void restart() {//End Game/Restart function
  
  background(255, 0, 0);
  textSize(100);
  textAlign(CENTER);
  text("YOU LOST", width/2, height/2);
  textSize(36);
  text("Highest Score:" +highScore, width/2, (height/2)+40);
  text("Highest Streak: " +highStreak, width/2,(height/2)+80);
  if(a){
      setup();
      draw();
  }
}
void keyPressed() {
  if (key == 32) {
    space = true;
  }
  if (key == 97){
    a == true;
  }
}
