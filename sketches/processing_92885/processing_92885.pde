
/*pjs@ preload="char.png, background.png";*/
//coded with the help of Isaac Schulz's code--> http://www.openprocessing.org/sketch/92791

PImage background;

class drive {
  PImage image;
  PVector direction;
  PVector position;
  PVector velocity;
  float speed;
  
  
}

drive car;
float left=0;
float right=0;
float up=0;
float down=0;


void setup() {
  size(800,400);
  background = loadImage("background.png");
  car =new drive();
  car.velocity = new PVector(1,0);
  car.position= new PVector(0,300);
  car.speed = 5;
}

void draw(){
  
  image(background,0,0);
  car.image=loadImage("char.png");
  car.velocity.x=(car.speed*(left+right));
  car.velocity.y=(car.speed*(up+down));
  car.position.add(car.velocity);
  
  car.position.x = constrain(car.position.x, 0, 700);
  car.position.y = constrain(car.position.y, 120, 310);
  
  

    
     
  pushMatrix();
  translate(car.position.x, car.position.y);
  image(car.image,0,0);
  popMatrix();
  
    
}



void keyPressed(){
   
  if(keyCode==UP){
    up=-1;
  }
  if(keyCode==DOWN){
    down=1;}
  if(keyCode==LEFT){
    left=-1; }
  if(keyCode==RIGHT){
    right=1;}
}   
 
void keyReleased(){
  if(keyCode==UP){
    up=0;}
  if(keyCode==DOWN){
    down=0;}
  if(keyCode==LEFT){
    left=0;}
  if(keyCode==RIGHT){
    right=0;}
}





