
float d;
float xPos;
float yPos;
float xVel;
float yVel;


void setup() { 
  size(400,400);
  background(200,0,200);
  smooth();
  noStroke();
  fill(255);
  frameRate(20);

d = random(100,100);
xPos = random(d/2, width - (d/2));
yPos = random(d/2, height - (d/2));
xVel = random(-3,3);
yVel = random(-3,3);
  }

void draw() {
  background(200,0,200);
  noStroke();
  fill(255);
  ellipse(xPos,yPos,d,d);
  
  xPos = xPos + xVel;
  yPos = yPos + yVel;
  
  if(xPos < (d/2)) {
    xVel = xVel*(-1);
     fill(255);
  }
  else if(yPos < (d/2)){    
  yVel = yVel*(-1);
   fill(255);
}
else if(xPos > width -(d/2)){
  xVel = xVel*(-1);
  fill(225);
}
else if (yPos > height- (d/2)){
  yVel = yVel*(-1);
  fill(255);

}

}
//    if(mouseX <= 30/2) x =--x;{

  
//    if(pmouseX < /2);
  
  
//  if(pmouseX !=0 && pmouseY !=0)
    //fill(0,170,255);
    
    //rect(0, 0, width, height);
    //background(250,170,200);
//    
//    fill(0,170,255);
//    line(mouseX, mouseY, pmouseX, pmouseY);
//  if(mouseX < width/4 || mouseX > width*3/4 || mouseY < height/4 || mouseY > height*3/4) {
////    fill(255);
////    ellipse(width/4,height/2, 20, 20);
//    background(200,0,200);
//  }
//  
//  {
//    fill(0);
//    ellipseMode(CORNER);
//    ellipse(width/4, height/4, width/2, height/2);
//  }



// this is a background
//    rectMode(RADIUS);
//    rect(0, 0, width, height);
//    noStroke();

//this is my ellipse




//ellipse(x, y, width, height)


