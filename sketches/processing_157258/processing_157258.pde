
//Homework Day 3_Eliana Feng

PImage background;
int property=0;
PFont font;
float increment;
float posX;
float posY;

void setup(){
  size(1000,700);
  background=loadImage("starry-night-alex-ruiz.jpg");
  font=loadFont("Athelas-Regular-30.vlw");
  frameRate(10);
}

void draw(){
  //draw a background
  imageMode(CENTER);
  image(background,width/2,height/2,width,height);
  tint(random(200,255));

  //write texts
  float speed=5;
  float scale=map(sin(frameCount/speed),-1,1,1,2);
  textFont(font, scale*20);
  textAlign(CENTER,CENTER);
  text("Oh starry night,with a moonlit sky,",width/4,height/5);
  text("Take me away, and tell me why.",increment,height/4);
  text("I sit and think, all night.",width/4,height/3.3);
  increment++;
  
  
}

   

  
  


