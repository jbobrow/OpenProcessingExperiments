
PImage robot;
PImage sky;
int i = 0;
float x; 
float y;
float easing = 0.01;
String title;
void setup(){
  size(500,500);
  smooth();
  sky = loadImage("cloudsky.jpg");
  robot = loadImage("robot.png");
  title = "happy robot.";
  
}

void draw(){
  
  float targetX = mouseX; 
  float targetY = mouseY;
  x += (targetX - x) * easing; 
  y += (targetY - y) * easing;
  
  image(sky, 0,0);
  image(robot, x-108, y-105);
  textSize(28);
  fill(0);
  text(title, 320, 480);
  fill(80);
  
  if(!mousePressed){
    ellipse(x-10,y+10, 15,15); //L eye open
    ellipse(x+50,y+10, 15,15); //R eye open
    noFill();
    strokeWeight(2);
    stroke(80);
    arc(x+20, y+10, 20,15,0,PI); //:)
  }else{
    noStroke();
    arc(x+20, y+10, 22,18,0,PI); //:D
    fill(80); 
    strokeWeight(2);
    arc(x-10,y+10, 15,15,PI, TWO_PI); //L eye squint
    arc(x+50,y+10, 15,15,PI, TWO_PI); //R eye squint
    stroke(80);
  }
    
  
  //leaf propellor
  ellipse(x+10,y-90,2,2);
  line(x+10,y-90, x+10, y-127);
  fill(157,236,155,155);
  
  
  if(i<3){
    ellipse(x+35,y-127,50,25);
    ellipse(x-15,y-127,50,25);
    i+=1;
  }else if(i>=3 && i < 6){
    ellipse(x+25,y-127,30,25);
    ellipse(x-5,y-127,30,25);
    i+=1;
  }else if(i>=6 && i< 8){
    ellipse(x+20,y-127,20,25);
    ellipse(x,y-127,20,25);
    i+=1;
  }else if(i>=8 && i< 11){
    ellipse(x+25,y-127,30,25);
    ellipse(x-5,y-127,30,25);
    i=0;
  }
  
}

