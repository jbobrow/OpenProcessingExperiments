
float xCenter1, yCenter1, xCenter2, yCenter2;
float xVel1, yVel1, xVel2, yVel2;
float xAccel1, yAccel1;
float radius;
int barHeight;
int buttonWidth, buttonHeight;
int button1Opacity, button2Opacity;
int opacity1, opacity2, opacity3;
color ball1Color, ball2Color;
color color1, color2;
float friction;

boolean isOn;  //only two values: true or false


void setup(){
  size(800, 600);
  radius = 40;
  xCenter1 = width/4;
  yCenter1 = height/2;
  xCenter2 = 0.75*width;
  yCenter2 = height/2;
  xVel1 = 4;
  yVel1 = 5;
  xVel2 = -4;
  yVel2 =  -3;
  xAccel1 = 0;
  yAccel1 = 0;
  friction = 0.05;
  isOn = false;  //initially the circle will not move (the switch is OFF)
  barHeight = 80;
  buttonWidth = 120;
  buttonHeight = 50;
  opacity1 = 180;
  opacity2 = 200;
  opacity3 = 150;
  button1Opacity = opacity2;
  button2Opacity = opacity2;
  color1 = color(#219526, 200);
  color2 = color(#4F62D8, 200);
  ball1Color = color1;
  ball2Color = color2;
 
  
 

}

void draw(){
  
  background(#FAFA97);
  fill(0);
  
  if(isOn){
    if(xCenter1 < radius || xCenter1 > width - radius){
      xVel1 = -xVel1;
    }else{
      xVel1 = (1 - friction) * xVel1 + xAccel1;
    }
    
    if(yCenter1 < radius + barHeight || yCenter1 > height - radius){
      yVel1 = -yVel1;
    }else{
      yVel1 = (1 - friction) * yVel1 + yAccel1;
    }
    
    xCenter1 += xVel1;  // xCenter = xCenter + xVel;
    yCenter1 += yVel1;
  }
  
  if(isOn){
    if(xCenter2 <= radius || xCenter2 >= width - radius){
      xVel2 = -xVel2;
    }
    if(yCenter2 <= radius + barHeight || yCenter2 >= height - radius){
      yVel2 = -yVel2;
    }
    
    xCenter2 += xVel2;  // xCenter = xCenter + xVel;
    yCenter2 += yVel2;
  }
    
  pushMatrix();
    translate(xCenter1, yCenter1);
    fill(ball1Color);
    noStroke();
    ellipse(0, 0, 2 * radius, 2 * radius);
  popMatrix();
  
  pushMatrix();
    translate(xCenter2, yCenter2);
    fill(ball2Color);
    noStroke();
    ellipse(0, 0, 2 * radius, 2 * radius);
  popMatrix();
  
  if(sq(xCenter1 - xCenter2) + sq(yCenter1 - yCenter2) <= sq(2 * radius)){
    ball1Color = color(255, 0, 0, 180);
    ball2Color = color(255, 0, 0, 180);
  }

rectMode(CORNER);
  fill(#33A6AF);
  rect(0, 0, width, barHeight);
  
  rectMode(CENTER);
  strokeWeight(3);
  stroke(200, 180);
  fill(button1Opacity, 150);
  rect(30 + buttonWidth/2, barHeight/2, buttonWidth, buttonHeight);
  //fill(200, button2Opacity);
  fill(button2Opacity, 150);
  rect(2 * 30 + buttonWidth/2 + buttonWidth, barHeight/2, buttonWidth, buttonHeight);
  
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(14);
  text("START/STOP", 30 + buttonWidth/2, barHeight/2);
  text("RESET", 2 * 30 + buttonWidth/2 + buttonWidth, barHeight/2);




}

void mouseClicked(){
  
  if(mouseX > 30 && mouseX < 30 + buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    isOn = !isOn; // !isOn gives the opposite of isOn
  }else if(mouseX > 2 * 30 + buttonWidth && mouseX < 2 * 30 + 2 * buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    xCenter1 = random(radius, width - radius);
    yCenter1 = random(radius + barHeight, height - radius);
    xVel1 = (random(-1,1)>0 ? 1 : -1 ) * random(2, 5);
    yVel1 = (random(-1,1)>0 ? 1 : -1 ) * random(2, 5);
    ball1Color = color1;
    
    xCenter2 = random(radius, width - radius);
    yCenter2 = random(radius + barHeight, height - radius);
    xVel2 = (random(-1,1)>0 ? 1 : -1 ) * random(2, 5);
    yVel2 = (random(-1,1)>0 ? 1 : -1 ) * random(2, 5);
    xAccel1 = 0;
    yAccel1 = 0;
    ball2Color = color2;
  }
}

void mousePressed(){
  
  if(mouseX > 30 && mouseX < 30 + buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    button1Opacity = opacity3;
  }else if(mouseX > 2 * 30 + buttonWidth && mouseX < 2 * 30 + 2 * buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    button2Opacity = opacity3;
  }
}

void mouseReleased(){
  
  if(mouseX > 30 && mouseX < 30 + buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    button1Opacity = opacity1;
    button2Opacity = opacity2;
  }else if(mouseX > 2 * 30 + buttonWidth && mouseX < 2 * 30 + 2 * buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    button1Opacity = opacity2;
    button2Opacity = opacity1;
  }else{
    button1Opacity = opacity2;
    button2Opacity = opacity2;
  }
}



void mouseMoved(){
  
  if(mouseX > 30 && mouseX < 30 + buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    button1Opacity = opacity1;
    button2Opacity = opacity2;
  }else if(mouseX > 2 * 30 + buttonWidth && mouseX < 2 * 30 + 2 * buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    button1Opacity = opacity2;
    button2Opacity = opacity1;
  }else{
    button1Opacity = opacity2;
    button2Opacity = opacity2;
  }
}

void keyPressed(){
  if(key == 'd'){
    xAccel1 = 1;
  }else if(key == 'a'){
    xAccel1 = -1;
  }else if(key == 'w'){
    yAccel1 =-1;
  }else if(key == 's'){
    yAccel1 = 1;
  }
}

void keyReleased(){
  if(key == 'd'){
    xAccel1 = 0;
  }else if(key == 'a'){
    xAccel1 = 0;
  }else if(key == 'w'){
    yAccel1 = 0;
  }else if(key == 's'){
    yAccel1 = 0;
  }
}



