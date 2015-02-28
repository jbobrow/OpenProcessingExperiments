
PFont Josefin;
PImage bird;
int timerStart;
int currentTime;

int mill;
int minutes;
int seconds;

void setup(){
  
  size(500,500);
  smooth();
  bird = loadImage("bird.png");
  Josefin = loadFont("JosefinSlab-Light-55.vlw");
  textFont(Josefin);
  
  timerStart = 0;
  
}

void draw(){
  
  background(154,255,72);
  noStroke();
  
  image(bird, 40, 170);
  
  currentTime = millis();
  
  fill(255,155,5);
  rect((width/2)+110,(height/2)-60,40,80);
  ellipse((width/2)+110,(height/2)-20,80,80);
  ellipse((width/2)+150,(height/2)-20,80,80);
  
  
  fill(255);
  text((currentTime-timerStart)/1000, (width/2)+100, height/2);
  
  
  
}

void mousePressed(){
    timerStart = currentTime;
    
}

