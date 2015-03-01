
/* @pjs preload="daria_background.jpg" */
int x;
int y;
PImage img;
void setup(){
  size(700,700);
  background(255);
  img = loadImage("daria_background.jpg");
  x = 120;
  y = 120;
}
void draw(){
  image(img,0,0);
  if (keyPressed && (keyCode == UP)){
    y -= 10;
  }
  if (keyPressed && (keyCode == DOWN)){
    y += 10 ;
  }
  if (keyPressed && (keyCode == LEFT)){
    x -= 10;
  }
  if (keyPressed && (keyCode == RIGHT)){
    x += 10;
  }
  if (keyPressed && (key == ' ')){
    y -= 30;
  } 
  fill(255,0,0);
  ellipse(x,y,30,30);
}


