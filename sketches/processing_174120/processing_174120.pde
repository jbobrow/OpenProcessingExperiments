
int dustNum = 5000;
float fluidLevel; //depth of fluid
float radius, xCenter, yCenter, xVel, yVel, xAccel, yAccel;
float GRAVITY = 0.0000001;
float ballDensity, fluidDensity;
float ductWidth = 200;
float windStrength = 2;
float[] dustX, dustY, dustVelX, dustVelY;
int timer = 0;

void setup(){
  //size(800, 600);
  size(600 , 900);
  fluidLevel = height/2;
  dustX = new float[dustNum];
  dustY = new float[dustNum];
  dustVelX = new float[dustNum];
  dustVelY = new float[dustNum];
  radius = 50;
  xCenter = 0;
  yCenter = 2 * radius;
  xVel = 0;
  yVel = 0;
  xAccel = 0;
  yAccel = 0;
  ballDensity = 5;
  fluidDensity = 7;
  createDust();
  
}

void draw(){
  background(255);
  fill(#57DCF5);
  noStroke();
  //rect(0, height - fluidLevel, width, height - fluidLevel);
  ballUpdate();
  ballDisplay();
  ductDisplay();
  dustUpdate();
  dustDisplay();
  //buttonDisplay(10, 10, 80, 50, color(#63AF3A), color(#8DF557), "Ball density \n -");
 // buttonDisplay(100, 10, 80, 50, color(#63AF3A), color(#8DF557), "Ball density \n +");
  buttonDisplay(10, 70, 80, 50, color(#952D9B), color(#DA47E3), "Ball radius \n -");
  buttonDisplay(100, 70, 80, 50, color(#952D9B), color(#DA47E3), "Ball radius \n +");
  //println(dustX[1]);
  timer++;
  onTimer();
  //println("Vert preassure = " + vertPreassure() + ", Hor preassure = " + horPreassure());
  
  
}

void mouseClicked(){
 // if(mouseOnButton(10, 10, 80, 50)){
 //   ballDensity -= 0.1;
 // }else if(mouseOnButton(100, 10, 80, 50)){
 //   ballDensity += 0.1;
 // }else
 if(mouseOnButton(10, 70, 80, 50)){
      radius -= 1;
      radius = max(1, radius);
  }else if(mouseOnButton(100, 70, 80, 50)){
    radius += 1;
  }
  
}

void keyPressed(){
  setup();
}

void onTimer(){
  //timer %= 2 ;
  //if(timer == 0){
    cleanDust();
  //}
}

void createDust(){
  for(int i = 0; i < dustNum; i++){
    dustX[i] = random(-width/2, width/2);
    dustY[i] = random(0, height);
  }
}

void cleanDust(){
  for(int i = 0; i < dustNum; i++){
    if(dustY[i] < 0){
      dustY[i] = height * 0.74;
      dustVelY[i] = 0;
    }else if(dustY[i] > height){
      dustY[i] = random(0, height);
      dustVelY[i] = 0;
    }
  }
}

void dustUpdate(){
  for(int i = 0; i < dustNum; i++){
    dustVelX[i] += random(-0.02, 0.02);
    dustVelY[i] += random(-0.02, 0.025) + windVelocity(dustX[i], dustY[i]);
    dustX[i] += dustVelX[i];
    dustY[i] += dustVelY[i];
    //dustY[i] = mod(dustY[i], height * 0.75);
    
    
  }
}

void dustDisplay(){
  //stroke(0);
  strokeWeight(2);
  stroke(#337E98);
  pushMatrix();
  translate(width/2, 0);
  for(int i = 0; i < dustNum; i++){
    point(dustX[i], dustY[i]);
    //ellipse(dustX[i], dustY[i], 10, 10);
  }
  popMatrix();
}


void ballUpdate(){

  // yAccel = 4 * PI / 3.0 * ballDensity * pow(radius, 3) * GRAVITY;
 
   yAccel = .28 +  vertPreassure();
   xAccel =  horPreassure();
   xVel += xAccel;
   //xVel += random(-0.3, 0.3);
   yVel = yVel + yAccel + windVelocity(xCenter, yCenter)* sq(radius/50);
   xCenter += xVel + random(-3,3);
   yCenter += yVel;
  
}

void ballDisplay(){
  fill(#F51652, 220);
  pushMatrix();
    translate(width/2, 0);
    ellipse(xCenter, yCenter, 2 * radius, 2 * radius);
  popMatrix();
}

void ductDisplay(){
  fill(#2D7C18);
  pushMatrix();
    translate(width/2, 0);
    rectMode(CENTER);
    rect(0, height * 0.9, ductWidth, height * 0.2);
    rect(0, height * 0.8, 2 * ductWidth, height * 0.1);
  popMatrix();
}

float windVelocity(float x_, float y_){
  if(x_ < -ductWidth || x_ > ductWidth){
    return 0;
  }else{
    //return (-1 + sq(x_/ductWidth)) * y_/height * windStrength ;
    return (-1 + sq(x_/ductWidth)) /(0.01 * (0.8* height - y_)) * windStrength ;
  }
}



float vertPreassure(){
  return abs(windVelocity(xCenter, yCenter + radius)) - abs(windVelocity(xCenter, yCenter - radius));
}

float horPreassure(){
  return abs(windVelocity(xCenter + radius, yCenter)) - abs(windVelocity(xCenter - radius, yCenter));
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


float mod(float a, float b){
  return a>=0? a%b : a%b + b; 
}



