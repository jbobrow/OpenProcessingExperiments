
void setup() {
 size(int(random(300,600)), 300);
}

//circle position
float x = 30;
float y = 191;

//circle motion

float movex = 2;
float movey = 2;

void draw() {
  background(15, 195, 190);
  fill(0);
  text("X: " + str(x) + " "+ "Y: " + str(y), width/2, height/2);
  stroke(255);
  ellipse(x, y, 50, 50);
  x = x + movex;
  y = y + movey;

  // vertical wall to the right
  if (x >= width) {
    movex = -movex;
    println("Right Wall");
  }
  
  //vertical wall to the left
  if(x <= 0){
    movex = -movex;
    println("Left Wall");
  }
  
  //bottom wall
  if (y >= height) {
    movey = -movey;
    println("Bottom Wall");
  }
  
  //top wall
  if (y <= 0) {
    movey = -movey;
    println("Top Wall");
  }
  
}

