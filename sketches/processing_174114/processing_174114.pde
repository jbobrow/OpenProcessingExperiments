
float fluidLevel; //depth of fluid
float radius, xCenter, yCenter, xVel, yVel, xAccel, yAccel;
float GRAVITY = 0.0000001;
float ballDensity, fluidDensity;
float fluidVel;

void setup(){
  size(600, 400);
  fluidLevel = height/2 + 50;
  radius = 50;
  xCenter = width/2;
  yCenter = 2 * radius;
  xVel = 0;
  yVel = 0;
  xAccel = 0;
  yAccel = 0;
  ballDensity = 5;
  fluidDensity = 7;
  
}

void draw(){
  background(255);
 
  fluidUpdate();
  displayFluid();
  //rect(0, height - fluidLevel, width, height - fluidLevel);
  ballUpdate();
  ballDisplay();
  //println(volUnder(yCenter, height - fluidLevel, radius));
  buttonDisplay(10, 10, 80, 50, color(#63AF3A), color(#8DF557), "Ball density \n -");
  buttonDisplay(100, 10, 80, 50, color(#63AF3A), color(#8DF557), "Ball density \n +");
  buttonDisplay(10, 70, 80, 50, color(#952D9B), color(#DA47E3), "Ball radius \n -");
  buttonDisplay(100, 70, 80, 50, color(#952D9B), color(#DA47E3), "Ball radius \n +");
  
  
}

void mouseClicked(){
  if(mouseOnButton(10, 10, 80, 50)){
    ballDensity -= 0.1;
    ballDensity = max(1, ballDensity);
  }else if(mouseOnButton(100, 10, 80, 50)){
    ballDensity += 0.1;
  }else if(mouseOnButton(10, 70, 80, 50)){
      radius -= 1;
      radius = max(1, radius);
  }else if(mouseOnButton(100, 70, 80, 50)){
    radius += 1;
  }
  
}

void fluidUpdate(){
//  fluidVel += (-fluidLevel + height/2)/500;
//  fluidLevel += fluidVel; 
}

void displayFluid(){
  fill(#57DCF5);
  noStroke();
  rect(0, height - fluidLevel, width, height);
}


void ballUpdate(){

    //yAccel = (4 * PI / 3.0 * pow(radius, 3)- volUnder(yCenter, height - fluidLevel, radius) * fluidDensity) * GRAVITY; 
   yAccel = (4 * PI / 3.0 * ballDensity * pow(radius, 3)- volUnder(yCenter, height - fluidLevel, radius) * fluidDensity) * GRAVITY;
   if( height - fluidLevel > yCenter + 0.9 * radius && height - fluidLevel < yCenter + 0.95 * radius){
     yVel = 0.4 * yVel;
     xVel = 0.4 * xVel;
   }
   if(yCenter > height - fluidLevel && yCenter < height + fluidLevel){
     yVel = 0.98 * yVel;
     xVel = 0.98 * xVel;
   }
 
  
   xVel += xAccel;
   yVel += yAccel; 
   xCenter += xVel;
   yCenter += yVel;
  
}

void ballDisplay(){
  fill(#2E8E32, 220);
  ellipse(xCenter, yCenter, 2 * radius, 2 * radius);
}
//The function caluclates the volume of the ball under the fluid
//The y coordiante of the ball center is y and the surface of fluid is at surface
float volUnder(float y, float surface, float r){
  float V;
  if(y <= surface - r){
    V = 0;
  }else if(y <= surface){
    V = PI/3.0 * sq(r - (surface - y)) * (2 * r + surface - y);
  }else if(y <= surface + r){
    V = PI/3 * (2 * pow(r, 3) + 3 * r * sq(y - surface) - pow(y - surface, 3));
  }else{
    V = PI * 4.0/3 * pow(r, 3);
  }
  return V;
}

boolean mouseOnButton(float left_, float top_, float width_, float height_){
  return mouseX > left_ && mouseX < left_ + width_ && mouseY > top_ && mouseY < top_ + height_;
}

void buttonDisplay(float left_, float top_, float width_, float height_, color color1_, color color2_, String caption_){
  rectMode(CORNER);
  if(mouseOnButton(left_, top_, width_, height_)){
    fill(color1_);
  }else{
    fill(color2_);
  }
  rect(left_, top_, width_, height_);
  textAlign(CENTER, CENTER);
  fill(0);
  text(caption_, left_ + width_ / 2, top_ + height_ / 2);
}



