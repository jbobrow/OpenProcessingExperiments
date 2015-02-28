

float xpos = 350;
float ypos = 250;

void setup(){
  size(700,500);
  smooth();
  
}

void draw(){
  
  fill(255,random(255),random(255),40);
  stroke(255,random(50));
  ellipse(xpos,ypos, mouseX-mouseY,mouseY-mouseX);
  xpos = xpos + (mouseX - xpos)/25.0;
  ypos = ypos + (mouseY - ypos)/25.0;
 
  
  
}

