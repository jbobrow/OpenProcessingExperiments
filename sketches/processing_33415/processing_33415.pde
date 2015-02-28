
void setup(){
  size(600,400);
  background(255);
  smooth();
  frameRate(10);
  
  fill(255,0,0);
}

void draw(){
  //noStroke();
  //fill(255,0,0);
  //if(mousePressed){
    //rect(mouseX,mouseY,pmouseX,pmouseY);
  //}
  
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX,mouseY,pmouseX,pmouseY);
  
  
}

void mousePressed(){
  //choppy squares
  //rect(mouseX,mouseY,30,30);
  fill(0);
}

void mouseReleased(){
  fill(100);
}

//mouse is clicked and moving
void mouseDragged(){
  //background(255);
}

//mouse is not clicked and moving
void mouseMoved(){
  //background(0,0,255);
}

void keyPressed(){
  if(key=='k' || key=='K'){
    background(200);
  }
  
  if(key=='b' || key == 'n'){
    background(255,0,0);
  }
}

void keyReleased(){
  //it is standard to position interactive
  //features when key or mouse is RELEASED
}

                
                
