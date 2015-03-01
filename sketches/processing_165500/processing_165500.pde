
float xCenter, yCenter;
float xVel, yVel;
float radius;
int barHeight;
int buttonWidth, buttonHeight;


boolean isOn;  //only two values: true or false


void setup(){
  size(800, 600);
  radius = 50;
  xCenter = width/2;
  yCenter = height/2;
  xVel = 4;
  yVel = 5;
  isOn = false;  //initially the circle will not move (the switch is OFF)
  barHeight = 80;
  buttonWidth = 120;
  buttonHeight = 50;
 
  
 

}

void draw(){
  
  background(#42B43A);
  
  rectMode(CORNER);
  fill(#33A6AF);
  rect(0, 0, width, barHeight);
  
  rectMode(CENTER);
  fill(200, 150);
  strokeWeight(3);
  stroke(200, 180);
  rect(30 + buttonWidth/2, barHeight/2, buttonWidth, buttonHeight);
  rect(2 * 30 + buttonWidth/2 + buttonWidth, barHeight/2, buttonWidth, buttonHeight);
  
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(14);
  text("START/STOP", 30 + buttonWidth/2, barHeight/2);
  text("RESET", 2 * 30 + buttonWidth/2 + buttonWidth, barHeight/2);
  
  if(isOn){
    if(xCenter < radius || xCenter > width - radius){
      xVel = -xVel;
    }
    if(yCenter < radius + barHeight || yCenter > height - radius){
      yVel = -yVel;
    }
    
    xCenter += xVel;  // xCenter = xCenter + xVel;
    yCenter += yVel;
  }
    
  pushMatrix();
    translate(xCenter, yCenter);
    fill(#E3DC50);
    noStroke();
    ellipse(0, 0, 2 * radius, 2 * radius);
  popMatrix();

}

void mouseClicked(){
  
  if(mouseX > 30 && mouseX < 30 + buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    isOn = !isOn; // !isOn gives the opposite of isOn
  }else if(mouseX > 2 * 30 + buttonWidth && mouseX < 2 * 30 + 2 * buttonWidth && mouseY > barHeight/2 - buttonHeight/2 && mouseY < barHeight/2 + buttonHeight/2){
    xCenter = random(radius, width - radius);
    yCenter = random(radius + barHeight, height - radius);
    xVel = random(-5, 5);
    yVel = random(-5, 5);
  }
}

void keyPressed(){
  if(key == 'd'){
    xVel++;
  }else if(key == 'a'){
    xVel--;
  }else if(key == 'w'){
    yVel--;
  }else if(key == 's'){
    yVel++;
  }
}



