
float xPos;
float xSpeed;
int xDir;
float yPos;
float ySpeed;
int yDir;
int bgFill;
float objFill1;
float objFill2;
float objFill3;
float objAlpha;
float radius;

void setup(){
  size(500,400);
  smooth();
  frameRate(60);
  xPos = width/2;
  xSpeed = 0;
  xDir = 1;
  yPos = height/2;
  ySpeed = 0;
  yDir = 1;
  bgFill = 0;
  objFill1 = 255;
  objFill2 = 255;
  objFill3 = 255;
  objAlpha = 1;
  radius = 1;
  smooth();
  noStroke();
  background(bgFill);
  fill(objFill1,objFill2,objFill3);
  ellipseMode(RADIUS);
}

void draw(){
  //fadeout as time passes
  fill(bgFill,objAlpha/100);
  rect(0,0,width,height);
  
  //radius determination
if(xSpeed*ySpeed>0){
  radius = 200/((xSpeed)*(ySpeed));
}
else if (xSpeed*ySpeed<0){
  radius = -200/((xSpeed)*(ySpeed));
}
else {
  radius = 0;
}
//alpha determination
if(xSpeed*ySpeed>1){
  objAlpha = 5*xSpeed*ySpeed;
}
else if (xSpeed*ySpeed<-1){
  objAlpha = -5*xSpeed*ySpeed;
}
else {
  objAlpha = 1;
}
//ellipse drawing parameters
  fill(objFill1,objFill2,objFill3,objAlpha);
  ellipse(xPos,yPos,radius*width/500,radius*height/500);
  xPos += xSpeed*xDir;
  xPos = constrain(xPos,0,width);
  yPos += ySpeed*yDir;
  yPos = constrain(yPos,0,height);
  if((xPos > width-radius)||(xPos<radius)){
    xDir = -xDir;

  }
  if((yPos > height-radius)||(yPos<radius)){
    yDir = -yDir;

  }


xSpeed = width/50000+15*cos(millis()/PI*1000);

ySpeed = height/50000+15*sin(millis()/PI*1000);

  objFill1 = 127+127*(cos(xPos*PI/100));
  objFill2 = 127+127*(cos(yPos*PI/100));
  objFill3 = 127+127*(sin(yPos*PI/100));

  println(objAlpha);
  println(radius);
  println(xSpeed);
  println(ySpeed);
}

