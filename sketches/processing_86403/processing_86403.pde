
//creating variables
void setup(){
  size(600, 600);
  smooth();
}
int rgx = 100;
int rgy = 100;
int bex = int(random(300))+100;
int bey = int(random(300))+100;
int rox = 100;
int roy = 100;
void draw(){
  background(#E0FFFF);
  //Green square
  fill(#00FF00);
  noStroke();
  rect(rgx, rgy, 100,100);
  rgx+=3;
  rgx=constrain(rgx,0,400);
  // Blue circle
  fill(#0000FF);
  noStroke();
  ellipse(bex,bey, 100,100);
  bex+=1;
  bey+=1;
  bex=constrain(bex,0,500);
  bey=constrain(bey,200,400);
  //orange rectangle
  fill(#FF8000);
  noStroke();
  rect(rox,roy, 25,100);
  roy+=10;
  roy=constrain(roy,0,500);
}
