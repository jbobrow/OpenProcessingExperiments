
void setup() {  
  size(600, 400);
  background(127,198,224);  
  colorMode(HSB);   
  counter = 0;
}

void draw() { 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { 
    ellipse(mouseX, mouseY, 80, 80);
  }
}
