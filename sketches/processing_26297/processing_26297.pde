
PFont chili; 
PImage cat;
float x = 100;
float y = 400;
float xspeed = 100; 
float yspeed = -100;



void setup(){
  size(600,600);
  chili= loadFont("Chiller-Regular-72.vlw");
  cat= loadImage("birthday-cat.jpg");
  x = 0;
  y = 0;
}

void draw(){
  background(255);
  image(cat, 50,50);
  text("happy birthday", x, y);
  fill(random(255),random(255),random(255));
  textSize(100);
  textFont(chili);
  x = x + xspeed;
  y = y + yspeed;

  
  if (x >=120){
    xspeed=-5;
  }
  if (x <=140){
    xspeed = 5;
  }
  if (y >= 520){
    yspeed = -5 ;
  }
  if (y <=500){
    yspeed = 5;
  }
  
  if (frameCount >= 600){
    yspeed=-5;
  }
  
}

