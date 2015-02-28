
/* @pjs preload= "maze.png", "mazeclear.png", "wtf.png", "smileguy1.png", "meowicorn.jpg";*/
/* @pjs font=snap.ttf";*/
PImage smiley;
PImage clearbackground;
PImage meowicorn;
PImage wtf;
String state = "play";
int halfS;
int smX, smY, smSpd;
boolean[][] bg;
int timer = 30;
int gameOver = 0;
int sec = 0;

void setup(){
  size(350, 350);
  textFont(createFont("snap", 32));
  background(255);
  imageMode(CENTER);
  frameRate(20);
  gameOver = second();
  smX = 30;
  smY = 30;
  smSpd = 8;
  halfS = 15;
  clearbackground = loadImage("mazeclear.png");
  smiley = loadImage("smileguy1.png");
  PImage mazebackground = loadImage("maze.png");
  bg = new boolean[mazebackground.width][mazebackground.height];
  color black = color(0);
  color white = color(255);
  color red = color(237,28,36);
  for(int i = 0; i < mazebackground.width; i++){
    for(int j = 0; j < mazebackground.height; j++) {
      color c = mazebackground.get(i, j);
      if(c == black) {
        bg[i][j] = false; }
        else if( c == white) {
        bg[i][j] = true; }
        else if (c == red ) {
        bg[i][j] = true; }
        else{
        }
      }
    }
}

void loser() {
  background(0);
  stroke(255);
  text("YOU RAN OUT OF TIME! Hahaha!", 0, (height)/2);
  exit();
}
void winner() {
  background(0);
  stroke(255);
  text("YOU WON!  Good for you.", 50, (height)/2);
  exit();
}
void draw(){
  if (timer > 0) {
    maze(); 
  }    
  if((smX >= 385 && smX <=420) && (smY >= 440 && smY <= 495)) {
    state = "win";{
      if(state == "win"){
        winner();
        return;
      }
    }
  }
  else if (timer == 0) {
      state = "lose";{
        if(state == "lose"){
          loser();
          return;
        }
      }
    }
}
void maze() {
  if (second() != gameOver) {
    gameOver = second();
    timer -= 1;
  }
  wtf = loadImage("wtf.png");
  background(255);
  meowicorn = loadImage("meowicorn.jpg");
  image(meowicorn, width/2, height/2);
  image(clearbackground, width/2, height/2);
  image(smiley, smX, smY);
  text("Timer: "+timer, 200, 50);
}

void keyPressed() {
  boolean upL = false;
  boolean upR = false;
  boolean doR = false;
  boolean doL = false;
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (smX >= halfS + smSpd) {
        upL = bg[smX - smSpd - halfS][smY - halfS];
        upR = bg[smX - smSpd + halfS][smY - halfS];
        doR = bg[smX - smSpd + halfS][smY + halfS];
        doL = bg[smX - smSpd - halfS][smY + halfS]; {
        if (upL && upR && doR && doL) {smX -= smSpd; }
        else {image(wtf, smX, smY);}}}}          
    if (keyCode == RIGHT){
      if (smX <= width - halfS - smSpd){
        upL = bg[smX + smSpd - halfS][smY - halfS];
        upR = bg[smX + smSpd + halfS][smY - halfS];
        doR = bg[smX + smSpd + halfS][smY + halfS];
        doL = bg[smX + smSpd - halfS][smY + halfS]; {
          if (upL && upR && doR && doL) {smX += smSpd; }
          else {image(wtf, smX, smY);}}}}
    if (keyCode == UP) {
      if (smY >= halfS + smSpd) {
        upL = bg[smX - halfS][smY - smSpd - halfS];
        upR = bg[smX + halfS][smY - smSpd - halfS];
        doR = bg[smX + halfS][smY - smSpd + halfS];
        doL = bg[smX - halfS][smY - smSpd + halfS]; {
          if (upL && upR && doR && doL) {smY -= smSpd; }
          else {image(wtf, smX, smY);}}}}      
    if (keyCode == DOWN) {
      if (smY <= height - halfS - smSpd) {
        upL = bg[smX - halfS][smY + smSpd - halfS];
        upR = bg[smX + halfS][smY + smSpd - halfS];
        doR = bg[smX + halfS][smY + smSpd + halfS];
        doL = bg[smX - halfS][smY + smSpd + halfS]; { 
          if (upL && upR && doR && doL) {smY += smSpd;}
          else {image(wtf, smX, smY);}}}}}}
   
 


