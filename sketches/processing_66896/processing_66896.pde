
void setup(){
  size(500,500);
  smooth();
  background(0);
  
}

void draw(){
  frameRate(25);
  fill(255,249,46);
  for (int i=0; i<4; i++){
    ellipse(mouseX+random(0,50), mouseY+random(0,50), random(0,10), random(0,10)); 
 
 if(mouseX>=500){
   
 
 
  }
}
}
void mouseReleased(){
  stroke(random(0,255), random(0,255), random(0,255));
  //line(random(0,500), random(0,200), 0, 20);
}

void keyPressed(){
  if(key=='i'){
    noStroke();
    ellipse(mouseX, mouseY, random(5, 110), random(5,110));
  }
    
  
  if(key=='p'){
    noStroke();
    ellipse(mouseX, mouseY, random(5, 70), random(5,70));
  }
  
  fill(0);
 
  if(key=='e'){
    ellipse(mouseX, mouseY, random(5, 70), random(5,70));
  }
    
 
  if(key=='q'){
    noStroke();
    ellipse(mouseX, mouseY, random(5, 110), random(5,100));
  }
  
  if(key=='z'){
    background(0);
  }
}



