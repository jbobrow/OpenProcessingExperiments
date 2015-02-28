
color bg = color(255, 255, 255); 
int n = 320;
int score = 0;
int speed = 5;
PFont font;

void setup() {  
  size(640, 480);
  smooth(); 
  font = loadFont("Batang-48.vlw"); 
  textFont(font, 16); 
}
void draw() {
  background(bg);
  score++;
  fill(0);
  text("score:"+score, 300, 200);
  n += speed;
  ellipse(n,height/2,25,25);
  if (n >= 640 || n <=  0 - 25 ) {
    text("Game Over | Final Score: " + score, 300,300);
    noLoop();
  }
  println(n);
}
void mousePressed() {
  float x = random(4)/10;
  speed *= (1 + x);
  speed = -speed;
}


