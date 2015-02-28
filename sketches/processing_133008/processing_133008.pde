
int columns;
int rows;

void setup() {
  size(500, 500);
  columns = width/3;
  rows = height/3;
  
}

void draw() {
  background(255);
  if(mouseX < columns) { //if mouse is in the first column make the shape red
   fill(255, 0, 0); 
  }
  else if(mouseX > columns && mouseX < columns *2){//if the mouse is in the second column make the shape green
    fill(0, 255, 0);
  }
  else { //if the mouse is in the third column make the shape blue
    fill(0, 0, 255);
  }
  
  if(mouseY < rows) {
     rectMode(CENTER);
     rect(width/2, height/2, width/4, height/4);
  }
  else if(mouseY > rows && mouseY < rows * 2)
  {
    ellipseMode(CENTER);
    ellipse(width/2, height/2, width/4, height/4);
  }
  else if(mouseY > rows*2)
  {
    rectMode(CENTER);
     rect(width/2, height/2, width/4, height/4);
  }

}


