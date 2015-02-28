
void setup() { 
  size(300,300);
  background(0);
  colorMode(RGB);   
  }
 
void draw() {
  strokeWeight(1);
  stroke(#FFFFFF);
  fill(#00A0E9);
  ellipse(150,150,mouseX,mouseY);
  fill(#E4007F);
  ellipse(0,50,mouseX,mouseY);
  fill(#FFF100);
  ellipse(300,250,mouseX,mouseY);
  
  noStroke();
  
 fill(random(255),random(255),random(255));
   
  if(mousePressed == true) { 
   ellipse(mouseX, mouseY, 15, 15);
  }
  }

