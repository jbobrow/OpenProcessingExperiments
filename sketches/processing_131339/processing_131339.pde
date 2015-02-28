
int value = 0;
boolean brushOne = false;
boolean brushTwo = false;
boolean brushThree = false;
float angle = 0.0;
float s = 0.0;

void setup(){
  size(600,600);
  frameRate(30);
  background(200);
}

void draw(){
  fill(173,255,47);
  stroke(154,205,50);
  smooth();
  
  if(keyPressed){
    if(key == '1'){
      brushOne = true;
      brushTwo = false;
      brushThree = false;
    }
  }
  
  if(keyPressed){
    if(key == '2'){
      brushOne = false;
      brushTwo = true;
      brushThree = false;
    }
  }
  
  if(keyPressed){
    if(key == '3'){
      brushOne = false;
      brushTwo = false;
      brushThree = true;
    }
  }
   
  if(brushOne){
    if(mousePressed == true){
      if(mouseButton == LEFT){
        pushMatrix();
        translate(mouseX,mouseY);
        ellipse(0,0,30,30);
        popMatrix();
      }
    }
  }
  
  if(brushTwo){
    angle = angle + 0.07;
    noStroke();
    fill(255,random(255),255);
    if(mousePressed == true){
      if(mouseButton == LEFT){
        pushMatrix();
        translate(mouseX,mouseY);
        rotate(angle);
        triangle(0,35,15,10,30,35);
        popMatrix();
      }
    }
  }
  
  if(brushThree){
    s = s + 0.15;
    if(s >= 1.5){
      s -= 1.0;
    }
    angle = angle + 1.0;
    noStroke();
    fill(random(255),random(255),random(255));
    if(mousePressed == true){
      if(mouseButton == LEFT){
        pushMatrix();
        translate(mouseX,mouseY);
        scale(s);
        rotate(angle);
        rect(0,0,30,30);
        popMatrix();
      }
    }
  }
  
}



