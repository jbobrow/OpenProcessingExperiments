
void setup() {  //setup function called initially, only once
  size(500, 400);
 
 
}

float ballx=200;
float bally=100;
speedx =10;
speedy= 0;
int score;

void draw() {  //draw function loops 
  float platform=50;
  background(255);
  ballx += 1;
  bally += 1; 
  ellipse(ballx, bally,20,20)
  rect(mousex-flatform, height-10,2*platform,10)
  
  fill(0);
  text("Score: " + score, 10, 10);
  }
}
