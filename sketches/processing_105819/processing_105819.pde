
//DECLARE VARIABLES
float xPos1;
float yPos1;
float radius1;
float speed2;
float speed1;
float m1;
float m2;
int scoreL;
int scoreR;

void setup() {
  size(1200, 600);
  background(97, 195, 289);

  speed1 = 3;
  xPos1 = width/2;
  yPos1 = height/2;
  radius1 = random(30, 51);
  speed2 = 3;
  scoreL = 0;
  scoreR = 0;

}

void draw() {
  background(70, 148, 198);
     
   //textFont("font.vlw");
  textSize(30);
  text(scoreL, width/4, 30);
  text(scoreR, width/4*3, 30);
  
  if (xPos1 < 0) {
    
    xPos1 = width/2;
    yPos1 =height/2;
    scoreR = scoreR+1;
  }
  if (xPos1 > 1200) {
    xPos1 = width/2;
    yPos1 =height/2;
    scoreL = scoreL+1;
  }
  
  //draw line
  stroke(255);
  strokeWeight(2);
  line(600, 0, 600, 600);
  
  //draw paddle1;
  fill(255);
   m1= mouseY;
   rect(30, m1, 15, 75, 7);
  
  //draw paddle2;
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==UP) {
       m2= m2-10;
      }
      if (keyCode==DOWN) {
        m2= m2+10;
      }
    }
  }
  
   rect(1170,m2, 15, 75, 7);

  //draw a ball
  noStroke();
  fill(random(0, 255), 225, 225);
  ellipse(xPos1, yPos1, radius1, radius1);

  xPos1+=speed2; //xPos = xPos + 1;
  
  yPos1+=speed1; //yPos = yPos + 1;
    
 
  if ((yPos1< 0)||(yPos1 > 600)) { 
    speed1 = - speed1;
  }
 
 //control the ball bouncing as the side of paddles
  if ((yPos1 >= m1) && (yPos1<=m1+75) && (xPos1>=30) && (xPos1<=30+15)) {
    speed2 = - speed2;
  }
  //paddle right
  if ((yPos1 >= m2) && (yPos1<=m2+75) && (xPos1>=1170) && (xPos1<=1170+15)) {
    speed2 = -speed2;
  }
  //restart the game
  
}
