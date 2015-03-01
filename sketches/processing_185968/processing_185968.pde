
//////////////////////////////////
// Welcome to RiskBall: A game of strategy
// Goal: Get the highest amount of risk possible
// (by waiting until the timer is low) before time
// runs out!
//
// Controls:
// Arrow keys to move left or right 
// Space bar activates magnetic "top-right" force
// etc. the cube will be attracted to the top right.
// Hit the left/right arrow keys to deactivate magnetic force!
// By: Samuel Fang (btw my High Score is 991)
///////////////////////////////////





float x;
float y;
float s;
float xv;
float yv;
float a;
float b;
float score;
float risk;
void setup() {
  size(500, 500);
  x = random(50, width- 50);
  y = 100;
  s = 20;
  xv = 1;
  yv = 0.5;
  a = random(50, width- 50);
  b = random(50, height-50);
  score = 20;
}

void draw() {
  background(255,255,255);
  rect(x-(s/2), y-(s/2), s, s);
  fill(216, 210, 79);
  rect(a, b, 15, 15);
  fill(255,255,255);
  textSize(30);
  fill(0,0,0);
  text("Timer: "+ (floor(score)), 50, 50);
  text("Risk: "+ (floor(risk)), 50, 100);
  fill(255,255,255);
  if (keyPressed && keyCode == LEFT) {x -= 3;}
  if (keyPressed && keyCode == RIGHT) {x += 3;}
  x += xv;
  y += yv;
  yv += 0.1;
  if (y > height) { yv *= -0.6; y = height;}
  if (x > width) { xv *= -0.8; x = width;}
  if (x < 0) {xv *= 0.2; x = 0;}
  if ( y < 0) {yv *= 0.6; y = 0;}
  
  if (key == ' ') { yv -= 0.3;
  xv += 0.8;}
  
  if (dist(x-(s/2), y-(s/2), a, b)< 50) {
    background(255,255,255);
    fill(0,0,0);
    textSize(50);
    text("Scores:", 0, 200);
    text("Timer: "+ (floor(score)), 0, 300);
    text("Risk: " + (floor(risk)), 0 ,400);
    noLoop();
    
    
   
  }
  if (score <= 0) {
    background(255,255,255);
    fill(0,0,0);
    textSize(50);
    text("Game Over", 0, 200);
    noLoop();
  }
  
  
  score -= 0.02;
  risk += 1;
  
 
}

