
int radius; 

void setup() {
  
   size(500,500);
}

void draw() {
   background(200,300,0);
  radius = mouseX;
     rect(mouseY, mouseX,20,20);
     stroke(155);
     rectMode(CENTER);
     rect(mouseX,mouseY,mouseX,mouseY);
     stroke(150);
}



