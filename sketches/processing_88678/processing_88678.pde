
void setup(){
  size(300, 500); //size of applet
}

void draw(){
  background(50, 50, 50); //background colour
  noStroke(); //no stroke around shapes
  rect(20, 20, 260, 40); //position and size of rectangle
  if(mouseX > width/2-50 && mouseY > height/2-50 && mouseX < width/2+50 && mouseY < height/2+50){ //if condition this sets a boundary around the shapes
  fill(255, 0, 0);//colour for rectangle and circle
  }
  else fill(255); //else condition, the colour will change if mouse goes over shapes
  ellipse(width/2, height/2, 100, 100); //position and size of circle
}


