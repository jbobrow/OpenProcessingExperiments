
int counter;
 
void setup() {  
  size(250, 250);
  background(2060);
  colorMode(HSB);   
  counter = 200;
}
 
void draw() { 
  counter++;
  noStroke();
  fill(random(500),289,995,30);
   
  if(mousePressed == true) { 
    ellipse(mouseX, mouseY, 20, 70);
  }
  else {
    ellipse(width/23, height/68, 200*sin(counter), 578*sin(counter));
  }
}
 

