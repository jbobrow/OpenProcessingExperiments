
PImage face;
PImage left;
PImage right;
PImage boom;
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage evil;
PImage scared;
PImage stop;

float posA = 200;
float posB = 0;
float posC = 50;
float posD = 0;
float posE = 350;
float posF = 0;
float h = 50;
float speedY = 2;
float twospeedY = 2;
float threespeedY = 2;


int score = 0;
int lose = 0;

float x = 0;
float y = 0;
float xspeed = 10;
float yspeed = 10;
float r = 32;

int time;

int circleX = 250;
int circleXSpeed = 5;

void setup() {
  size(500,500);  
  smooth();
  frameRate(30);
  face=loadImage("face.png");
  right=loadImage("right.png");
  left=loadImage("left.png");
  boom=loadImage("boom.png");
  cloud1=loadImage("cloud1.png");
  cloud2=loadImage("cloud2.png");
  cloud3=loadImage("cloud3.png");
  evil=loadImage("evil.png");
  scared=loadImage("scared.png");
  stop=loadImage("stop.png");

}

void draw() {
  background(#B8D5FC);
 
  time=millis()/1000;
 
 //Player Character
image(cloud1, 50, 350);
cloud1.resize(200,100);

image(cloud2, 300, 50);
cloud2.resize(300,300);

image(cloud3, 50, 50);
cloud3.resize(200,150);

image(right,mouseX+40,mouseY-10);
right.resize(50,50);

image(left,mouseX-40,mouseY-10);
left.resize(50,50);
  
  strokeWeight(10);
  line(mouseX+38,mouseY+30,pmouseX+38,pmouseY+80);
  line(mouseX+10,mouseY+30,pmouseX+10,pmouseY+80);

 image(face,mouseX,mouseY); 
  face.resize(50, 50);
  


  //Juggle Face One
  
  if (time>2){
  image(scared,posA,posB);
  scared.resize(100,0); 
  speedY = speedY + 0.4;  
  posB = posB + speedY;

  if (dist(mouseX, mouseY, posA, posB) <=55) {
     posB = mouseY - h;
    speedY = speedY * -1; 
    score ++;
    image(boom,mouseX-125,mouseY-125);
  boom.resize(300,300);
  }
  
  if (posB >= 500){
    lose = 1;
  }
  
 }
     //Juggle Face Two
  
  if (time>6){
  image(scared,posC,posD);
  scared.resize(100,0); 
  twospeedY = twospeedY + 0.6;  
  posD = posD + twospeedY;

  if (dist(mouseX, mouseY, posC, posD) <=65) {
     posD = mouseY - h;
    twospeedY = twospeedY * -1;
   image(boom,mouseX-125,mouseY-125);
  boom.resize(300,300);
    score ++;
   }
   
   if (posD >= 500){
     lose = 1;
  }
   
  } 
    
     //Juggle Face Three
  
  if (time>10){
  image(scared,posE,posF);
  scared.resize(100,0); 
  threespeedY = threespeedY + 0.3;  
  posF = posF + threespeedY;

  if (dist(mouseX, mouseY, posE, posF) <=65) {
     posF = mouseY - h;
    threespeedY = threespeedY * -1;
   image(boom,mouseX-125,mouseY-125);
  boom.resize(300,300);
    score == 1;
   }
   
    if (posF >= 500){
     lose = 1;
  }
   
  } 
  
  
  //SCORE COUNTER
  text("Score: " + score,300,40);
  
  //ENEMY FACE
  
  if (time>2){
  
  image (evil, circleX, mouseX);
  evil.resize(50,50);
 
  circleX = circleX + circleXSpeed; 
 
  if (circleX > width) {
    circleXSpeed = -6;
  }
   
  if(circleX<0){
    circleXSpeed = 4;
   
 }
 
 if(dist(mouseX, mouseY, circleX, circleX)<=50){
   background(#FF0900);
   lose = 1;

 }
 
  }
 
 // LOSING SYSTEM 
 
 if (lose == 1){
  background(#FF0808);
  textSize(80);
 fill(#FF00E6);
  text("YOU LOSE!", 50, 250);
 } 

 // Barrier
 
 if (time>1){
 
 image(stop, 0, 25);
 stop.resize(0, 100);
 
 if (mouseY < 25){
   score--;
 }
 
 }

}


