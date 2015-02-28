
//Sheep Dog Game
PImage dog;
PImage sheep;
PImage win;
PImage miss;
float x;
float y;
float easing;
float dx;
float dy;
float mili, seconds, minutes;
//PFont font;

void setup(){
  size(800,800);
  smooth();
  background(41,149,27);
  dog = loadImage("BorderCollie.png");
  sheep = loadImage("Sheep.png");
  win = loadImage("Win.png");
  miss = loadImage("Lose.png");
  x=600;
  y=200;
  dx = mouseX - x;
  dy = mouseY - y;
  easing=.05;
  //font = loadFont("BellGothisStd-Black.otf");
  //textFont(font);
  textSize(20);
  noCursor();
}

void draw(){
  //field
  background(41,149,27);
  noStroke();
  fill(48,103,27);
  rect(300,500,200,200);
  strokeWeight(10);
  stroke(170,119,41);
  line(300,500,300,710);
  line(290,700,510,700);
  line(500,710,500,500);
  
  image(dog,mouseX,mouseY);
  image(sheep,x,y);
  
  if(x>=300 && x<=500 && y>=500 && y<=700){
    mili = 0;
    x = 360;
    y = 525;
    image(win, 0,0);
    //text("WINNER!", 50, 350);   
  }
  
  else{
    //Timer
  mili = millis();
  seconds = mili/1000;
  minutes = mili/60000;
  text("time elapsed: 0:" + int(seconds), 600, 40);
  }
  
  if(mili >= 7000){
    //if(seconds % 5 == 0){
    mili = 0;
    x = width + 10;
    y = height + 10;
    image(miss,0,0);
}
  
  if(x<0 || x>=width || y < 0 || y> height){
    image(miss,0,0);
  }
    else if(dist(mouseX,mouseY,x,y)<150){
      dx = mouseX - x;
      dy = mouseY - y;
      x = x - dx * easing;
      y = y - dy * easing;
    }
}
  


 

