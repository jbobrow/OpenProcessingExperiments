
color bg = color(255, 255, 255); 
int n = 320;
int score = 0;
int speed = 5;
int m = 320;
int speedvertical =5;
PFont font;

void setup() {  
  size(640, 640);
  smooth(); 
  font = loadFont("portagol-48.vlw"); 
  textFont(font, 60); 
  ellipseMode(CENTER);
}
void draw() {
  background(bg);
  score++;
  
  text("score:"+score, 100, 200);
 
  //speed up and draw vertical ball
  m += speedvertical;
  fill(255,0,0);
  ellipse(width-100,m,25,25);
  
  //speed up and draw horizontal ball
  n += speed;
  fill(0,0,255);
  ellipse(n,height-100,25,25);
  
  //checks if horizontal ball hits the boundaries
  if (n >= width || n <=  0) {
    text("Game Over Blue", 100,300);
     text("\nFinal Score: " + score, 100,300);
    noLoop();
  }
  //checks if vertical ball hits the boundaries
  if (m >= height || m <=  0 ) {
    text("Game Over Red ", 100,300);
    text("\nFinal Score: " + score, 100,300);
    noLoop();
  }
  
  //check if the balls collide
  if (dist(n,height - 100, width - 100, m)<=25){
    text("\nWORLDS COLLIDE!!!\nGame Over");
    noLoop();
  }
  println(n);
}

//mouse controls horizontal ball
void mousePressed() {
  float x = random(4)/10;
  speed *= (1 + x);
  speed = -speed;

}
//any key controls vertical ball
void keyPressed(){
  float x = random(4)/10;
  speedvertical *= (1 + x);
  speedvertical = -speedvertical;
}

