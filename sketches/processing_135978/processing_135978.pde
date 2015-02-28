
float x;
float y;
PImage img;
PFont font;

void setup(){
  size(520, 260);
  background(255);
  img = loadImage("background.png");
  image(img, 0, 0); //sets background.png as background image
  font = loadFont("Gabriola-20.vlw");
  textFont(font); //sets Gabriola-20 as font
}

void draw(){
  image(img, 0, 0); //sets background to refresh
  if(keyPressed && key == CODED){
    if(keyCode == RIGHT){
      x++; //moves ellipse right
    }
    if(keyCode == LEFT){
      x--; //moves ellipse left
    }
    if(keyCode == UP){
      y--; //moves ellipse up
    }
    if(keyCode == DOWN){
      y++; //moves ellipse down
    }
  }
  fill(255, 65); //gives transparency
  ellipse(x, y, 80, 80);
  //following if statements set vertical and horizontal wrap-around
  if(x > width + 25){
    x = 0;
  }
  if(x < -25){
    x = width;
  }
  if(y > height + 25){
    y = 0;
  }
  if(y < -25){
    y = height;
  }
  fill(255); //changes text so it isn't transparent
  text("Hey you! Yes, you! Click the left mouse button for more instructions!", 70, 40);
  if(mousePressed && mouseButton == LEFT){ //allows for conditional text
    text("Control the ellipse in the upper left with the arrow keys. Try it!", 87, 230);
  }
}


