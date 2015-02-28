
float gravity = 9.75;
float time = 0;
float speedx=20;
float speedy=440;

int speed = 0;
int angle = 0;

String veloc = "";



void setup(){
size(800,600);
}
 
 
 void keyPressed() {
  if( key >= '0' && key <= '9' ){
    veloc+=char(key);
    if( abs( int( veloc ) ) > 1000 ){
        speed = int(veloc.substring(0,2));  
        angle = int(veloc.substring(2,4));
        println("Speed is " + speed + " m/sec");
        println("Angle is " + angle + " degree");
        time = time + 1;
    }
  } 
}
  


  
  
void draw() {
  

  
  background(129,201,255);
  strokeWeight(0);
fill(64,152,3);
rect(0,200,800,600);

fill(188,133,61);
rect(400,375,150,30);
rect(400,500,150,30);
rect(400,275,150,30);



rect(400,400,30,120);
rect(520,400,30,120);
rect(400,275,30,120);
rect(520,275,30,120);

PImage slingshot;
slingshot = loadImage("slingshot.png");
image(slingshot, 30, 450);


PImage pig;
pig = loadImage("pig.png");
image(pig, 460, 253);
image(pig, 410, 253);
image(pig, 510, 253);
image(pig, 435, 353);
image(pig, 485, 353);
image(pig, 435, 478);
image(pig, 485, 478);

text("Please Type a Magnitude (0-99) and an Angle (0-99). E.g. 1045 , Speed = 10, Angle = 45", 120, 30);


  
  PImage bird;
  bird = loadImage("bird.png");
  image(bird, speedx, speedy);
  
  speedx = speedx + (speed * cos(angle));
  speedy = speedy + (speed * -sin(angle)) + gravity*time;

}



