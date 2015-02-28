



//Sam Hazlett Assignment 9

boolean condition = false;

void setup () {
  size (1000,700);
  fill (70,100,210);
  background(40,40,250);
  img =loadImage ("missile1.png");
  b=loadImage("missile2.png");
  c=loadImage("Missile3.png");
  d=loadImage ("jetpack.gif");
  clouds=loadImage ("CLOUDS.jpg");
  jetpack= loadImage ("jetpack.gif");
  bird= loadImage ("BIRD.gif");
}


// Position Variables
float x=random(50);
float y=650;
float z=480;
float birdx = 50;
float birdy=80;

// Speed Variables
int speed=4;
float speed2=random(3,12);
float speed3=random (speed2+ random(-40,35));
float birdspeedx=random(3,11);
float birdspeedy=random (4,10);

//Image Variables
PImage img;
PImage b;
PImage c;
PImage d;
PImage clouds;
PImage jetpack;
PImage bird;


void draw() {
  background(40,40,250);
  image (clouds, 0,0);
  image(img, y,z);
  image (b,x,y/2+30);
  image (c,z,y);
  if (condition == false) {
    image (jetpack,mouseX-50,mouseY-50);
    image (bird, x+150,birdx);
    image (bird,birdx,birdy);
  }

  image (bird, x+150,birdx);
  //What Happens if you lose:
    if (condition ==true) {
      speed=0;
      speed2=0;
      speed3=0;
      birdspeedx=0;
      birdspeedy=0;
      fill (250,25,25);
      textSize (100);
      text ("GAME OVER", 200,350);
    }
    
    //LOSE Triggers
    
   if ((abs(mouseX-y))<80&&(abs(mouseY-z))<60){
     condition=true;
   }
   if ((abs(mouseX-x))<80&&(abs(mouseY-(y/2)))<60){
     condition=true;
   }
   if ((abs(mouseX-z))<80&&(abs(mouseY-y))<60){
     condition=true;
   }
     

  //Movement assignments
  birdx=birdx+birdspeedx;
  birdy=birdy+birdspeedy+ random (4);
  y=y+speed2;
  z=z+speed3;
  x=x+speed;
  
  //Wall Bounce Scripts
  if ((x<10)||(x>=680)){
    speed=speed*-1;
  }
  if ((y<20)||(y>680)){
    speed2=speed2*-1;
  }
  if ((birdx<20)||(birdx>680)){
    birdspeedx=birdspeedx*-1;
  }
    if ((birdy<20)||(birdy>680)){
    birdspeedy=birdspeedy*-1;
  }
  if ((z<20)||(z>680)){
    speed3=speed3*-1;
  }
  //Collision Scripts
  if((abs(x-y))<20){
    speed=speed*-1;
  }
  if((abs(x-z))<20){
    speed2=speed2*-1;
  }
  if((abs(y-z))<20){
    speed3=speed3*-1;
  }
}


// Mouse click Trigger- reverses direction.
void mousePressed () {
  speed=speed*-1;
  speed2=speed2*-1;
  speed3=speed3*-1;
  }
  

