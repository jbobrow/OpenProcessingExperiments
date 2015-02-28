
float x = 4.6;
float xSpeed= 2.13;
float y = 7.1;
float ySpeed= 1.22;
float sCol = 255;
float sChange = 1;

void setup(){
  size(640,480);
  frameRate(30);
  background(0);
  smooth();
}

void draw(){
  
  fill(sCol,sCol*0.7,sCol*0.2,0.4);
  stroke(sCol,sCol*0.26,sCol*0.14,1);
  ellipseMode(CORNERS);
  ellipse(x,y,x*0.1,y*0.1);
  
  sCol= sCol - sChange;
  x = x + xSpeed;
  y = y + ySpeed;
  
 if((x > width)|| (x < 0)){
  xSpeed = xSpeed * -1;
  }
 if ((y > height) || (y < 0)){
   ySpeed = ySpeed * -1;
 }
 if ((sCol > 255) || (sCol < 0)){
   sChange *= -1;
 }
 saveFrame("menchito-######.png");
}

