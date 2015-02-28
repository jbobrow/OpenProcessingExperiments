
int lag = 50;
void setup(){
  size(400,400);
  frameRate(30);
  background(255);
}


  
void mouseDragged(){
  delay(15);
  float rand = random(100);
  float rand2 = random(100);
  
  if (mouseX<width/2){
    smooth();
    fill(0,0,random(255),random(255)); 
    ellipse(mouseX,mouseY,rand, rand);
    delay(lag);
  }
  
  if (mouseX>width/2){
    rectMode(CENTER);
    fill(random(255),0,0,random(255));
    rect(mouseX,mouseY,rand,rand);
    delay(lag);
    
}
}



void draw(){
  if (mouseButton == RIGHT){
    background(255);
    delay(100);
  }
}

