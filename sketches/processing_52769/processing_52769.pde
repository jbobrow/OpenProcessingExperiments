
PImage puppy;
float x,y,dX,dY,easing;
float newTime = 0;

void setup(){
  size(1000,800);
  puppy = loadImage("puppy.jpg");
  x = 0;
  y = 0;
  easing = .01;
  noFill();
}

void draw(){
  background(255);
  dX = mouseX + x;
  dY = mouseY + y;
  
  x = x + dX*easing;
  y = y + dY*easing;
  image(puppy,x,y);
   line(mouseX,1, mouseY, 1); 
  if(y > 400) {
    image(puppy, 0, 0);
    image(puppy, x, y);
    x = 0;
    y = 0;
  }
  
  float currTime = millis()-newTime;
  textSize(50);
  fill(random(255),random(255),random(255));
  text(currTime/100,0,150);
  
  ellipse(mouseX-100,mouseY-100,50,50);
  fill(random(255),random(255),random(255),50);
}


