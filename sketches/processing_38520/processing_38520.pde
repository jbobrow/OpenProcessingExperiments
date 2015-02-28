
//isolation of an area of the interactive screen

void setup(){
  size(400,400);
}

void draw(){
  background(255,255,255);
  if(mouseX < 200 && mouseY <200){
    noStroke();
    fill(38,149,198);
    rect(0,0,200,200);
    }
  if(mouseX > 200 && mouseY > 200){
    noStroke();
    fill(38,149,198);
    rect(200,200,200,200);
  }
  if(mouseX > 200 && mouseY < 200){
    noStroke();
    fill(38,149,198);
    rect(200,0,200,200);
  }
    if(mouseX < 200 && mouseY > 200){
    noStroke();
    fill(38,149,198);
    rect(0,200,200,200);
  }
}


