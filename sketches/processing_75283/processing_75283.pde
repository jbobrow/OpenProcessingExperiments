
int myColor;

void setup(){
  size(800, 600);
  background(34);
  colorMode(HSB, 255, 255, 255, 100);
  smooth();
  myColor = 0;
}

void draw(){
  for(int i =0; i < 500; i++){
  line(i*10,1*300,200,200);
  fill(234,56,345,1);
  ellipse(height/2, width/2, random(800, 600), 1);
 
  myColor++;
  fill(myColor, 50, 50);
  rect(mouseX, mouseY, pmouseX, pmouseY);
  
  stroke(255);
  strokeWeight(random(15));
  line(0, 0, mouseX, mouseY);
  
  
  stroke(0, 255);
  line(800, 600, mouseX, mouseY);
}
}

void mousePressed() {
  background(random(800));
  fill(255);
  ellipse(mouseX, mouseY, random(500), random(300));
  
  line(mouseX,mouseY, pmouseX, pmouseY);
  
  
  
}
