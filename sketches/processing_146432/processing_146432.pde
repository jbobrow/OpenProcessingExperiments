
/* @pjs preload="board.jpg" */
int x;
int y;
int z;
int w;
PImage img;
PImage stamp;
void setup(){
  size(600,400);
  img = loadImage("board.jpg");
  stamp = loadImage("stamp.jpg");
  background(255);
  x = 10;
  y = 10;
  z = random(600);
  w = 50;
}
void draw(){
  if (keyPressed){ 
    fill(255,0,0); //any key pressed and shape color changed to red
  } else {
    fill(0); // shapes intially filled with black
  }
  if (keyPressed &&(key == ' ')){ //beginning new painting
    background(255);
  }
  if (keyPressed &&(key == 'q')){ //ouija board image appear on screen
    image(img,0,0);
  }
  if (mousePressed == true && keyPressed &&(key == 't')){ //create light green stroked shapes to represent outline of game piece
     stroke(240,245,203);
     noFill();
     ellipse(mouseX, mouseY, w, w);
  }
  if (mousePressed == true && keyPressed &&(key=='e')){
    image(stamp, mouseX, mouseY);
  }
  if (keyPressed &&(keyCode == UP)){ //increasing x, depending on what brush
    x += 5;
  }
  if (keyPressed &&(keyCode == DOWN)){ //decreasing x
    x -= 5;
  }
  if (keyPressed &&(keyCode == LEFT)){ //increasing y
    y += 5;
  }
  if (keyPressed &&(keyCode == RIGHT)){ //decreasing y
    y -= 5;
  }
  if (mousePressed == true &&(mouseButton == LEFT)){ //draw a square
    rect(mouseX, mouseY, x, y);
  }
  if (mousePressed == true &&(mouseButton == RIGHT)){ //draw a circle
    ellipse(mouseX, mouseY, x, y);
  }
}


