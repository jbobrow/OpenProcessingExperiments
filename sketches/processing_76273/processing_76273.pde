
int life = 0;
PImage maze;
PFont font;
int lost = 0;
int loser=0;
int health =6;
int timeLast = 0;
int time = 10;
int winner = 0;


void setup() {
  smooth();
  size(450, 600);
  font = loadFont("NoneShallPass-48.vlw");
  maze = loadImage("maze.png");
  timeLast=second();
  mouseX=100;
  mouseY=100;
}
void draw() {
  frameRate(20);


  int playerx=mouseX;
  int playery=mouseY;
  background(255);
  noCursor();
  image(maze, -100, -150);
  //you lose text
  textFont(font, 53);//font choice and size`

  life = get(mouseX, mouseY);
  println(time+" time");

  //create 10 second timer
  if (time<=0) {
    textFont(font, 100);
    text("you", 100, 200);
    text("lose", 100, 275); 
    text("bro", 100, 350);
  }
  if (second()!=timeLast) {
    timeLast=second();
    time-=1;
  }
  if (time<0) {
    exit();
  }


  if ((playerx<450 && playerx>0) && (playery<600 && playery>0)) {//keep player on feild
    fill(255);
    ellipse(playerx, playery, 10, 10);
  }
  fill(255,0,0);
  if (life!=-1) {
    fill(255, 0, 0);
    loser=-1;
    lost = lost+1;
  }
  if (lost> 1 && lost<10 && loser==-1) {
    text("no problem", 100, 200);
    health = 5;
  }
  if (lost >10 && lost<20 && loser==-1) {
    text("thats ok", 100, 200);
    text("AGAIN", 100, 250);
    health = 4;
  }
  if (lost >20 && lost<30 && loser==-1) {
    text("i forgive u", 100, 200);
    health= 3;
  }
  if (lost >30 && lost<40 && loser==-1) {
    text("try harder", 100, 200);
    text("please", 100, 250);
    health = 2;
  }
  if (lost>40 && lost<50 && loser==-1) {
    text("are u even", 100, 200);
    text("trying?", 100, 250);
    health = 1;
  }
  if (lost>50 && lost<60 && loser==-1) {
    textFont(font, 100);
    text("you", 100, 200);
    text("lose", 100, 275); 
    text("bro", 100, 350);
    health =0;
  }
  if (lost>62) {
    exit();
  }

  if (life!=-16777216) {
    fill(255);
    loser = 0;
  }
  if ((mouseX>320 && mouseX<320+52) && (mouseY>550 && mouseY<550+40) && health>0) {
    fill(0, 0, 255);
    rect(320, 550, 52, 40);//you winnnn
    text("YOU WIN", 100, 300);
    winner=winner+1;
  }
  if (winner>=1) {
    fill(0, 0, 255);
    text("YOU WIN", 100, 300);
  }
  if (winner>=10) {
    exit();
  }

  ///HEALTH DISPLAY
  fill(0, 0, 0);
  textFont(font, 20);
  text("Health: "+health, 2, 585);

  translate(120, 563);
  scale(.2);
  beginShape(); 
  fill(255, 0, 0); 
  //HEART
  vertex(75, 40); 
  bezierVertex(75, 37, 70, 25, 50, 25); 
  bezierVertex(20, 25, 20, 62.5, 20, 62.5); 
  bezierVertex(20, 80, 40, 102, 75, 120); 
  bezierVertex(110, 102, 130, 80, 130, 62.5); 
  bezierVertex(130, 62.5, 130, 25, 100, 25); 
  bezierVertex(85, 25, 75, 37, 75, 40); 
  endShape();
  scale(5);
  translate(-120, -563);

  //time display
  fill(0);
  text("time",200,585);
  fill(255,0,0);
  text(time, 250, 585);
  //start display
  textFont(font, 15);
  fill(0, 255, 0);
  text("start", 80, 11);
  text("here", 85, 25);
  //score display
  textFont(font, 30);
  fill(0);
  text("score",300,590);
  fill(255,0,255);
  text(time+health,400,590);
  
}


