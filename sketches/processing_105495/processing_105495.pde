
//this is not exactly what i wanted but pretty close! I only wanted the mouse clicking on purple ellipse to trigger the change.

int xPos1;
int yPos1;
int dia1;

int xPos2;
int yPos2;
int dia2;

boolean click;

void setup() {
  size(500, 500);
  background(255);
  
  
 xPos1 = width/2;
  yPos1 = height/2;
  dia1 = 50;
  
  xPos2 = width/2;
  yPos2 = height/2;
  dia2 = 25;
click = false;
}  

void draw(){
    background (255);
  xPos1 = mouseX;
  yPos1 = mouseY;
fill(0, 255, 0);
  ellipse(xPos1, yPos1, dia1, dia1);

 
 if (click){
   fill(0, 0, 255);
    triangle (0, height, width/2, 0, width, height);
      fill(255, 0, 255);
  ellipse(xPos2, yPos2, dia2, dia2);
  }
  else{
  
  fill(0, 255, 0);
  ellipse(xPos1, yPos1, dia1, dia1);
  }

if (mouseX > width/2 - 20 && mouseX < width/2 +20 && mouseY > height/2-20 && mouseY < height/2 + 20) { 
  fill(255, 0, 255);
  ellipse(xPos2, yPos2, dia2, dia2);
}
}


void mouseClicked() {
      background (255);
  xPos1 = mouseX;
  yPos1 = mouseY;
fill(0, 255, 0);
  ellipse(xPos1, yPos1, dia1, dia1);
  
  if (mouseX > xPos1-20 && mouseX < xPos1 + 20 && mouseY > yPos1 - 20 && mouseY <yPos1 + 20 || mouseX == xPos1 && mouseY == yPos1){
 click = !click;
}
}


