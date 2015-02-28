
float r=255;
float g=255;
float b=255;
void setup(){
  size(500,500);
  background(3,3,3);
}
void mousePressed() {
  background(0+mouseX, 0+mouseY, 0+mouseX);
}
void draw(){
  smooth();
  fill(152,58,191);
  stroke(152,58,191);
  ellipse(mouseX,mouseY,5,10);
  ellipse(500-mouseX,mouseY,5,10);
  keyPressed();
}
void keyPressed(){
  if (key=='a'){
    fill(62,20,201);
    stroke(62,20,201);
    ellipse(mouseX,mouseY,5,10);
    ellipse(500-mouseX,mouseY,5,10);
  }
  if (key=='s'){
    fill(47,155,58);
    stroke(47,155,58);
    ellipse(mouseX,mouseY,5,10);
    ellipse(500-mouseX,mouseY,5,10);
  }
  if (key=='d'){
    fill(242,32,24);
    stroke(242,32,24);
    ellipse(mouseX,mouseY,5,10);
    ellipse(500-mouseX,mouseY,5,10);
  }
  if (key=='g'){
    line(250,25,mouseX,mouseY);
    line(250,25,500-mouseX,mouseY);
    stroke(r-mouseX,g-mouseX,b-mouseY);
  }
  if (key=='f'){
  }
}



