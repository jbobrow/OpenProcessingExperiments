
//isolate and area of the interactive screen

void setup(){
  
  size(400,400);
  
}

void draw(){
  background(0);
  if(mouseX<200&&mouseY<200){
    
    rect(0,0,200,200);
    fill(12,19,255);
    
  }

if(mouseX>200&&mouseY<200){
  
  rect(200,0,200,200);
  fill(255,247,8);
  
}

if(mouseX>200&&mouseY>200){
  
  rect(200,200,200,200);
  fill(0,255,14);
  
}

if(mouseX<200&&mouseY>200){
  
  rect(0,200,200,200);
  fill(255,0,0);
  
}

}

