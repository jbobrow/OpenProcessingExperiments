
//Homework 5.1_Functions & Exports
//Created by Adrianne Blossom
//September 23, 2011

void setup() {
  size(400, 400);
  background(50);
}

void draw() {
  if (mousePressed) {
    fill(mouseX, 150, 100, 50);
    figure(mouseX, mouseY);
  }
}

//My function consists of two rectangular figures that change width and height
//when moved across the screen to create an abstract path bounded by a wall.
//Works best when drawn from top left corner.
//Or simple just click to create a composition using figure ground.
void figure(float x, float y) {
  rect(x, y+y, 10+x, 10); //path
  rect(x+x, y, x-4, 10+y); //wall
}


