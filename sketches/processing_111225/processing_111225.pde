
int radius=50;
int distance=radius/2;
int speed=6;
int direction=1;
int distancex=radius*3;
int directionx=5;
float r = random(200);


void setup(){
smooth();
size(600, 600);
colorMode(HSB, 360, 100, 100);
background(0, 20, 97);

}

void draw(){
  background(0, 20, 97);
  //fill(random(360), random(360), random(360));
  //ellipse(distance, distance, radius, radius);//distance in the x direction makes it bounce diagonally
  ellipse(distancex, distance, radius, radius);//the ball
  distance+=direction*speed;
  distancex+=direction*speed/2;//causes ball to bounce diagonally
  
  if (distance > height-radius/2) {
  //distance=-radius;//makes tranistion occur above the edge of the screen
direction = -direction;//makes it bounce once it hits bottom, but goes away when hits top again.
  } if (distance < 0+radius/2) {//how it bounces back from the top
    direction = -direction;
  }
if (distancex>width-radius/3){
  distancex=-directionx;
}
if (distancex<0+radius/2) {
  directionx=-directionx;
}
if (distance<20){//cahnges color when hits top
  fill(random(255), 360, 360);
}
if(distance>570){//changes color when hits bottom
  fill(random(255), 360, 360);
}
  
}
//
//==//if this is true and this is true
//&&//and and
//||// or or





