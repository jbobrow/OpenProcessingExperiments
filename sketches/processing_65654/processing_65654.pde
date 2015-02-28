
PFont p;
void setup(){
  size(500,600);
  background(0);
 p = createFont("Arial", 100, true);
}

void draw(){  
  
  if(mouseY<100){
    fill(255, 0, 0);
  text("Red", mouseX, mouseY);
  }
  else if(mouseY<200){
    fill(255, 140, 0);
  text("Orange", mouseX, mouseY);
  }
  else if(mouseY<300){
    fill(255, 255, 0);
  text("Yellow", mouseX, mouseY);
  }
  else if(mouseY<400){
    fill(0, 230, 0);
  text("Green", mouseX, mouseY);
  }
  else if(mouseY<500){
    fill(20, 130, 240);
  text("Blue", mouseX, mouseY);
  }
  else{
    fill(150, 50, 200);
    text("Purple", mouseX, mouseY);
  }
}
void keyPressed(){
background(0);
}
