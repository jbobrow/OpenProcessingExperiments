
void setup() {
  size(500,500);
}

void draw() {
  background(109,216,198);

// dividing lines
  stroke(240,139,39);
  line(height/2,0,width/2,height);
  line(0,height/2, width, height/2);
  
//mouse top left
  if(mouseX < width/2){
    if(mouseY <height/2){
        fill(115,229,210);
        noStroke();
        rect(0,0,250,250);
  }
  }
  
//mouse top right
  if(mouseX > width/2){
    if(mouseY <height/2){
        fill(96,190,175);
        noStroke();
        rect(250,0,250,250);
  }
  }
  
//mouse bottom right
  if(mouseX > width/2){
    if(mouseY > height/2){
        fill(77,152,140);
        noStroke();
        rect(250,250,250,250);
  }
  }

//mouse bottom left
  if(mouseX < width/2){
    if(mouseY > height/2){
        fill(45,88,81);
        noStroke();
        rect(0,250,250,250);
  }
  }
  
}
