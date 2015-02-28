
void setup(){
 size(200,200);
}


void draw(){
  background(0,255,0);
  strokeWeight(10);
  
  float quadX = 0;
  float quadY = 0;

  
  line(width/2,0,width/2,height);
  line(0,height/2, width, height/2); 
  
  if(mouseX > width/2){
   quadX = width / 2;
  }
  if (mouseY > height / 2){
  quadY = height / 2;
  }
  fill(255,0,0);
  rect(quadX, quadY, width/2, height/2);
    
}

void keyPressed() {
   saveFrame("vierfaches rollover.png");
}

