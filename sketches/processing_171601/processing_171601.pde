
int x;
int y;
PImage background;
PImage tank;
PImage tank_left;
PImage tank_right;
PImage tank_for;
PImage tank_down;
 
 
void setup(){
  size(900,700);
  tank = loadImage("tank.png");
  tank_left = loadImage("tank_left.png");
  tank_right = loadImage ("tank_right.png");
  tank_for = loadImage ("tank_for.png");
  tank_down = loadImage ("tank_down.png");
  background = loadImage("background.jpg");
  x = 120;
  y = 120;
}
 
 
void draw(){
  image(background,0,0);
  if (keyPressed && (keyCode == UP)){
    y -= 5;
    
  }
  if (keyPressed && (keyCode == DOWN)){
    y += 5 ;
    image (tank_down);
  }
  if (keyPressed && (keyCode == LEFT)){
    x -= 5;
    tank = tank_left;
  }
  if (keyPressed && (keyCode == RIGHT)){
    x += 5;
    tank= tank_right;
  }
  if (keyPressed && (key == ' ')){
    y -= 5;
  }
 
  image(tank,x,y);
}



