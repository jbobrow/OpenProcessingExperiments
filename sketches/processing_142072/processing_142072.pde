
  int sorok=6;
  int oszlopok=22;

void setup () {
 
  size(800,400);
  background(0);
  frameRate(10);
 }

void draw () {

  int meretX=width/oszlopok;
  int meretY=height/sorok;
  
  int x=round(mouseX/meretX);
  int y=round(mouseY/meretY);
  
  int r=(int)random(255);
  int g=(int)random(255);
  int b=(int)random(255);

  strokeWeight(5);
 
  fill(r,g,b);

  rect(x*meretX,y*meretY,meretX,meretY);
 }
