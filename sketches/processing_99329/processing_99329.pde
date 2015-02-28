
PImage ev;
PImage ball;
PVector loc = new PVector(random(250),0);
PVector v = new PVector(0,15);
boolean gamePlay = true;
int maxCount = 15;
int count = 0;
int score = 0;
PVector[] balls = new PVector[maxCount];

void setup() {
  size(250,300);
  background(0,255,25);
  ev = loadImage("eevee icon.jpg");
  ball = loadImage("pokeball.png");
  stroke(0);
  smooth();
  frameRate(50);
}

void draw() {    
  if(gamePlay) {
     background(0,255,25);
     text("Score: " + score, width/3, height/2); 
     image(ev,mouseX-ev.width/2,height-ev.width,ev.width,ev.height);
     loc.add(v);
     image(ball,loc.x,loc.y,ball.width*1.5,ball.height*1.5);
     if(loc.y <= height && loc.y >= height-ev.height && loc.x <= mouseX && loc.x >= mouseX-ev.width) {
       background(0);
       text("AWWWWW! You got caught!" + "\nPress r to restart!", width/4, height/2);
       gamePlay = false;
       score = 0;
       noLoop();
     } else if(loc.y >= height) {
       loc.y = 0;
       loc.x = random(250);
       image(ball,loc.x,loc.y,ball.width*1.5,ball.height*1.5);
       score++;
     }
   }
}
void keyPressed() {
  if( ( key == 'r' || key == 'R' ) && gamePlay == false ) {
    gamePlay = true;
    loop();
  }
}
