
float xCenter, yCenter;
float xVel, yVel;
float sideBarWidth;
float[] padY;
float[] padVel, padAccel;
float[] padLength;
float[] padFriction;
float radius;
float MAX_ACCEL = 1;
int state;
int[] score;

boolean isOn; //the variable isOn can take on only two values: true or false


void setup(){
  size(600, 600);
  sideBarWidth = width/25;
  state = 0;
  
  
  padLength = new float[2];
  padY = new float[2];
  padVel = new float[2];
  padAccel = new float[2];
  padFriction = new float[2];
  score = new int[2];
  
  for(int i = 0; i < 2; i++){
    padLength[i] = height/6;
    padY[i] = height/2;
    padVel[i] = 0;
    padAccel[i] = 0;
    padFriction[i] = 0.1;
    score[i] = 0;
  }
  
  radius = 30;
  xCenter = width/2;
  yCenter = height/2;
  ballReset(random(-1, 1) > 0 ? 1 : -1);
  isOn = false;

}

void draw(){
  
  background(#42B43A);
  
  fill(0);
  rectMode(CORNER);
  rect(0, 0, sideBarWidth, height);
  rect(width - sideBarWidth, 0, sideBarWidth, height);
  
  if(state != 0){
    stateUpdate();
  }
  
  ballUpdate();
  ballDisplay();
  padUpdate();
  padDisplay();
  scoreDisplay();
  
}

void stateUpdate(){
  switch(state){
    case 1: score[0] += 1;
            ballReset(state);
            state = 0;
            break;
    
    
    case -1: score[1] += 1;
             ballReset(state);
             state = 0;
             break;
  }
}

void ballReset(int i){
  int currentMillis = millis();
  while(millis() - currentMillis < 1000){
  }
  xCenter = width/2;
  yCenter = height/2;
  xVel = -i * int(random(2, 4));;
  yVel = int(random(2, 4));
  yVel = random(-1, 1) > 0 ? -1 * yVel : yVel;
  isOn = false;
}

void ballUpdate(){
if(isOn){
    if(xCenter <= radius + sideBarWidth){
      if(isOnPad(0)){
        xVel = -xVel;
      }else{
        state = -1;
      }
    }
    if(xCenter >= width - radius - sideBarWidth){
      if(isOnPad(1)){
        xVel = -xVel;
      }else{
        state = 1;
      }
    }
    if(yCenter <= radius || yCenter >= height - radius){
      yVel = -yVel;
    }
    
    if(state == 0){
      xCenter += xVel;  //xCenter = xCenter + xVel;
      yCenter += yVel;
    }
  }
}

void ballDisplay(){
  pushMatrix();
    translate(xCenter, yCenter);
    fill(#E3DC50);
    noStroke();
    ellipse(0, 0, 2 * radius, 2 * radius);
  popMatrix();

}


void padUpdate(){
  if(state == 0){
    for(int i = 0; i < 2; i++){
      if(padY[i] <= padLength[i]/2 && padVel[i] < 0){
        padVel[i] = 0;
        padY[i] = padLength[i]/2;
      }else if(padY[i] >= height - padLength[i]/2 && padVel[i] > 0){
        padVel[i] = 0;
        padY[i] = height - padLength[i]/2;
      }else{
        padVel[i] = (1 - padFriction[i]) * padVel[i] + padAccel[i];
        padY[i] += padVel[i];
      }
    }
  }
}

void padDisplay(){
  rectMode(CENTER);
  fill(#E82828);
  rect(sideBarWidth/2 , padY[0], sideBarWidth, padLength[0], padLength[0]/8);
  fill(#FCEBF0);
  rect(sideBarWidth/2 , padY[0], sideBarWidth, 0.6 * padLength[0]);
  fill(#3553C9);
  rect(width - sideBarWidth/2, padY[1], sideBarWidth, padLength[1], padLength[1]/8);
  fill(#DCE1F5);
  rect(width - sideBarWidth/2, padY[1], sideBarWidth, 0.6 * padLength[1]);
}

boolean isOnPad(int i){
  return(yCenter > padY[i] - padLength[i]/2 && yCenter < padY[i] + padLength[i]/2);
}

void scoreDisplay(){
  textAlign(CENTER, CENTER);
  textSize(height/10);
  fill(0, 100);
  text(score[0] + " : " + score[1], width/2, height/5);
}

void mouseClicked(){
  isOn = !isOn;  // ! changes isOn to the opposite value
}

void keyPressed(){
  

  if(key == 'o' || key =='O'){
    padAccel[1] -= MAX_ACCEL;
  }
  if(key == 'l' || key =='L'){
    padAccel[1] += MAX_ACCEL;
  }
  
  if(key == 'w' || key =='W'){
    padAccel[0] -= MAX_ACCEL;
  }
  if(key == 's' || key =='S'){
    padAccel[0] += MAX_ACCEL;
  }
  if(key == 'r'){
    setup();
  }
}

void keyReleased(){
  

  if(key == 'o' || key =='O'){
    padAccel[1] += MAX_ACCEL;
  }
  if(key == 'l' || key =='L'){
    padAccel[1] -= MAX_ACCEL;
  }
  if(key == 'w' || key =='W'){
    padAccel[0] += MAX_ACCEL;
  }
  if(key == 's' || key =='S'){
    padAccel[0] -= MAX_ACCEL;
  }
  if(key == ' '){
    isOn = !isOn;
  }
}








