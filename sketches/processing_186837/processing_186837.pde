
float i = 0;
void setup() {
  size(600, 600);
}
void draw() {
  
i=i+0.05;
float posicionX = 60*sin(i);
float posicionY = 60*cos(i);
float posicionH = 250*cos(i);
background(posicionH+posicionX,posicionH,posicionH-posicionY,230);
if(mousePressed){
  ellipse(mouseX+posicionX, mouseY+posicionY, 20, 20);
  ellipse(mouseX+20+posicionX, mouseY+20+posicionY,20,20);
  ellipse(mouseX-20+posicionX, mouseY-20+posicionY,20,20);
  ellipse(mouseX+posicionY,mouseY+posicionX,20,20);
  ellipse(mouseX+20+posicionY, mouseY+20+posicionX,20,20);
  ellipse(mouseX-20+posicionY,mouseY-20+posicionX,20,20);
  }
  
  else{ 
  ellipse(mouseX-posicionX, mouseY-posicionY, 20, 20);
  ellipse(mouseX+20-posicionX, mouseY+20-posicionY,20,20);
  ellipse(mouseX-20-posicionX, mouseY-20-posicionY,20,20);
  ellipse(mouseX-posicionY,mouseY-posicionX,20,20);
  ellipse(mouseX+20-posicionY, mouseY+20-posicionX,20,20);
  ellipse(mouseX-20-posicionY,mouseY-20-posicionX,20,20);

  }
}
