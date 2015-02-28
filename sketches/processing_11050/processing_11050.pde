
int ypos=0;
PImage bg;

void setup(){
  size(800, 600);
  frameRate(30);
 bg = loadImage("100DAYS.jpg");
  background(bg);
 smooth(); }

  void draw() {
    noStroke();
    fill(ypos-220,50,50);
    ellipse(random(0, width),ypos,random(5,15),random(10, 25)); 
   ypos+=5;
   if(ypos>height-5)
   ypos=0;
  } 

