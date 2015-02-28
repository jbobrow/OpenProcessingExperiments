
PImage maze;
boolean touching;
float r = 10;
void setup() {
  size(640, 480);
  smooth();
  maze = loadImage("maze.jpg");
}

void draw() {

  //Test the color of the pixels. Is it dark? 
  color mouse = maze.get(int(mouseX), int(mouseY));
  if (brightness(mouse) <= 50) {
    touching = true;
  } 
  else {
    touching = false;
  }

  //Render the maze image and ellipse
  if (touching) {
    tint(255, 0, 0);
  } 
  else { 
    tint(255);
  }
  image(maze, 0, 0); 
  fill(50);
  ellipse(mouseX, mouseY, r*2, r*2);
}



