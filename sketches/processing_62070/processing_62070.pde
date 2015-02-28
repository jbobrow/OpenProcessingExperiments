
PImage img;
void setup() {
  size(500,313);
  img = loadImage("brickwall.JPG"); 
  smooth();
   
}
float circleA = 100;
float circleB = 50;
float speedA = 10;
float speedB = 5;
int points = 0;
int miss = 0;
boolean gamestate = false;


void draw() {
  //start is set to false until the player clicks on the screen
  if(gamestate != true) {
    
    textSize(20);
    background(img);
    textAlign(CENTER);
    fill(225);
    text("Click Anywhere to Start", width/2 , height/2);
    points = 0;
    miss = 0;
    if(mousePressed) {
    gamestate = true;
    }
 } else {
  float paddle = 1000 / (points + 10);
  background(img);
  if(circleA < 0 || circleA > width) 
    speedA = -speedA;
  if(circleB > height){
    speedB = -speedB; 
    float distance = abs(mouseX - circleA);
  if (distance < paddle)
      points += 1;
    else miss += 1;  
  } 
  else 
    speedB += 1;  
  
  circleA = circleA + speedA;
  circleB = circleB + speedB;
  //background(0,0,100);
  rect(mouseX-paddle,height-10,100,125);
  ellipse(circleA, circleB,35,35 );
  fill(224,225,0);
  text("points: " + points, 60, 40);
  text("miss: " + miss, 60, 60);
  
  if(miss == 5){ 
    //textSize(18);
    text("NOT SO EASY HUH?!?!!?!", 250, 50);
      }
  if(miss == 20) {
      text("IT'S JUST GOIN TO KEEP GETTING HARDER!!!", 250,70);
      }    
  if(miss == 30) {
      text("IT'S NOT GOING TO GET ANY EASIER!!!",250,70);
      }
  if(points == 40) {
      text("GOOD JOB!!!",200,70);
  } else if (points >= 41) {
      text("CLICK ANYWHERE TO RESET YOUR SCORE");
  }    
  
  }
} 
  void mousePressed() {
   if(gamestate == mousePressed && gamestate == false)
    gamestate = true; 
  }




