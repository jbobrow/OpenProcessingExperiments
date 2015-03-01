



float xSpeed = 4  ;
float ySpeed = 9;
//float accel;
float ballSize = 20;
float locX = 450;
float locY = 450;
float t;
float bounce;


void setup() {
  size(800, 800);
  smooth();
  background(0);
}


void draw() {
  frameRate(random(8,70));
  
  
  ySpeed = ySpeed + .2;

  //movement
  t = noise(255);
  //print(t);
  locX = locX + xSpeed;
  locY = locY + ySpeed + bounce;



  //borders


  if ((locX > width - (ballSize/2 )) || (locX < 0)) {
    xSpeed = xSpeed * -1;
  }

 


if ((locY > height + ballSize/2) || (locY < 0 - ballSize/2)) {
    ySpeed = ySpeed * -1;
    bounce = bounce + .4;
    print(bounce);
  }

//ball
noStroke();
fill(t * random(240,350),t * random(240,370),t * random(200,350),120);
ellipse(locX,locY,ballSize + (mouseX+mouseY)/15 + random(1,3),ballSize +(mouseX+mouseY)/15);
}

void mouseDragged(){
  fill(t * random(240,350),t * random(240,370),t * random(200,350),255);
  locX = mouseX;
  locY = mouseY;
  bounce = 0;
}


