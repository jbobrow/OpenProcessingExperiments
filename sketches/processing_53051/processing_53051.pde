
void setup(){
  size(200,200);
  smooth();
}

void draw(){
  background(125);
  if(mouseX > width/2 && mouseY < height/2){
    fill(0);
    rect(100,20,80,80);
  }else if (mouseX < width/2 && mouseY > height/2){
    fill(0);
    ellipseMode(CENTER);
    ellipse(50,150,80,80);
  }else if (mouseX < width/2 && mouseY < height/2){
    fill(255);
    stroke(0);
    ellipse (50,50,80,80);
  }else if(mouseX > width/2 && mouseY > height/2){
    fill(255);
      stroke(0);
      rect(100,110,80,80);
    }
}

