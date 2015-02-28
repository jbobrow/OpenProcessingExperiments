
int eyeRadius = 50;
float red, blue;
float angle, v, velocity;
float irisPosX, irisPosY, eyePosX, eyePosY;
float eyelidY, blinkTimer, a, temp;
int r;
boolean letsBlink;


void setup(){
 
 size(640, 480);
 red = 125;
 blue = 125;
 angle = 0;
 noStroke();
 ellipseMode(CENTER);
 rectMode(CENTER);
 eyePosX = width/2;
 eyePosY = height/2;

}

void draw(){
  
  red = map(velocity, 0, 50, 0, 255);
  blue = map(velocity, 0, 50, 255, 0);
  irisPosX = map(mouseX, 0, width, -30, 30);
  irisPosY = map(mouseY, 0, height, -20, 20);
  
  background(red, 0, blue);
  fill(255);
  
  velocity = constrain(v, 0, 50);
  v = constrain(v, -50, 50);
  println(velocity());

  if(velocity > 25){
    
    eyePosX = eyePosX + random(-(velocity-25)/3, (velocity-25)/3);
    eyePosY = eyePosY + random(-(velocity-25)/3, (velocity-25)/3);
  }
  else{
   
   eyePosX = eyePosX + (width/2 - eyePosX) * 0.01;
   eyePosY = eyePosY + (height/2 - eyePosY) * 0.01; 
  }
    
  leftEye(eyePosX - 150, eyePosY, map(velocity, 0, 50, -30, 30));
  rightEye(eyePosX + 50, eyePosY, map(velocity, 0, 50, -30, 30));
  if(millis()%5 == 0)
  {
    r = (int)random(1, 30);
  }
  if(r == 5){
    println("go!");
    letsBlink = true;
  }
  if(letsBlink){blink();}
}

void blink(){
    if(temp <= 75){
     eyelidY = eyelidY + (velocity*0.2 + 4);
     temp = eyelidY;
    }
    if(temp>75){
     eyelidY = eyelidY - (velocity*0.2+1);
     if(eyelidY < 0){
       temp = 0;
       letsBlink = false;
     }
    }
    
}

float velocity(){
 
 if(abs(pmouseX - mouseX) + abs(pmouseY - mouseY) > 40){
   v += 0.5;
 }
 else{
   v -= 0.5;
 }
 return velocity;
  
}

void leftEye(float x, float y, float angle){
  
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  fill(255);
  ellipse(0, 0, 100, 70);
  fill(red, 0, blue);
  rotate(radians (-angle));
  ellipse(irisPosX, irisPosY,40, 40);
  rotate(radians (angle));
  fill(red, 0, blue);
  rect(0, -30, 150, 60 + eyelidY);
  
  popMatrix();
  
}
void rightEye(float x, float y, float angle){
  
  pushMatrix();
  
  translate(x, y);
  rotate(radians(-angle));
  fill(255);
  ellipse(0, 0, 100, 70);
  fill(red, 0, blue);
  rotate(radians(angle));
  ellipse(irisPosX, irisPosY,40, 40);
  rotate(radians(-angle));
  fill(red, 0, blue);
  rect(0, -30, 150, 60 + eyelidY);
  
  popMatrix();
}


