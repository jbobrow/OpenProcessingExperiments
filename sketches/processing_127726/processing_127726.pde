
PImage myRide;
float shipX = 100;
float shipY = 100;
float speed = 5;
void setup(){
  background(0);
  size(500,500);
  myRide = loadImage("spaceship.jpg");
}
void draw(){
  background(0); 
  if(keyPressed){
    if(key == 'q'){
      shipY-=speed;
    }
    if(key == 'a'){
      shipY+=speed;
    }
    if(keyCode == LEFT){
      shipX-=speed;
    }
    if(keyCode == RIGHT){
      shipX+=speed;
    }
  } 
  image(myRide,shipX,shipY);
  text("Press Q, A, LEFT or RIGHT to move the spaceship", 20, 30);
}


