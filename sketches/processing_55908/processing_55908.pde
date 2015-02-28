
float vy, vx, x, y, x2, y2, frictiony, friction, frictionx, gravity, textSize;
int mode = 0;
PImage space;
PImage spaceship;
void setup(){
  size(700,700);
  vy = 1;
  vx = 10;
  x = 10;
  y= 200;
  x2 = 350;
  y2 = 100;
  frictiony = -.8; //cuts speed by half when hits ground
  frictionx = .9999; //slows horizontal movement
  gravity = .01; 
  textSize (30);
  smooth();
    space = loadImage("SPACE.png");
    spaceship = loadImage("Spaceship.jpeg");
  imageMode(CENTER);
   if (x>width){
    x = width;
    vx=-vx;
  }
  if (x<0){
    x=0;
    vx = -vx;
  }
  if (y>height){
    y=0;
    vy *=friction;
  }
if (y<0){
  y=0;
  vy *=friction;
}
}

 

void draw(){  
  background(space);
  


  //if (mode == 0){
    //startscreen();
  //} else if (mode == 1){
    fun();
  //}
 
  
      if (int(millis()/1000) > 10){
    background (255,0,0);
      } else if (dist(x,y,x2,y2)<25){
    text ("YOU SURVIVED",300,350);
    vy = 0;
    vx = 0;
    gravity = 0; 
      }
      }


void keyPressed(){
  if (key == CODED){
    if (keyCode == DOWN){
      vy +=3;
    }}
    

  if (key == CODED){
    if (keyCode == UP){
      vy -=3;
    }}}

    
void fun(){

   ellipse (x2,y2,50,50);
  pushMatrix();
  vy += gravity;// Pulling down gravity
  vx *= frictionx;
  x += vx;
  y += vy;
  if (y>height){
    y= height;
    vy *= frictiony;
  }
  if (x>width){
    x = width;
    x= -2;
  }
 
  
image(spaceship, x,y);
  popMatrix();
  text ("Land the Ship in Five", 100,600);
}

