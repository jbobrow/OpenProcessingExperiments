
PImage pacman;
PImage ghost;
PImage cherries;
PImage background;
int numpacs = 10;
int numghost = 1;
int frate = 60;
int time = 0;

void setup(){
  size(700,700);
  frameRate(frate);
  pacman = loadImage("pacman.png");
  ghost = loadImage("ghost.png");
  cherry = loadImage("cherries.png");
  background = loadImage("pacmanbackground.jpg");
  for (int i = 0; i < numpacs; i++){
    pacman[i] = new Pacman (random(50,700),random(50,700), random(-10,10),random(-10,10));
  }
  for (int i = 0; i < numghost; i++){
    ghost[i] = new Ghost(random(50,700),random(50,700),random(2,3),random(2,3));
  }
   for (int i = 0; i < numpacs; i++){
    cherry[i] = new Cherry(pacman[i].x,pacman[i].y,random(1,2),random(1,2));
  }
  
}

void draw(){
  
  image(background,0,0);
  for (int i = 0; i < numpacs; i ++) {
  pacman[i].move();
  pacman[i].draw();
  }
  
  for (int i = 0; i < numghost; i ++) {
  ghost[i].move();
  ghost[i].draw();
  }
 
 time ++;
}

class Pacman {

  float x;
  float y;
  float x_speed;
  float y_speed;
  boolean dead;
  int dead_to_ghost;
  
  Pacman (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed) {
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
    
  }
  
  void draw(){
    if ( dead == false ) {
    pacman.resize(50,50);
    image(pacman,x,y);
    }
    else{
      image(cherry,x,y);
      x_speed = 0;
      y_speed = 1;
    }
    for(i = 0; i < numghost; i++){
    if ( x >= ghost[i].x - pacman.width && x <= ghost[i].x + 2*pacman.width && y >= ghost[i].y - pacman.height && y <= ghost[i].y + 50){
      dead = true;  
      pacman[i] = cherry[i];
    }
    }    
    }
  
  void move(){
    if (x > width-50 || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 50) {
      y_speed *= -1;
    }
    if (y > 650) {
      y_speed *= -1;
    }
    x += x_speed;
    y += y_speed;
  
  if(time >= (frate * 10)){
  for (i = 0; i < numpacs; i++){ 
    if ( x >= pacman[i].x - pacman.width && x <= pacman[i].x + 2*pacman.width && y >= pacman[i].y - pacman.height && y <= pacman[i].y + 50){
     x_speed *= -1;
     y_speed *= -1;
    }
    }
  }
  }
}

class Ghost {
  
  float x;
  float y;
  float x_speed;
  float y_speed;
  float resizer = 50;
  boolean grow;
  
  Ghost (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed) {
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
   
  }
  
  void draw(){
    if(grow == false){
    ghost.resize(resizer,resizer);
    image(ghost,x,y);
    }
    else{
      ghost.resize(resizer,resizer);
      image(ghost,x,y);
      resizer += .5;
    }
    for(i = 0; i < numghost; i++){
    if ( x >= ghost[i].x - pacman.width && x <= ghost[i].x + 2*pacman.width && y >= ghost[i].y - pacman.height && y <= ghost[i].y + 50){
      grow = true;
    }
    }
  }
  
  void move(){
    if (x > width-55 || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 50) {
      y_speed *= -1;
    }
    if (y > 650) {
      y_speed *= -1;
    }
    x += x_speed;
    y += y_speed;
  }
  
}

class Cherry{
  float x;
  float y;
  float x_speed;
  float y_speed;
  
  Cherry (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  void draw(){
    cherry.resize(50,50);
    image(cherry,x,y);
  }
  
  void move(){
      x_speed = 0;
   
    if (y < 650) {
      y_speed = -1;
    }
    else{
      y_speed = 0;
    }
    x += x_speed;
    y -= y_speed;
  }
  
}


