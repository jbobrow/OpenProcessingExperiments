
String myImage; 
PImage fish;
PImage bee;
PImage fluff;
int xPosition = 0;
int xPostulation=0;
int speed = 40;
int speedb = 5;
int num = 1;

void setup() {
  size(407,406);
fish = loadImage ("Photo on 2010-11-03 at 23.12 copy.jpg");
bee = loadImage ("Photo on 2010-11-03 at 23.13 #2 copy.jpg");
fluff = loadImage ("Photo on 2010-11-03 at 23.13 copy.jpg");

}

void draw () {
  background (fluff);
  tint (200,0,0, 50);
  image(fish,xPosition,0);  
  tint (100,70,200,100);
image (bee, speed, speed);


tint (200,100,150,70);
image(fish,xPostulation,0);  
tint (200,100,150,70);
image (fluff,xPostulation-400, 0);
tint(200,50,100,70);
image (bee, mouseX, mouseY);

xPosition = xPosition + speed;

  if (xPosition > width){
    speed = speed * -1;
  } else if (xPosition < 0){
    speed = speed * -1;
  } 
  
  xPostulation = xPostulation + speedb;
    
    if (xPostulation > width){
    speedb = speedb * -1;
  } else if (xPostulation < 0){
    speedb = speedb * -1;
  } 
  

}




