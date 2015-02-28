
PImage ev;
PImage ball;
PImage bg;
PImage lbg;
PImage wbg;
PVector loc = new PVector(random(585),0);
PVector v = new PVector(0,25);
boolean gamePlay = true;
int score = 0;

void setup() {
  size(594,750);
  bg = loadImage("background.jpg");
  ev = loadImage("eevee icon.jpg");
  ball = loadImage("pokeball.png");
  lbg = loadImage("lbg.jpg");
  wbg = loadImage("winningbg.JPG");
  stroke(0);
  smooth();
  frameRate(50);
}
  
void draw() {    
  if(gamePlay) {
     background(bg);
     textSize(24);
     text("Score: " + score, 10, 30); 
     image(ev,mouseX-ev.width,
       height-ev.width*1.5,ev.width*1.5,ev.height*1.5);
     loc.add(v);
     image(ball,loc.x,loc.y,ball.width*2.5,ball.height*2.5);
     if(loc.y <= height && loc.y >= height-ev.height*2 
       && loc.x <= mouseX && loc.x >= mouseX-ev.width) {
       background(lbg);
       text("AWWWWW! You got caught!" + 
         "\nPress r to restart!", width/4, 80);
       gamePlay = false;
       score = 0;
       v.y = 25;
       noLoop();
     } else if(loc.y >= height) {
       loc.y = 0;
       loc.x = random(594);
       image(ball,loc.x,loc.y,ball.width*2,ball.height*2);
       score++;
       if( score % 10 == 0 ) { v.y += 5; }
       if( score == 100 ) { v.y += 25; }
       if( score == 200 ) {
         background(wbg);
         text("Either you are a dodging god..." +
           "\nor you left your mouse" + 
           "\non the far left of the screen." + 
           "\nPress r to restart!", 50, height/3);
         gamePlay = false;
         score = 0;
         v.y = 25;
       }
     }
   }
}

void keyPressed() {
  if( ( key == 'r' || key == 'R' ) && gamePlay == false ) {
    gamePlay = true;
    loop();
  }
}

