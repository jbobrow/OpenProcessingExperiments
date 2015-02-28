
PFont f;
PImage back;
PImage bears;
PImage balloons1;
PImage balloons2;
PImage balloons3;
PImage boats;
float direction = 1;
float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;
int i;
void setup(){
  size(800,611);
  f = loadFont("MesquiteStd-200.vlw");
  back = loadImage("background.jpg");
  boats = loadImage("Boatsboats.png");
  bears = loadImage("Bearzzz.png");
  balloons1 = loadImage("balloonz.png");
  balloons2 = loadImage("Balloons2.png");
  balloons3 = loadImage("Balloons3.png");
  background(back);
  image(boats,0,449);
  frameRate(30);
}

void draw(){
  background(back);
  /*for(int g = 0; g<12; g+=2){
  rotate(angle+radians(g));
  image(balloons1, 0,0);
  image(balloons2,0,0);
  image(balloons3,0,0);
}
angle+=speed*angleDirection;
if((angle>QUARTER_PI) || (angle<0)){
  angleDirection*= -1;
}*/

//image(balloons1,0,0);
//image(balloons2,0,0);
//image(balloons3,0,0);

if((mouseY<250)){
  if(mouseX<60){
  image(balloons3,(mouseX-50),(mouseY-20));
}
}
if(mouseY<250){
  if(mouseX>60){
    image(balloons3,0,(mouseY-20));
    image(balloons2,0,(mouseY+30));
    image(balloons1,0,(mouseY*0.75));
  }
}
else{
  image(balloons3,0,0);
  image(balloons2,0,0);
  image(balloons1,0,0);
}

image(boats,0,449);

tint(random(100,255),random(100,255),random(100,255));
image(bears,0,0);



if(mouseX<400){
  if(mouseX>100){
  if(mousePressed){
    fill(random(66,110),31,26);
    rect(0,0,800,611);
     
    noFill();
   
    tint(random(100,255),0,random(100,150));
    image(balloons1,random(0,75),random(0,50));
    image(balloons2,random(0,35),random(0,60));
    image(balloons3,random(0,50),random(0,40));
    tint(random(150,255),0,0);
    scale(1.15);
    image(bears,random(0,20),random(-10,20));
    image(boats,0,400);
    textFont(f,200);
    fill(229,186,25,80);
    text("R O A R",(random(200,220)),150);
    text("R O A R",(random(30,50)),325);
    text("R O A R", (random(370,390)), 485);
    
  }
}
}


noTint();
if (i<400){
  i+=1*direction;
  translate(i,0);
  image(boats,i,449);
}

if(i>200){
  direction*=-1;
}
if (i<-300){
  direction*=-1;
}

  }
  




