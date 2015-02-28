
void setup() {
  size(400, 400);
  smooth();
}

void draw() {

  if(mousePressed){
    
     if(mouseX>=200) {
    fill(10, 10);
    rect(0, 0, width, height);

    fill(255);
    stroke(20);
    ellipse(mouseX, mouseY-100, mouseX-400, mouseX-400);
    ellipse(mouseX+100, mouseY+80, mouseX-400, mouseX-400);
    ellipse(mouseX-100, mouseY+80, mouseX-400, mouseX-400);
  }else{
    fill(10, 10);
    rect(0, 0, width, height);
   
    fill(255);
    stroke(20);
    ellipse(mouseX, mouseY-100, mouseX, mouseX);
    ellipse(mouseX+100, mouseY+80, mouseX, mouseX);
    ellipse(mouseX-100, mouseY+80, mouseX, mouseX);
  }
  
  }else{
     if(mouseX>=200) {
    fill(10, 10);
    rect(0, 0, width, height);

    fill(255);
    stroke(20);
    ellipse(mouseX, mouseY, mouseX-400, mouseX-400);
  }else{
    fill(10, 10);
    rect(0, 0, width, height);
   
    fill(255);
    stroke(20);
    ellipse(mouseX, mouseY, mouseX, mouseX);
  }
  
  }
}


