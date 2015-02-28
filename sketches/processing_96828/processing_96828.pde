
  int ix = 150;
  int iy = 50;
  int xspeed = 4;
  int yspeed = 5;

void setup(){

  size(400,400);
  background(127);
  smooth();
}

void draw(){
   background(127);
  ellipse(ix,iy,20,20);
  ix = ix + xspeed;
  iy = iy + yspeed;
  
  if (ix>width - 10 || ix<10){
    xspeed = -xspeed;
  }
    if (iy>height - 10 || iy<10){
    yspeed = -yspeed;
  }
}


