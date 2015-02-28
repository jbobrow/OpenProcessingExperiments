
PImage annette;
PImage jelly;
float x;
float y;
float directionX;
float directionY;

float x2;
float y2;
float directionX2;
float directionY2;

float x3;
float y3;
float directionX3;
float directionY3;

float x4;
float y4;
float directionX4;
float directionY4;

float x5;
float y5;
float directionX5;
float directionY5;

//float vx = 2;
float vy = 0;
float x6 = 0;
float y6 = 20;
float frictionx = .998;
float frictiony = -.75;          //the default setting
float gravity = .03;
float sec = 0;

void setup(){
  size(800,600);
 
  
  x = 100;
  y = 700;
  
  x2 = 200;
  y2 = 700;
  
  x3 = 450;
  y3 = 700;
  
  x4 = 650;
  y4 = 700;
  
  x5 = 750;
  y5 = 700;
  
  directionY = random(1,3);
  
  directionY2 = random(1,3);
  
  directionY3 = random(1,3);
  
  directionY4 = random(1,3);
  
  directionY5 = random(1,3);
  
  annette = loadImage("annetteJump.gif");
  jelly = loadImage("cartoon-jellyfish.gif");
  imageMode(CENTER);
}

void draw(){
 // phys();
  background(142,190,255);
   phys();
  image(jelly,x,y);
  image(jelly,x2,y2);
  image(jelly,x3,y3);
  image(jelly,x4,y4);
  image(jelly,x5,y5);
  //x -= directionX;
  y -= directionY;
  y2 -= directionY2;
  y3 -= directionY3;
  y4 -= directionY4;
  y5 -= directionY5;
  
if(y < 0){
 x = random(50,750);
 y = 700;
}
  
if(y2 < 0){
 x2 = random(50,750);
 y2 = 700;
}  

if(y3 < 0){
 x3 = random(50,750);
 y3 = 700;
}

if(y4 < 0){
 x4 = random(50,750);
 y4 = 700;
}

if(y5 < 0){
 x5 = random(50,750);
 y5 = 700;
}



  //image(jelly,100,200);
  //image(annette,80,100);
}

void phys(){
  vy += gravity;
  //vx *= frictionx;
  //x6 += vx;
  y6 += vy;
  if(y6 > height){
    fill(255,0,0);
   text("YOU LOSE",350,300);
   // vy *= frictiony;
  if(x6 > width){
   // vx *= -5;
    
  println(millis()/1000);
  //20-millis()/1000;
  println(sec);
  text("sec",500,300);
  }

}
if(dist(x6,y6,x,y)<= 100){
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}

if(dist(x6,y6,x2,y2)<= 100){
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}

if(dist(x6,y6,x3,y3)<= 100){
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}

if(dist(x6,y6,x4,y4)<= 100){
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}

if(dist(x6,y6,x5,y5)<= 100){
  //y6 = height;
   vy *= frictiony;
    vy -= 1.4;
}
   fill(123,12,85,35);
  image(annette,x6,y6-50);
 // fill(123,12,85,35);
 
 if((keyPressed ==true) && (keyCode == LEFT)){
   x6 -= 2;
   
 }
 
  if((keyPressed ==true) && (keyCode == RIGHT)){
   x6 += 2;
   
 }
 
 }

//void mouseReleased(){
  //vy -= .1;


