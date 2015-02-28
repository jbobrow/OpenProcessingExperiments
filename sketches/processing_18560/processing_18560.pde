
void setup(){
  size(400,400);
  background(255,255,255);
}

void draw(){
}

void mousePressed(){
  ellipseMode(CENTER);
  noStroke();
  fill(246,193,49);
  ellipse(mouseX,mouseY-10,12,12);
  ellipse(mouseX+9.5,mouseY-3.1,12,12);
  ellipse(mouseX-9.5,mouseY-3.1,12,12);
  ellipse(mouseX+5.8,mouseY+8,12,12);
  ellipse(mouseX-5.8,mouseY+8,12,12);
  
  ellipse(mouseX+30,mouseY-60-10,12,12);
  ellipse(mouseX+30+9.5,mouseY-60-3.1,12,12);
  ellipse(mouseX+30-9.5,mouseY-60-3.1,12,12);
  ellipse(mouseX+30+5.8,mouseY-60+8,12,12);
  ellipse(mouseX+30-5.8,mouseY-60+8,12,12);
  
  fill(255,255,255);
  ellipse(mouseX,mouseY,12,12);
  ellipse(mouseX+30,mouseY-60,12,12);
      
      stroke(166,200,88);
      strokeWeight(mouseX/50);
      line(0,mouseY,mouseX-20,mouseY);
      line(mouseX+20,mouseY,width,mouseY);
}
  
  
  
  

