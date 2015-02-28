
int xpos, ypos, wdth, ht;
int xspeed, yspeed;
float Red, Green, Blue;

void setup(){
  size(400, 400);
  background(0);

  Red = 0;
  Green = 0;
  Blue = 0;

  xspeed = 3;
  yspeed = 10;

  wdth = 5;
  ht = 5;

  xpos = width/10;
  ypos = height/10;

  noStroke();
  frameRate(120);
}

void draw(){
  //background(Red, Green, Blue );

  fill(-Red, -Green, -Blue);
  ellipse (xpos, ypos, wdth, ht);    
  xpos += xspeed;
  ypos += yspeed;

  if (xpos>=width || xpos<=0 ){
    xspeed*= -1;
    
    Red =5 + Red;
    Blue = 68 + Blue;
    Green = 50 + Green;
  }
  if (ypos >= height || ypos <= 0){
    yspeed*= -1;
   
    Red =2 - Red ;
    Blue =34 - Blue;
    Green =50 - Green;

  }
}




