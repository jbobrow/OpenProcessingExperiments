
float posX;
float posY;
float velocity;

void setup(){
  size(400,400);
  background(255);
  posX=random(40,width-40);//to make the initial position of the ball random.
  posY=random(40,height-40);//to make the initial position of the ball random.
  velocity=2.5;//to control the speed and direction of the ball
  fill(0,0,255);
  smooth();
  }

void draw(){
/*There are only two conditions that the ball can have:
one is out of the edges of the window, the other is inside the window. 
  */
  if(posX>=width-40||posX<=40){
    velocity=velocity*(-1);
  }
background(255);
posX+=velocity;
ellipse(posX,posY,80,80);
}
