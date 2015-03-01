
int x;
int y;
PImage background;
PImage kirby;


void setup(){
  size(500,500);
  kirby = loadImage("kirby.jpg");
  background = loadImage("background.jpg");
  x = 120;
  y = 120;
}


void draw(){
  image(background,0,0);
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
    y -= 10;
  }

  image(kirby,x,y);
}



