
float mouthSize;
float pacX;
float pacY;
float velocity;

void setup () {
  size (750, 750);
  background (0);
  mouthSize = PI/5;
  pacX = 100;
  pacY = height/2;
  velocity = 2;
  fill(255, 255, 0);
}

void draw () {
  if (dist(mouseX, mouseY, pacX, pacY)<100) {
    println("You win!");
  }
  if (pacX>width+100) 
    pacX =-100;
  background (0);
  //heres a loop that draws 10 dots
  stroke(255);
  strokeWeight(5);
  for (int dotX =0; dotX <= 675; dotX+=75) {   
    if (pacX<dotX) {                          //if pacman is farther than the dot, it wont be drawn
      point(dotX, height/2);
    }
  }
  pacX+=velocity;                       //pacman movement
  fill(255, 255, 0);
  stroke(0);
  strokeWeight(1);
  arc(pacX, pacY, 200, 200, mouthSize, 2*PI-mouthSize);
}

