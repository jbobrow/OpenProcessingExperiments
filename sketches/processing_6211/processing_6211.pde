
void setup(){
  size(600,600);
  background(255);
  smooth();
  strokeWeight(3);
  fill(0,5,224);
  ellipse(width*0.5,height*0.5, width*0.66,height*0.66);
  line(width*0.5, 0, width*0.5,height);
  line(0,height*0.5,width,height*0.5);
  fill(214,84,231);
  ellipse(width*0.5,height*0.5, width*0.10,height*0.10);
}

void draw(){
  stroke(255);
  line(mouseX,mouseY,width*0.5,height*0.5);
}

