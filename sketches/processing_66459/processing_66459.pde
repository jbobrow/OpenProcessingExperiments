
String awesome;
PFont myFont;

int ballX;
int ballY;
int state;
int fade;

void setup(){
  size(500, 500);
  awesome = "AWESOME!!!!!";
  myFont = loadFont ("Papyrus-48.vlw");
  textFont (myFont, 48);
  fade = 255;
  
  state = 0;
  ballX = 25;
  ballY= 125;
}

void draw(){
  background(150);
  
  fill (255);
  rect(0, 100, 50, 50);
  rect(300, 100, 50, 50);
  rect(0, 400, 50, 50);
  rect(300, 400, 50, 50);
  
  if (state == 1){
   ellipse(ballX, ballY, 5, 5);
  ballX = ballX + 5;
    if (ballX > 300){
     state = 2;
    ballX = 300;
   ballY = 150; 
    } 
  }
  if (state == 2){
    fill (255, 255, 255, fade);
    text (awesome, 150, 50);
    fade = fade -5;
    fill (255);
  ellipse(ballX, ballY, 5, 5);
  ballX = ballX -3;
  ballY = ballY +3;
    if (ballX < 50 && ballY > 400){
    state = 3;
    fade = 255;
    ballX = 50;
    ballY = 425;
    }
  }
 if (state == 3){
   fill (255, 255, 255, fade);
    text ("RADICAL!!!", 150, 50);
    fade = fade -5;
    fill (255);
 ellipse(ballX, ballY, 5, 5);
ballX = ballX +5;
  if (ballX > 300){
   state = 4;
  
  }
 }
  if (state == 4){
   background (0); 
  }
}

void mouseClicked() {
  if(mouseX < 50 && mouseY > 100 && mouseY < 150) {
    state = 1;
  }
}

