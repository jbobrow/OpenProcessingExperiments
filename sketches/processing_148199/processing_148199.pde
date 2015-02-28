
PImage background;
PImage ship;
int rezX = 480;
int rezY = 800;
int moveSpeed =10;
int locX = 15;
int locY = -2;
boolean fire = false;
boolean spawn = true;
int rockX = int(random(40,60));
int rockY = 0;
int frame = 0;

//Resolution Convertion
//Calculating percentage based on resolution of x-axis
float prX (float intX){
  float percent = intX / 100;
  float x = rezX * percent;
  return(x);
}
 
//Calculating percentage based on resolution of y-axis
float prY (float intY){
  float percent = intY / 100;
  float y = rezY * percent;
  return(y);
}

void setup(){
  size(480,800);
  background = loadImage("background.jpg");
  ship = loadImage("ship.png");
  frameRate(60);
} 

void draw(){
  
  image(background,0,0);
  image(ship,prX(locX),prY(70));
  if (spawn == true){
    frame++;
  rect(prX(locX + 11),prY(locY),5,5); 
  rect(prX(rockX),prY(rockY), 50,50);
   rockX += random(-1,1);
   rockY += .1;}
   println(frame);
   
   if (locX >= rockX - 11 && locX<= rockX && locY >= rockY && locY <= rockY +7 ){
    spawn = false;

   }

   
if (fire == true){
  locY -=1  ;
}

if (spawn == false){
  textSize(30);
  text("You Win in: ", prX(15),prY(50));
  text(frame, prX(50),prY(50));
  text("Frames", prX(65  ),prY(50));
}

if (rockY >= 100   ){
  textSize(30);
  text("Game Over", prX(35),prY(50));
}


 // Controls a, d 
    if (keyPressed){
    if   (key == 'a'){
    moveLeft();
    }
  }
 
    if (keyPressed){
    if   (key == 'd'){
    moveRight();
      }
  }
  
    if (keyPressed){
    if   (key == 'w'){
     fire = true;  
     if (locY < 0){
       locY = 70;
     }
       
        
    }
  }
  

  
}


void keyReleased(){
  if (key == 'a'){
    moving = false;
  }
  else if (key == 'd'){
    moving = false;
  }
  
}

void logg(){
  rect(100,100,100,100);
}
 
void moveRight(){
  locX += 1;
  if (locX >= 70){
    locX = 70;
  }
//moving = true;
}

void moveLeft(){
  locX -= 1;
   if (locX <= 10){
    locX = 10;
  }
 // moving = true;
}

void shoot(){
  

}


