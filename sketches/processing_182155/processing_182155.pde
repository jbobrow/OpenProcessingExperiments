

void setup(){
  size(255,255);

}

void draw(){
  background(0);
  stroke(255,255,255);
  strokeWeight(3);
  line(mouseX,mouseY,mouseX+width/10,mouseY+height/10);
  line(mouseX,mouseY,mouseX+width/10,mouseY-height/10);
  line(mouseX,mouseY,mouseX-width/10,mouseY-height/10);
  line(mouseX,mouseY,mouseX-width/10,mouseY+height/10); 
  fill(mouseX,0,0);
  ellipse(mouseX,mouseY,mouseY/2,mouseY/2); //elipse del mig
  fill(0,mouseX,0);
  ellipse(mouseX+width/8,mouseY-height/8,mouseY/4,mouseY/4);
  fill(0,0,mouseX);
  ellipse(mouseX-width/8,mouseY-height/8,mouseY/4,mouseY/4);
}


